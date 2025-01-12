using FluentAssertions;
using System.Data;
using ArmyBuilder.Dao;
using ArmyBuilder.Domain;

namespace ArmyBuilder.Test.Dao
{
    public class ArmyBuilderRepositorySqliteTest : IClassFixture<DatabaseFixture>
    {
        private readonly IDbConnection _dbConnection;
        private readonly ArmyBuilderRepositorySqlite _repository;

        public ArmyBuilderRepositorySqliteTest(DatabaseFixture fixture)
        {
            _dbConnection = fixture.DbConnection;
            _repository = fixture.Repository;
        }

        [Fact]
        public void should_read_all_army_lists_when_connected_to_SQLite_database()
        {
            // act
            List<ArmyList> armyLists = _repository.ArmyLists();

            // assert
            armyLists.Should().HaveCount(15);
        }

        [Fact]
        public void should_read_all_main_models_for_given_army_list_id()
        {
            // arrange
            int armyListId = 7;

            // act
            List<MainModel> mainModels = _repository.MainModels(armyListId);

            // assert
            mainModels.Should().HaveCount(67);

            var mainModel = mainModels.First(m => m.Id == 11901);
            mainModel.ArmyCategory.Should().Be(ArmyCategory.Trooper);
            mainModel.Name.Should().Be("Schwertmeister von Hoeth");
            mainModel.Description.Should().Be("Schwertmeister, Geschosse beiseiteschlagen.");
            mainModel.Points.Should().Be(16.0F);

            var singleModel = mainModel.SingleModels.First();
            singleModel.Name.Should().Be("Schwertmeister");
            var profile = singleModel.Profile;
            profile.Movement.Should().Be(5);
            profile.WeaponSkill.Should().Be(5);
            profile.BallisticSkill.Should().Be(4);
            profile.Strength.Should().Be(5);
            profile.Toughness.Should().Be(3);
            profile.Wounds.Should().Be(1);
            profile.Initiative.Should().Be(7);
            profile.Attacks.Should().Be(1);
            profile.Moral.Should().Be(8);
        }

        [Fact]
        public void should_read_single_model_for_given_id()
        {

            // act 
            SingleModel singleModel = _repository.SingleModel(46811);

            // assert
            singleModel.Name.Should().Be("Schwertmeister");
            singleModel.Profile.Movement.Should().Be(5);
            singleModel.Profile.WeaponSkill.Should().Be(5);
            singleModel.Profile.BallisticSkill.Should().Be(4);
            singleModel.Profile.Strength.Should().Be(5);
            singleModel.Profile.Toughness.Should().Be(3);
            singleModel.Profile.Wounds.Should().Be(1);
            singleModel.Profile.Initiative.Should().Be(7);
            singleModel.Profile.Attacks.Should().Be(1);
            singleModel.Profile.Moral.Should().Be(8);
        }

        [Fact]
        public void should_read_main_model_for_given_id()
        {

            // act 
            MainModel mainModel = _repository.MainModel(11901);

            // assert
            mainModel.Name.Should().Be("Schwertmeister von Hoeth");
            var singleModel = mainModel.SingleModels.First();
            singleModel.Name.Should().Be("Schwertmeister");
            var profile = singleModel.Profile;
            profile.Movement.Should().Be(5);
            profile.WeaponSkill.Should().Be(5);
            profile.BallisticSkill.Should().Be(4);
            profile.Strength.Should().Be(5);
            profile.Toughness.Should().Be(3);
            profile.Wounds.Should().Be(1);
            profile.Initiative.Should().Be(7);
            profile.Attacks.Should().Be(1);
            profile.Moral.Should().Be(8);
        }

        [Fact]
        public void should_read_all_armies()
        {
            // act
            List<Army> armies = _repository.Armies();

            // assert
            armies.Should().HaveCount(1);
            Army army = armies.First();
            army.Name.Should().Be("Armee der Hochelfen von Tyr");
            army.Author.Should().Be("Torsten");
            army.ArmyList.Id.Should().Be(7);
            army.ArmyList.Name.Should().Be("Hochelfen");
            army.Points.Should().Be(472);
        }

        [Fact]
        public void should_read_army_when_id_is_given()
        {

            // act
            Army army = _repository.Army(1);

            // assert
            army.Name.Should().Be("Armee der Hochelfen von Tyr");
            army.ArmyList.Id.Should().Be(7);
            army.ArmyList.Name.Should().Be("Hochelfen");
            army.Author.Should().Be("Torsten");
            army.Points.Should().Be(472);
            army.Units.Should().HaveCount(2);

            Unit generalUnit = army.Units[0];
            generalUnit.Name.Should().Be("Generalseinheit");
            generalUnit.MainModels.Should().HaveCount(2);

            MainModel general = generalUnit.MainModels[0];
            general.Name.Should().Be("General");
            general.Count.Should().Be(1);
            general.ArmyCategory.Should().Be(ArmyCategory.Character);
            general.Points.Should().Be(160);
            general.SingleModels.Should().HaveCount(1);

            SingleModel singleModel = general.SingleModels[0];
            singleModel.Name.Should().Be("General");

            Profile profile = singleModel.Profile;
            profile.Movement.Should().Be(5);
            profile.WeaponSkill.Should().Be(7);
            profile.BallisticSkill.Should().Be(7);
            profile.Strength.Should().Be(4);
            profile.Toughness.Should().Be(4);
            profile.Wounds.Should().Be(3);
            profile.Initiative.Should().Be(9);

            MainModel spearmen = generalUnit.MainModels[1];
            spearmen.Name.Should().Be("Speerträger");
            spearmen.Count.Should().Be(20);

            Unit warChariotUnit = army.Units[1];
            warChariotUnit.Name.Should().Be("Streitwagen");
            MainModel warChariot = warChariotUnit.MainModels[0];
            warChariot.SingleModels.Should().HaveCount(3);


        }

        [Fact]
        public void should_create_new_army()
        {
            // arrange
            Army army = new Army("Testarmee");
            army.Author = "Testautor";
            army.ArmyList = new ArmyList { Id = 7, Name = "Hochelfen" };


            // act
            _repository.CreateArmy(army);

            // assert
            List<Army> armies = _repository.Armies();
            armies.Should().HaveCount(2);

            Army testArmy = armies[1];
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
            army.ArmyList = new ArmyList { Id = 7, Name = "Hochelfen" };
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
            army.ArmyList = new ArmyList { Id = 7, Name = "Hochelfen" };
            _repository.CreateArmy(army);

            // act
            _repository.DeleteArmy(army.Id);

            // assert
            List<Army> armies = _repository.Armies();
            armies.Should().HaveCount(1);
        }

        [Fact]
        public void should_create_new_unit()
        {
            // arrange
            Army army = new Army("Testarmee");
            army.Author = "Testautor";
            army.ArmyList = new ArmyList { Id = 7, Name = "Hochelfen" };
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
            army.ArmyList = new ArmyList { Id = 7, Name = "Hochelfen" };
            _repository.CreateArmy(army);
            Unit unit = new Unit("Testeinheit");
            _repository.CreateUnit(army.Id, unit);
            MainModel mainModel = new MainModel { Id = 11901, Name = "Schwertmeister von Hoeth", Count = 3 };
            unit.MainModels.Add(mainModel);

            // act
            _repository.AddMainModel(unit.Id, mainModel);

            // assert
            Army testArmy = _repository.Army(army.Id);
            testArmy.Units.Should().HaveCount(1);

            Unit testUnit = testArmy.Units[0];
            testUnit.Name.Should().Be("Testeinheit");
            testUnit.MainModels.Should().HaveCount(1);
            testUnit.MainModels[0].Count.Should().Be(3);

            // teardown
            _repository.DeleteArmy(army.Id);
        }

        [Fact]
        public void should_update_count_of_main_model_in_unit()
        {
            Army army = new Army("Testarmee");
            army.Author = "Testautor";
            army.ArmyList = new ArmyList { Id = 7, Name = "Hochelfen" };
            _repository.CreateArmy(army);
            Unit unit = new Unit("Testeinheit");
            _repository.CreateUnit(army.Id, unit);
            MainModel mainModel = new MainModel { Id = 11901, Name = "Schwertmeister von Hoeth", Count = 3 };
            unit.MainModels.Add(mainModel);
            _repository.AddMainModel(unit.Id, mainModel);

            // act
            _repository.UpdateMainModelCount(unit.Id, mainModel.Id, 5);

            // assert
            Army testArmy = _repository.Army(army.Id);
            testArmy.Units.Should().HaveCount(1);
            testArmy.Units[0].MainModels.Should().HaveCount(1);
            testArmy.Units[0].MainModels[0].Count.Should().Be(5);

            // teardown
            _repository.DeleteArmy(army.Id);
        }

        [Fact]
        public void should_delete_unit()
        {
            // arrange
            Army army = new Army("Testarmee");
            army.Author = "Testautor";
            army.ArmyList = new ArmyList { Id = 7, Name = "Hochelfen" };
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
        public void should_read_all_armor()
        {
            // act
            List<Armor> AllArmor = _repository.AllArmor();

            // assert
            AllArmor.Should().HaveCount(60);
            Armor armor = AllArmor[0];
            armor.Id.Should().Be(40);
            armor.Name.Should().Be("None");
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
        public void should_add_equipment_to_single_model()
        {
            // arrange
            int spearmenId = 46814;

            // act
            Equipment equipment = _repository.Equipment(spearmenId);

            // assert
            equipment.Slots.Should().HaveCount(4);
        }
    }
}