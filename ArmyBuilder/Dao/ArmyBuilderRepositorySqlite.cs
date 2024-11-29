using ArmyBuilder.Domain;
using System.Data;
using Dapper.Contrib.Extensions;


namespace ArmyBuilder.Dao
{
    public class ArmyBuilderRepositorySqlite : IArmyBuilderRepository
    {
        private IDbConnection _dbConnection;

        public ArmyBuilderRepositorySqlite(IDbConnection dbConnection)
        {
            _dbConnection = dbConnection;
        }

        public List<ArmyList> ArmyLists()
        {
            return _dbConnection.GetAll<ArmyList>().ToList();
        }
    }
}
