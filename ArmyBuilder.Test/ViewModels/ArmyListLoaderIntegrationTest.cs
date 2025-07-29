using ArmyBuilder.Dao;
using ArmyBuilder.Domain;
using ArmyBuilder.Test.Dao;
using ArmyBuilder.ViewModels;
using FluentAssertions;
using System.Data;

namespace ArmyBuilder.Test.ViewModels
{
    public class ArmyListLoaderIntegrationTest : IClassFixture<DatabaseFixture>
    {
        private readonly IDbConnection _dbConnection;
        private readonly ArmyBuilderRepositorySqlite _repository;
        private readonly ArmyListLoader _armyListLoader;

        public ArmyListLoaderIntegrationTest(DatabaseFixture fixture)
        {
            _dbConnection = fixture.DbConnection;
            _repository = fixture.armyBuilderRepository;
            _armyListLoader = new ArmyListLoader(_repository);
        }

        [Fact]
        public void should_return_empty_list_when_slot_is_not_editable()
        {
            // arrange
            var slot = new Slot
            { 
                ItemClass = ItemClass.MeleeWeapon,
                Editable = false,
            };
            var highElfArmyList = new ArmyListDigest { Id = 7, Name = "High Elf" };

            // act
            var result = _armyListLoader.selection(slot, highElfArmyList);

            // assert
            result.Should().BeEmpty();
        }

        [Fact]
        public void should_keep_selection_when_selection_contains_data()
        {
            // arrange
            MeleeWeapon meleeWeapon = new MeleeWeapon { Id = 1 };
            var slot = new Slot
            {
                ItemClass = ItemClass.MeleeWeapon,
                Editable = true,
                Selection = new List<Item>() { meleeWeapon }
            };
            var highElfArmyList = new ArmyListDigest { Id = 7, Name = "High Elf" };

            // act
            var result = _armyListLoader.selection(slot, highElfArmyList);

            // assert
            result.Should().HaveCount(1);
            result.Should().Contain(meleeWeapon);
        }

        [Fact]
        public void should_return_magic_and_non_magic_melee_weapons_of_high_elf_army_list()
        {
            // arrange
            var slot = new Slot
            {
                ItemClass = ItemClass.MeleeWeapon,
                Editable = true,
                Magic = true
            };
            var highElfArmyList = new ArmyListDigest { Id = 7, Name = "High Elf" };

            // act
            var result = _armyListLoader.selection(slot, highElfArmyList);

            // assert
            result.Should().HaveCount(61);
        }

        [Fact]
        public void should_return_non_magic_melee_weapons_of_high_elf_army_list()
        {
            // arrange
            var slot = new Slot
            {
                ItemClass = ItemClass.MeleeWeapon,
                Editable = true,
                Magic = false
            };
            var highElfArmyList = new ArmyListDigest { Id = 7, Name = "High Elf" };

            // act
            var result = _armyListLoader.selection(slot, highElfArmyList);

            // assert
            result.Should().HaveCount(8);
        }

        [Fact]
        public void should_load_equipment_with_selectable_items()
        {
            // arrange
            int highElfArmyListId = 7;

            // act
            List<Equipment> equipment = _repository.ArmyListEquipment(highElfArmyListId);

            // assert
            Equipment grenzreiterEquipment = equipment.First(e => e.Id == 46808);
            grenzreiterEquipment.Slots.Should().HaveCount(6);
            Slot meleeWeaponSlot = grenzreiterEquipment.Slots.First(s => s.Id == 4859);
            meleeWeaponSlot.Selection.Should().HaveCount(2);
        }
    }
}
