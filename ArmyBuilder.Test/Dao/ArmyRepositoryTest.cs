using FluentAssertions;
using System.Data;
using ArmyBuilder.Dao;
using ArmyBuilder.Domain;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace ArmyBuilder.Test.Dao
{
    public class ArmyRepositoryTest : IClassFixture<DatabaseFixture>
    {
        private readonly ArmyRepositorySqlite _repository;

        public ArmyRepositoryTest(DatabaseFixture fixture)
        {
            _repository = fixture.armyRepository;
        }

        [Fact]
        public void should_read_all_armies()
        {
            // act
            List<Army> armies = _repository.Armies();

            // assert
            armies.Should().HaveCount(2);
            Army army = armies.First();
            army.Name.Should().Be("Die Hochelfen von Tyr");
            army.Author.Should().Be("Torsten");
            army.ArmyList.Id.Should().Be(7);
            army.ArmyList.Name.Should().Be("Hochelfen");
            army.Points.Should().Be(1374);
        }

        [Fact]
        public void should_read_army_when_id_is_given()
        {

            // act
            Army army = _repository.Army(1);

            // assert
            army.Name.Should().Be("Die Hochelfen von Tyr");
            army.ArmyList.Id.Should().Be(7);
            army.ArmyList.Name.Should().Be("Hochelfen");
            army.Author.Should().Be("Torsten");
            army.Points.Should().Be(1374);
            army.Units.Should().HaveCount(6);

            Unit generalUnit = army.Units[0];
            generalUnit.Name.Should().Be("Tiranoc Streitwagen");
            generalUnit.MainModels.Should().HaveCount(1);

            MainModel general = generalUnit.MainModels[0];
            general.Name.Should().Be("Tiranoc Streitwagen");
            general.Count.Should().Be(1);
            general.ArmyCategory.Should().Be(ArmyCategory.WarMachine);
            general.OldPoints.Should().Be(72);
            general.SingleModels.Should().HaveCount(3);

            SingleModel singleModel = general.SingleModels[0];
            singleModel.Name.Should().Be("Streitwagenlenker");
            singleModel.MovementType.Should().Be(MovementType.OnFoot);
            singleModel.Mount.Should().BeFalse();

            Profile profile = singleModel.Profile;
            profile.Movement.Should().Be(5);
            profile.WeaponSkill.Should().Be(4);
            profile.BallisticSkill.Should().Be(4);
            profile.Strength.Should().Be(3);
            profile.Toughness.Should().Be(3);
            profile.Wounds.Should().Be(1);
            profile.Initiative.Should().Be(6);
            profile.Save.Should().Be(7);
        }

        [Fact]
        public void should_create_new_army()
        {
            // arrange
            Army army = new Army("Testarmee");
            army.Author = "Testautor";
            army.ArmyList = new ArmyListDigest { Id = 7, Name = "Hochelfen" };

            // act
            _repository.CreateArmy(army);

            // assert
            List<Army> armies = _repository.Armies();
            armies.Should().HaveCount(3);

            Army testArmy = armies[2];
            testArmy.Name.Should().Be("Testarmee");
            testArmy.Author.Should().Be("Testautor");
            testArmy.ArmyList.Id.Should().Be(7);
            testArmy.ArmyList.Name.Should().Be("Hochelfen");
            testArmy.Points.Should().Be(0);

            // teardown
            _repository.DeleteArmy(testArmy.Id);
        }

        [Fact]
        public void should_update_army()
        {
            // arrange
            Army army = new Army("Testarmee");
            army.Author = "Testautor";
            army.ArmyList = new ArmyListDigest { Id = 7, Name = "Hochelfen" };
            _repository.CreateArmy(army);
            army.Points = 100;

            // act
            _repository.UpdateArmy(army);

            // assert
            Army testArmy = _repository.Army(army.Id);
            testArmy.Points.Should().Be(100);

            // teardown
            _repository.DeleteArmy(army.Id);
        }

        [Fact]
        public void should_delete_army()
        {
            // arrange
            Army army = new Army("Testarmee");
            army.Author = "Testautor";
            army.ArmyList = new ArmyListDigest { Id = 7, Name = "Hochelfen" };
            _repository.CreateArmy(army);

            // act
            _repository.DeleteArmy(army.Id);

            // assert
            List<Army> armies = _repository.Armies();
            armies.Should().HaveCount(2);
        }

        [Fact]
        public void should_create_new_unit()
        {
            // arrange
            Army army = new Army("Testarmee");
            army.Author = "Testautor";
            army.ArmyList = new ArmyListDigest { Id = 7, Name = "Hochelfen" };
            _repository.CreateArmy(army);
            Unit unit = new Unit("Testeinheit");

            // act
            _repository.CreateUnit(army.Id, unit);

            // assert
            Army testArmy = _repository.Army(army.Id);
            testArmy.Units.Should().HaveCount(1);

            Unit testUnit = testArmy.Units[0];
            testUnit.Name.Should().Be("Testeinheit");

            // teardown
            _repository.DeleteArmy(army.Id);
        }

        [Fact]
        public void should_add_main_model_to_unit()
        {
            // arrange
            Army army = new Army("Testarmee");
            army.Author = "Testautor";
            army.ArmyList = new ArmyListDigest { Id = 7, Name = "Hochelfen" };
            _repository.CreateArmy(army);
            Unit unit = new Unit("Testeinheit");
            _repository.CreateUnit(army.Id, unit);
            var equipment = new Equipment();
            equipment.Slots.Add(new Slot { Id = 2222, Item = new Shield { Id = 1, Name = "Silburaschild" }, Magic = true, Editable = false, ItemClass = ItemClass.Shield });
            equipment.Slots.Add(new Slot { Id = 2223, Item = new Armor { Id = 2, Name = "Leichte Rüstung" }, Magic = false, Editable = true, ItemClass = ItemClass.Armor});
            SingleModel singleModel = new SingleModel
            { 
                Id = 46811,
                Name = "Schwertmeister",
                Description = "Schwertmeister, Geschosse beiseiteschlagen.",
                Profile = new Profile { Id = 11901 },
                MovementType = MovementType.OnFoot,
                Equipment = equipment
            };
            MainModel mainModel = new MainModel { Id = 11901, Name = "Schwertmeister von Hoeth", Count = 3 };
            mainModel.AddSingleModel(singleModel);
            unit.MainModels.Add(mainModel);

            // act
            _repository.AddMainModel(unit.Id, mainModel);

            // assert
            Army testArmy = _repository.Army(army.Id);
            testArmy.Units.Should().HaveCount(1);

            Unit testUnit = testArmy.Units[0];
            testUnit.Name.Should().Be("Testeinheit");
            testUnit.MainModels.Should().HaveCount(1);
            var testMainModel = testUnit.MainModels[0];
            testMainModel.Count.Should().Be(3);
            testMainModel.SingleModels.Should().HaveCount(1);
            var testSingleModel = testMainModel.SingleModels[0];
            testSingleModel.Name.Should().Be("Schwertmeister");
            testSingleModel.MovementType.Should().Be(MovementType.OnFoot);
            testSingleModel.Mount.Should().BeFalse();

            // teardown
            _repository.DeleteArmy(army.Id);
        }

        [Fact]
        public void should_update_main_model_in_unit()
        {
            Army army = new Army("Testarmee");
            army.Author = "Testautor";
            army.ArmyList = new ArmyListDigest { Id = 7, Name = "Hochelfen" };
            _repository.CreateArmy(army);
            Unit unit = new Unit("Testeinheit");
            _repository.CreateUnit(army.Id, unit);
            MainModel mainModel = new MainModel { Id = 11901, Name = "Schwertmeister von Hoeth", Count = 3, StandardBearer = false, Musician = false };
            unit.MainModels.Add(mainModel);
            _repository.AddMainModel(unit.Id, mainModel);
            mainModel.Count = 5;
            mainModel.StandardBearer = true;
            mainModel.Musician = true;

            // act
            _repository.UpdateMainModel(unit.Id, mainModel);

            // assert
            Army testArmy = _repository.Army(army.Id);
            testArmy.Units.Should().HaveCount(1);
            testArmy.Units[0].MainModels.Should().HaveCount(1);

            MainModel updatedMainModel = testArmy.Units[0].MainModels[0];
            updatedMainModel.Count.Should().Be(5);
            updatedMainModel.StandardBearer.Should().BeTrue();
            updatedMainModel.Musician.Should().BeTrue();

            // teardown
            _repository.DeleteArmy(army.Id);
        }

        [Fact]
        public void should_delete_unit()
        {
            // arrange
            Army army = new Army("Testarmee");
            army.Author = "Testautor";
            army.ArmyList = new ArmyListDigest { Id = 7, Name = "Hochelfen" };
            _repository.CreateArmy(army);
            Unit unit = new Unit("Testeinheit");
            _repository.CreateUnit(army.Id, unit);
            MainModel mainModel = new MainModel { Id = 11901, Name = "Schwertmeister von Hoeth", Count = 3 };
            unit.MainModels.Add(mainModel);
            _repository.AddMainModel(unit.Id, mainModel);

            // act
            _repository.DeleteUnit(unit.Id);

            // teardown
            _repository.DeleteArmy(army.Id);
        }

        [Fact]
        public void should_add_single_model_to_main_model()
        {
            // arrange
            Army army = new Army("Testarmee");
            army.Author = "Testautor";
            army.ArmyList = new ArmyListDigest { Id = 7, Name = "Hochelfen" };
            _repository.CreateArmy(army);

            Unit unit = new Unit("Testeinheit");
            _repository.CreateUnit(army.Id, unit);

            SingleModel generalSingleModel = new SingleModel
            {
                Id = 46811,
                Name = "General",
                Description = "General description",
                Profile = new Profile { Id = 11901, Movement = 5, WeaponSkill = 5, BallisticSkill = 4, Strength = 3, Toughness = 3, Wounds = 1, Initiative = 7, Attacks = 1, Moral = 8, Points = 10, Save = 7 },
                MovementType = MovementType.OnFoot,
            };
            MainModel mainModel = new MainModel { Name = "General", Count = 1 };
            mainModel.AddSingleModel(generalSingleModel);
            unit.MainModels.Add(mainModel);

            _repository.AddMainModel(unit.Id, mainModel);

            SingleModel mountSingleModel = new SingleModel
            {
                Id = 46812,
                Name = "Mount",
                Description = "Mount description",
                Profile = new Profile { Id = 11902, Movement = 6, WeaponSkill = 4, BallisticSkill = 3, Strength = 4, Toughness = 4, Wounds = 2, Initiative = 6, Attacks = 2, Moral = 7, Points = 15, Save = 6 },
                MovementType = MovementType.OnMount,
                Equipment = new Equipment()
            };

            // act
            _repository.AddSingleModel(mainModel.Id, mountSingleModel);

            // assert
            Army updatedArmy = _repository.Army(army.Id);
            updatedArmy.Units.Should().HaveCount(1);
            Unit updatedUnit = updatedArmy.Units[0];
            MainModel updatedMainModel = updatedUnit.MainModels[0];
            updatedMainModel.SingleModels.Should().HaveCount(2);

            // teardown
            _repository.DeleteArmy(army.Id);
        }
    }
}
