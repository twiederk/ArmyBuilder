using FluentAssertions;
using System.Data.SQLite;

namespace ArmyBuilder.Test
{
    public class SQLiteTest
    {
        [Fact]
        public void should_read_all_army_lists_when_connected_to_SQLite_database()
        {
            // arrange
            string connectionString = "Data Source=db/ArmyBuilderTest.db";
            SQLiteConnection connection = new SQLiteConnection(connectionString);
            connection.Open();

            // act
            SQLiteCommand command = new SQLiteCommand("SELECT * FROM Army", connection);
            SQLiteDataReader reader = command.ExecuteReader();

            // assert

            // tear down
            connection.Close();
        }
    }
}