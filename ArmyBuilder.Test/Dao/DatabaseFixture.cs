using ArmyBuilder.Dao;
using System.Data;
using System.Data.SQLite;

namespace ArmyBuilder.Test.Dao
{
    public class DatabaseFixture : IDisposable
    {
        public IDbConnection DbConnection { get; private set; }
        public ArmyBuilderRepositorySqlite Repository { get; private set; }

        public DatabaseFixture()
        {
            // Open the database connection
            string connectionString = "Data Source=db/ArmyBuilderTest.db";
            DbConnection = new SQLiteConnection(connectionString);
            DbConnection.Open();

            // Initialize the repository
            Repository = new ArmyBuilderRepositorySqlite(DbConnection);
        }

        public void Dispose()
        {
            // Close the database connection
            DbConnection.Close();
            DbConnection.Dispose();
        }
    }
}
