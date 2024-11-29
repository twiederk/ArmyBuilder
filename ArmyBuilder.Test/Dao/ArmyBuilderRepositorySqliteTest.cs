using FluentAssertions;
using System.Data;
using ArmyBuilder.Dao;

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
    }
}
