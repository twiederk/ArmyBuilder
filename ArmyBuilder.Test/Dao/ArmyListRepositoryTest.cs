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
            singleModel.MovementType.Should().Be(MovementType.OnFoot);
            singleModel.Mount.Should().BeFalse();

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
            figures.Should().HaveCount(1);
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
            singleModel.MovementType.Should().Be(MovementType.OnMount);
            singleModel.Mount.Should().BeFalse();

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
        }

        [Fact]
        public void should_read_single_model_of_Schwertmeister()
        {

            // act 
            SingleModel singleModel = armyListRepository.SingleModel(46811);

            // assert
            singleModel.Name.Should().Be("Schwertmeister");
            singleModel.MovementType.Should().Be(MovementType.OnFoot);
            singleModel.Mount.Should().BeFalse();
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
            singleModel.MovementType.Should().Be(MovementType.OnMount);
            singleModel.Mount.Should().BeFalse();            
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
        public void should_read_main_model_for_given_id()
        {
            // arrange
            int schwertmeisterId = 11901;

            // act 
            MainModel mainModel = armyListRepository.MainModel(schwertmeisterId);

            // assert
            mainModel.Name.Should().Be("Schwertmeister von Hoeth");

            SingleModel singleModel = mainModel.SingleModels.First();
            singleModel.Name.Should().Be("Schwertmeister");
            singleModel.MovementType.Should().Be(MovementType.OnFoot);
            singleModel.Mount.Should().BeFalse();

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
            figures.Should().HaveCount(1);
            Figure figure = figures.First();
            figure.ImagePath.Should().Be(@"HighElves\HighElf_SwordMasterOfHoeth.jpg");
        }


        
        [Fact]
        public void should_return_all_mounts_of_high_elf_army_list()
        {
            // arrange
            int highElfArmyListId = 7;

            // act
            List<SingleModel> mounts = armyListRepository.Mounts(highElfArmyListId);

            // assert
            mounts.Should().HaveCount(12);
            SingleModel greif = mounts.First(m => m.Name == "Greif");
            greif.Mountable.Should().BeTrue();
            greif.Profile.Wounds.Should().Be(5);

        }
    }
}
