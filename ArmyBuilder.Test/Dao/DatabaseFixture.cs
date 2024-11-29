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
            string connectionString = "Data Source=db/ArmyBuilderTest.db";
            DbConnection = new SQLiteConnection(connectionString);
            DbConnection.Open();

            Repository = new ArmyBuilderRepositorySqlite(DbConnection);
        }

        public void Dispose()
        {
            DbConnection.Close();
            DbConnection.Dispose();
        }
    }
}
