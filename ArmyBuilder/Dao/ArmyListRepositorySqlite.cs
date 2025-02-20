using ArmyBuilder.Domain;
using System.Data;
using Dapper.Contrib.Extensions;
using Dapper;

namespace ArmyBuilder.Dao
{
    public class ArmyListRepositorySqlite : IArmyListRepository
    {
        private IDbConnection _dbConnection;

        public ArmyListRepositorySqlite(IDbConnection dbConnection)
        {
            _dbConnection = dbConnection;
        }

        public List<ArmyList> ArmyLists()
        {
            return _dbConnection.GetAll<ArmyList>().ToList();
        }

        public List<MainModel> MainModels(int armyListId)
        {
            var sql = @"
                SELECT 
                    mm.Id, mm.army_category_id as ArmyCategory, mm.Name, mm.Description, mm.Points as OldPoints, mm.Uniquely,
                    sm.Id, sm.Name, sm.Description, sm.profile_id as ProfileId, sm.standard_bearer as StandardBearer, sm.musician, sm.movement_type_id as MovementType, sm.mount, sm.mountable,
                    p.Id, p.Movement, p.weapon_skill as WeaponSkill, p.ballistic_skill as BallisticSkill, p.Strength, p.Toughness, p.Wounds, p.Initiative, p.Attacks, p.Moral, p.Points, p.Save
                FROM 
                    main_model mm
                LEFT JOIN 
                    single_model sm ON mm.Id = sm.main_model_id
                LEFT JOIN 
                    profile p ON sm.profile_id = p.Id
                WHERE 
                    mm.army_list_id = @Id";

            var mainModelDictionary = new Dictionary<int, MainModel>();

            _dbConnection.Query<MainModel, SingleModel, Profile, MainModel>(
                sql,
                (mainModel, singleModel, profile) =>
                {
                    if (!mainModelDictionary.TryGetValue(mainModel.Id, out var currentMainModel))
                    {
                        currentMainModel = mainModel;
                        mainModelDictionary.Add(currentMainModel.Id, currentMainModel);
                    }

                    if (singleModel != null)
                    {
                        singleModel.Profile = profile;
                        currentMainModel.SingleModels.Add(singleModel);
                    }

                    return currentMainModel;
                },
                new { Id = armyListId },
                splitOn: "Id,Id"
            );

            return mainModelDictionary.Values.ToList();
        }


        public SingleModel SingleModel(int id)
        {
            var sql = @"
                SELECT 
                    sm.Id, sm.Name, sm.Description, sm.profile_id as ProfileId, sm.standard_bearer as StandardBearer, sm.musician, sm.movement_type_id as MovementType, sm.mount, sm.mountable,
                    p.Id, p.Movement, p.weapon_skill as WeaponSkill, p.ballistic_skill as BallisticSkill, p.strength, p.toughness, p.wounds, p.initiative, p.attacks, p.moral, p.points, p.save
                FROM 
                    single_model sm
                INNER JOIN 
                    profile p ON sm.profile_id = p.Id
                WHERE 
                    sm.Id = @Id";

            var singleModelDictionary = new Dictionary<int, SingleModel>();

            var result = _dbConnection.Query<SingleModel, Profile, SingleModel>(
                sql,
                (singleModel, profile) =>
                {
                    if (!singleModelDictionary.TryGetValue(singleModel.Id, out var currentSingleModel))
                    {
                        currentSingleModel = singleModel;
                        singleModelDictionary.Add(currentSingleModel.Id, currentSingleModel);
                    }

                    currentSingleModel.Profile = profile;
                    return currentSingleModel;
                },
                new { Id = id },
                splitOn: "Id"
            );

            return result.FirstOrDefault();
        }

        public MainModel MainModel(int id)
        {
            var sql = @"
                SELECT 
                    mm.Id, mm.army_category_id as ArmyCategory, mm.Name, mm.Description, mm.Points, mm.Uniquely,
                    sm.Id, sm.Name, sm.Description, sm.profile_id as ProfileId, sm.standard_bearer as StandardBearer, sm.musician, sm.movement_type_id as MovementType, sm.mount, sm.mountable,
                    p.Id, p.Movement, p.weapon_skill as WeaponSkill, p.ballistic_skill as BallisticSkill, p.Strength, p.Toughness, p.Wounds, p.Initiative, p.Attacks, p.Moral, p.Points, p.Save
                FROM 
                    main_model mm
                LEFT JOIN 
                    single_model sm ON mm.Id = sm.main_model_id
                LEFT JOIN 
                    profile p ON sm.profile_id = p.Id
                WHERE 
                    mm.Id = @Id";

            var mainModelDictionary = new Dictionary<int, MainModel>();

            var result = _dbConnection.Query<MainModel, SingleModel, Profile, MainModel>(
                sql,
                (mainModel, singleModel, profile) =>
                {
                    if (!mainModelDictionary.TryGetValue(mainModel.Id, out var currentMainModel))
                    {
                        currentMainModel = mainModel;
                        mainModelDictionary.Add(currentMainModel.Id, currentMainModel);
                    }

                    if (singleModel != null)
                    {
                        singleModel.Profile = profile;
                        currentMainModel.SingleModels.Add(singleModel);
                    }

                    return currentMainModel;
                },
                new { Id = id },
                splitOn: "Id,Id"
            );

            return result.FirstOrDefault();
        }

        public List<SingleModel> Mounts(int armyListId)
        {
            var sql = @"
                SELECT 
                    sm.*, p.*
                FROM 
                    single_model sm
                INNER JOIN 
                    main_model mm ON sm.main_model_id = mm.id
                INNER JOIN 
                    profile p ON sm.profile_id = p.id
                WHERE 
                    sm.mountable = 1 AND mm.army_list_id = @ArmyListId";

            var singleModelDictionary = new Dictionary<int, SingleModel>();

            var result = _dbConnection.Query<SingleModel, Profile, SingleModel>(
                sql,
                (singleModel, profile) =>
                {
                    if (!singleModelDictionary.TryGetValue(singleModel.Id, out var currentSingleModel))
                    {
                        currentSingleModel = singleModel;
                        singleModelDictionary.Add(currentSingleModel.Id, currentSingleModel);
                    }

                    currentSingleModel.Profile = profile;
                    return currentSingleModel;
                },
                new { ArmyListId = armyListId },
                splitOn: "Id"
            );

            return result.Distinct().ToList();
        }

    }
}
