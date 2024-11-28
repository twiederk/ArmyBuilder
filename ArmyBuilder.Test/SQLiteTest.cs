using FluentAssertions;
using System.Data;
using System.Data.SQLite;
using Dapper.Contrib.Extensions;
using ArmyBuilder.Domain ;

namespace ArmyBuilder.Test
{
    public class SQLiteTest
    {
        [Fact]
        public void should_read_all_army_lists_when_connected_to_SQLite_database()
        {
            // arrange
            string connectionString = "Data Source=db/ArmyBuilderTest.db";
            IDbConnection db = new SQLiteConnection(connectionString);

            // act
            var armyLists = db.GetAll<ArmyList>().ToList();

            // assert
            armyLists.Should().HaveCount(15);
        }
    }

}