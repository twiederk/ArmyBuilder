using FluentAssertions;
using System.Data;
using ArmyBuilder.Dao;
using ArmyBuilder.Domain;
using Xunit;

namespace ArmyBuilder.Test.Dao
{
    public class ArmyBuilderRepositoryEquipmentSqliteTest : IClassFixture<DatabaseFixture>
    {
        private readonly IDbConnection _dbConnection;
        private readonly ArmyBuilderRepositorySqlite _repository;

        public ArmyBuilderRepositoryEquipmentSqliteTest(DatabaseFixture fixture)
        {
            _dbConnection = fixture.DbConnection;
            _repository = fixture.Repository;
        }

        [Fact]
        public void should_read_all_melee_weapons()
        {
            // act
            List<MeleeWeapon> AllMeleeWeapon = _repository.AllMeleeWeapon();

            // assert
            AllMeleeWeapon.Should().HaveCount(201);
        }

        [Fact]
        public void should_read_all_ranged_weapons()
        {
            // act
            List<RangedWeapon> AllRangedWeapon = _repository.AllRangedWeapon();

            // assert
            AllRangedWeapon.Should().HaveCount(21);
        }

        [Fact]
        public void should_read_all_shields()
        {
            // act
            List<Shield> AllShield = _repository.AllShield();

            // assert
            AllShield.Should().HaveCount(17);
            Shield shield = AllShield.FirstOrDefault(a => a.Id == 31);
            shield.Save.Should().Be(1);
        }

        [Fact]
        public void should_read_all_armor()
        {
            // act
            List<Armor> AllArmor = _repository.AllArmor();

            // assert
            AllArmor.Should().HaveCount(63);
            Armor armor = AllArmor[0];
            armor.Id.Should().Be(40);
            armor.Name.Should().Be("keine");
            armor.Description.Should().Be("");
            armor.ArmyList.Should().BeNull();
            armor.Magic.Should().BeFalse();
            armor.Points.Should().Be(0);

            Armor chaosShield = AllArmor.FirstOrDefault(a => a.Id == 5784);
            chaosShield.Id.Should().Be(5784);
            chaosShield.Name.Should().Be("Magische Kriegsbemalung");
            chaosShield.Description.Should().Be("RW von 3+ gegen Beschuß, 5+ im Nahkampf.");
            chaosShield.ArmyList.Should().Be(new ArmyList() { Id = 9, Name = "Orks & Goblins" });
            chaosShield.Magic.Should().BeTrue();
            chaosShield.Points.Should().Be(5);
        }

        [Fact]
        public void should_read_all_standards()
        {
            // act
            List<Standard> AllStandards = _repository.AllStandard();

            // assert
            AllStandards.Should().HaveCount(55);
        }

        [Fact]
        public void should_read_all_instruments()
        {
            // act
            List<Instrument> AllInstrument = _repository.AllInstrument();

            // assert
            AllInstrument.Should().HaveCount(2);
        }

        [Fact]
        public void should_read_all_misc()
        {
            // act
            List<Misc> AllMisc = _repository.AllMisc();

            // assert
            AllMisc.Should().HaveCount(88);
        }

        [Fact]
        public void should_read_equipment_of_high_elf_spearmen()
        {
            // arrange
            int spearmenId = 46814;

            // act
            Equipment equipment = _repository.Equipment(spearmenId);

            // assert
            equipment.Slots.Should().HaveCount(3);

            Slot meleeWeaponSlot = equipment.Slots.First(slot => slot.Id == 2220);
            meleeWeaponSlot.Item.Should().NotBeNull();
            meleeWeaponSlot.Item.Name.Should().Be("Speer");
            meleeWeaponSlot.Editable.Should().BeFalse();

            Slot shieldSlot = equipment.Slots.First(slot => slot.Id == 2222);
            shieldSlot.Item.Should().NotBeNull();
            shieldSlot.Item.Name.Should().Be("Schild");
            shieldSlot.Editable.Should().BeFalse();

            Slot armorSlot = equipment.Slots.First(slot => slot.Id == 2223);
            armorSlot.Item.Should().NotBeNull();
            armorSlot.Item.Name.Should().Be("Leichte Rüstung");
            armorSlot.Editable.Should().BeFalse();
        }

        [Fact]
        public void should_read_equipment_of_high_elf_Belannaer()
        {
            // arrange
            int belannaerId = 46369;

            // act
            Equipment equipment = _repository.Equipment(belannaerId);

            // assert
            equipment.Slots.Should().HaveCount(4);

            Slot slot = equipment.Slots.First(slot => slot.Id == 75);
            slot.Item.Should().NotBeNull();

            slot = equipment.Slots.First(slot => slot.Id == 76);
            slot.Item.Should().NotBeNull();

            slot = equipment.Slots.First(slot => slot.Id == 77);
            slot.Item.Should().NotBeNull();

            slot = equipment.Slots.First(slot => slot.Id == 78);
            slot.Item.Should().NotBeNull();
        }

        [Fact]
        public void should_return_custom_item_when_item_class_is_wrong()
        {
            // arrange
            SlotRdo slotRdo = new SlotRdo()
            {
                ItemId = 10000,
                ItemClass = ItemClass.MeleeWeapon,
            };

            // act
            Item item = _repository.SlotItem(slotRdo);

            // assert
            item.Should().NotBeNull();
            item.Name.Should().Be("ITEM ID 10000 NOT OF CLASS MeleeWeapon");
        }

        [Fact]
        public void should_read_equipments_of_army_list()
        {
            // arrange
            int armyListId = 7;
            int generalSingleModelId = 46491;
            int spearmentSingleModelId = 46814;

            // act
            List<Equipment> equipments = _repository.ArmyListEquipment(armyListId);

            // assert
            equipments.Should().HaveCount(55);

            // spearmen equipment
            Equipment spearmenEquipment = equipments.First(e => e.Id == spearmentSingleModelId);
            spearmenEquipment.Should().NotBeNull();
            spearmenEquipment.Slots.Should().HaveCount(3);
            Slot meleeWeaponSlot = spearmenEquipment.Slots.First(s => s.Id == 2220);
            meleeWeaponSlot.Magic.Should().BeFalse();

            // general equipment
            Equipment generalEquipment = equipments.First(e => e.Id == generalSingleModelId);
            generalEquipment.Should().NotBeNull();
            generalEquipment.Slots.Should().HaveCount(7);
            meleeWeaponSlot = generalEquipment.Slots.First(s => s.Id == 693);
            meleeWeaponSlot.Magic.Should().BeTrue();
        }

        [Fact]
        public void should_read_equipments_of_army()
        {
            // arrange
            int armyId = 1;
            int generalSingleModelId = 31;
            int spearmenSingleModelId = 21;

            // act
            List<Equipment> equipments = _repository.ArmyEquipment(armyId);

            // assert
            equipments.Should().HaveCount(16);

            // spearmen equipment
            Equipment spearmenEquipment = equipments.First(e => e.Id == spearmenSingleModelId);
            spearmenEquipment.Should().NotBeNull();
            spearmenEquipment.Slots.Should().HaveCount(3);
            Slot meleeWeaponSlot = spearmenEquipment.Slots.First(s => s.Id == 32);
            meleeWeaponSlot.Magic.Should().BeFalse();
            meleeWeaponSlot.Item.Name.Should().Be("Speer");
        }

        [Fact]
        public void should_update_item_id_of_slot()
        {
            // arrange
            int armyId = 1;            
            Slot slot = new Slot()
            {
                Id = 1,
                Item = new Item() { Id = 2 },
            };

            // act
            _repository.UpdateSlotItem(slot);

            // assert
            List<Equipment> equipments = _repository.ArmyEquipment(armyId);

            // assert
            Slot updatedSlot = equipments.SelectMany(e => e.Slots).First(s => s.Id == 1);
            updatedSlot.Item.Id.Should().Be(2);

            // tear down
            _repository.UpdateSlotItem(new Slot() { Id = 1, Item = new Item() { Id = 1 } });
        }
    }
}
