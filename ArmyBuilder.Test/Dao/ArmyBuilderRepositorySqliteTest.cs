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
            var armyLists = _repository.ArmyLists();

            // assert
            armyLists.Should().HaveCount(15);
        }

        [Fact]
        public void should_read_all_main_models_for_given_army_id()
        {
            // arrange
            int armyId = 7;

            // act
            var mainModels = _repository.MainModels(armyId);

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
            var singleModel = _repository.SingleModel(46811);

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
            var mainModel = _repository.MainModel(11901);

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
    }
}
