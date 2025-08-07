using FluentAssertions;
using ArmyBuilder.Dao;
using ArmyBuilder.Domain;

namespace ArmyBuilder.Test.Dao
{
    public class ArmyListRepositoryTest : IClassFixture<DatabaseFixture>
    {
        private readonly ArmyListRepositorySqlite armyListRepository;

        public ArmyListRepositoryTest(DatabaseFixture fixture)
        {
            armyListRepository = fixture.armyListRepository;
        }

        [Fact]
        public void should_read_all_army_lists_when_connected_to_SQLite_database()
        {
            // act
            List<ArmyListDigest> armyLists = armyListRepository.ArmyLists();

            // assert
            armyLists.Should().HaveCount(15);
        }

        [Fact]
        public void should_read_all_main_models_for_given_army_list_id()
        {
            // arrange
            int armyListId = 7;
            int drachenprinzId = 11900;
            int schwertmeisterId = 11901;


            // act
            List<MainModel> mainModels = armyListRepository.MainModels(armyListId);

            // assert
            mainModels.Should().HaveCount(42);

            // Schwertmeister von Hoeth
            var mainModel = mainModels.First(m => m.Id == schwertmeisterId);
            mainModel.ArmyCategory.Should().Be(ArmyCategory.Trooper);
            mainModel.Name.Should().Be("Schwertmeister von Hoeth");
            mainModel.Description.Should().Be("Schwertmeister, Geschosse beiseiteschlagen.");
            mainModel.OldPoints.Should().Be(16.0F);

            var singleModel = mainModel.SingleModels.First();
            singleModel.Name.Should().Be("Schwertmeister");
            singleModel.MountSave.Should().Be(0);

            var profile = singleModel.Profile;
            profile.Movement.Should().Be(5);
            profile.WeaponSkill.Should().Be(5);
            profile.BallisticSkill.Should().Be(4);
            profile.Strength.Should().Be(3);
            profile.Toughness.Should().Be(3);
            profile.Wounds.Should().Be(1);
            profile.Initiative.Should().Be(7);
            profile.Attacks.Should().Be(1);
            profile.Moral.Should().Be(8);
            profile.Points.Should().Be(10);
            profile.Save.Should().Be(7);

            List<Figure> figures = mainModel.Figures;
            figures.Should().HaveCount(4);
            Figure figure = figures.First();
            figure.ImagePath.Should().Be(@"HighElves\HighElf_SwordMasterOfHoeth.jpg");

            // Drachenprinz von Caledor
            mainModel = mainModels.First(m => m.Id == drachenprinzId);
            mainModel.ArmyCategory.Should().Be(ArmyCategory.Trooper);
            mainModel.Name.Should().Be("Drachenprinzen von Caledor");
            mainModel.Description.Should().Be("Banner von Caledor");
            mainModel.OldPoints.Should().Be(43.0F);

            singleModel = mainModel.SingleModels.First();
            singleModel.Name.Should().Be("Drachenprinz");
            singleModel.MountSave.Should().Be(1);

            profile = singleModel.Profile;
            profile.Movement.Should().Be(5);
            profile.WeaponSkill.Should().Be(5);
            profile.BallisticSkill.Should().Be(4);
            profile.Strength.Should().Be(3);
            profile.Toughness.Should().Be(3);
            profile.Wounds.Should().Be(1);
            profile.Initiative.Should().Be(7);
            profile.Attacks.Should().Be(1);
            profile.Moral.Should().Be(8);
            profile.Save.Should().Be(7);

            figures = mainModel.Figures;
            figures.Should().HaveCount(3);
            figures[0].ImagePath.Should().Be(@"HighElves\HighElf_Dragonprince.jpg");
            figures[0].NumberOfFigures.Should().Be(9);
            figures[1].ImagePath.Should().Be(@"HighElves\HighElf_Dragonprince_Fighter.jpg");
            figures[1].NumberOfFigures.Should().Be(1);
            figures[2].ImagePath.Should().Be(@"HighElves\HighElf_Dragonprince_StandardBearer.jpg");
            figures[2].NumberOfFigures.Should().Be(1);
        }

        [Fact]
        public void should_read_single_model_of_Schwertmeister()
        {

            // act 
            SingleModel singleModel = armyListRepository.SingleModel(46811);

            // assert
            singleModel.Name.Should().Be("Schwertmeister");
            singleModel.MountSave.Should().Be(0);
            singleModel.Profile.Movement.Should().Be(5);
            singleModel.Profile.WeaponSkill.Should().Be(5);
            singleModel.Profile.BallisticSkill.Should().Be(4);
            singleModel.Profile.Strength.Should().Be(3);
            singleModel.Profile.Toughness.Should().Be(3);
            singleModel.Profile.Wounds.Should().Be(1);
            singleModel.Profile.Initiative.Should().Be(7);
            singleModel.Profile.Attacks.Should().Be(1);
            singleModel.Profile.Moral.Should().Be(8);
            singleModel.Profile.Points.Should().Be(10);
            singleModel.Profile.Save.Should().Be(7);
        }

        [Fact]
        public void should_read_single_model_of_Drachenprinz()
        {

            // act 
            SingleModel singleModel = armyListRepository.SingleModel(46810);

            // assert
            singleModel.Name.Should().Be("Drachenprinz");
            singleModel.MountSave.Should().Be(1);
            singleModel.Profile.Movement.Should().Be(5);
            singleModel.Profile.WeaponSkill.Should().Be(5);
            singleModel.Profile.BallisticSkill.Should().Be(4);
            singleModel.Profile.Strength.Should().Be(3);
            singleModel.Profile.Toughness.Should().Be(3);
            singleModel.Profile.Wounds.Should().Be(1);
            singleModel.Profile.Initiative.Should().Be(7);
            singleModel.Profile.Attacks.Should().Be(1);
            singleModel.Profile.Moral.Should().Be(8);
            singleModel.Profile.Save.Should().Be(7);
        }

        [Fact]
        public void should_read_main_model_for_schwertmeister_von_hoeth()
        {
            // arrange
            int schwertmeisterId = 11901;

            // act 
            MainModel mainModel = armyListRepository.MainModel(schwertmeisterId);

            // assert
            mainModel.Name.Should().Be("Schwertmeister von Hoeth");

            SingleModel singleModel = mainModel.SingleModels.First();
            singleModel.Name.Should().Be("Schwertmeister");
            singleModel.MountSave.Should().Be(0);

            Profile profile = singleModel.Profile;
            profile.Movement.Should().Be(5);
            profile.WeaponSkill.Should().Be(5);
            profile.BallisticSkill.Should().Be(4);
            profile.Strength.Should().Be(3);
            profile.Toughness.Should().Be(3);
            profile.Wounds.Should().Be(1);
            profile.Initiative.Should().Be(7);
            profile.Attacks.Should().Be(1);
            profile.Moral.Should().Be(8);

            List<Figure> figures = mainModel.Figures;
            figures.Should().HaveCount(4);
            Figure figure = figures.First();
            figure.ImagePath.Should().Be(@"HighElves\HighElf_SwordMasterOfHoeth.jpg");
        }

        [Fact]
        public void should_read_main_model_for_seegarde_von_lothern()
        {
            // arrange
            int seegardeVonLothernId = 11905;

            // act 
            MainModel mainModel = armyListRepository.MainModel(seegardeVonLothernId);

            // assert
            mainModel.Name.Should().Be("Seegarde von Lothern");
            mainModel.SingleModels.Should().HaveCount(1);

            SingleModel singleModel = mainModel.SingleModels.First();
            singleModel.Name.Should().Be("Seegardist");
            singleModel.MountSave.Should().Be(0);

            Profile profile = singleModel.Profile;
            profile.Movement.Should().Be(5);
            profile.WeaponSkill.Should().Be(4);
            profile.BallisticSkill.Should().Be(4);
            profile.Strength.Should().Be(3);
            profile.Toughness.Should().Be(3);
            profile.Wounds.Should().Be(1);
            profile.Initiative.Should().Be(6);
            profile.Attacks.Should().Be(1);
            profile.Moral.Should().Be(8);

            List<Figure> figures = mainModel.Figures;
            figures.Should().HaveCount(8);
        }


        
        [Fact]
        public void should_return_all_mounts_of_high_elf_army_list()
        {
            // arrange
            int highElfArmyListId = 7;

            // act
            List<MountModel> mountModels = armyListRepository.MountModels(highElfArmyListId);

            // assert
            mountModels.Should().HaveCount(9);
            MountModel greif = mountModels.First(m => m.Name == "Greif");
            greif.Profile.Wounds.Should().Be(5);

        }
    }
}
