using ArmyBuilder.Dao;
using System.Data;
using System.Data.SQLite;

namespace ArmyBuilder.Test.Dao
{
    public class DatabaseFixture : IDisposable
    {
        public IDbConnection DbConnection { get; private set; }
        public ArmyBuilderRepositorySqlite armyBuilderRepository { get; private set; }
        public EquipmentRepositorySqlite equipmentRepository { get; private set; }

        public DatabaseFixture()
        {
            string connectionString = "Data Source=db/ArmyBuilderTest.db";
            DbConnection = new SQLiteConnection(connectionString);
            DbConnection.Open();

            armyBuilderRepository = new ArmyBuilderRepositorySqlite(DbConnection);
            equipmentRepository = new EquipmentRepositorySqlite(DbConnection);
        }

        public void Dispose()
        {
            DbConnection.Close();
            DbConnection.Dispose();
        }
    }
}
