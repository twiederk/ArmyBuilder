using ArmyBuilder.Domain;
using System.Data;
using Dapper.Contrib.Extensions;
using Dapper;

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

        public List<MainModel> MainModels(int armyListId)
        {
            var sql = @"
                SELECT 
                    mm.Id, mm.army_category_id as ArmyCategory, mm.Name, mm.Description, mm.Points,
                    sm.Id, sm.Name, sm.Description, sm.profile_id as ProfileId,
                    p.Id, p.Movement, p.weapon_skill as WeaponSkill, p.ballistic_skill as BallisticSkill, p.Strength, p.Toughness, p.Wounds, p.Initiative, p.Attacks, p.Moral
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
                    sm.Id, sm.Name, sm.Description, sm.profile_id as ProfileId,
                    p.Id, p.Movement, p.weapon_skill as WeaponSkill, p.ballistic_skill as BallisticSkill, p.strength, p.toughness, p.wounds, p.initiative, p.attacks, p.moral
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
                    mm.Id, mm.army_category_id as ArmyCategory, mm.Name, mm.Description, mm.Points,
                    sm.Id, sm.Name, sm.Description, sm.profile_id as ProfileId,
                    p.Id, p.Movement, p.weapon_skill as WeaponSkill, p.ballistic_skill as BallisticSkill, p.Strength, p.Toughness, p.Wounds, p.Initiative, p.Attacks, p.Moral
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

        public List<Army> Armies()
        {
            var sql = @"
                    SELECT 
                        a.Id, a.Name,
                        al.Id, al.Name
                    FROM 
                        army a
                    LEFT JOIN 
                        army_list al ON a.army_list_id = al.Id";

            var armyDictionary = new Dictionary<int, Army>();

            _dbConnection.Query<Army, ArmyList, Army>(
                sql,
                (army, armyList) =>
                {
                    if (!armyDictionary.TryGetValue(army.Id, out var currentArmy))
                    {
                        currentArmy = army;
                        currentArmy.ArmyList = armyList;
                        armyDictionary.Add(currentArmy.Id, currentArmy);
                    }

                    return currentArmy;
                },
                splitOn: "Id"
            );

            return armyDictionary.Values.ToList();
        }

        public Army Army(int id)
        {
            var sql = @"
        SELECT 
            a.Id, a.Name, a.army_list_id,
            al.Id, al.Name,
            u.Id, u.Name,
            mm.Id, mm.army_category_id as ArmyCategory, mm.Name, mm.Description, mm.Points, umm.count as Count,
            sm.Id, sm.Name, sm.Description, sm.profile_id as ProfileId,
            p.Id, p.Movement, p.weapon_skill as WeaponSkill, p.ballistic_skill as BallisticSkill, p.Strength, p.Toughness, p.Wounds, p.Initiative, p.Attacks, p.Moral
        FROM 
            army a
        LEFT JOIN 
            army_list al ON a.army_list_id = al.Id
        LEFT JOIN 
            unit u ON a.Id = u.army_id
        LEFT JOIN 
            unit_main_model umm ON u.Id = umm.unit_id
        LEFT JOIN 
            main_model mm ON umm.main_model_id = mm.Id
        LEFT JOIN 
            single_model sm ON mm.Id = sm.main_model_id
        LEFT JOIN 
            profile p ON sm.profile_id = p.Id
        WHERE 
            a.Id = @Id";

            var armyDictionary = new Dictionary<int, Army>();
            var unitDictionary = new Dictionary<int, Unit>();

            _dbConnection.Query<Army, ArmyList, Unit, MainModel, SingleModel, Profile, Army>(
                sql,
                (army, armyList, unit, mainModel, singleModel, profile) =>
                {
                    if (!armyDictionary.TryGetValue(army.Id, out var currentArmy))
                    {
                        currentArmy = army;
                        currentArmy.ArmyList = armyList;
                        currentArmy.Units = new List<Unit>();
                        armyDictionary.Add(currentArmy.Id, currentArmy);
                    }

                    if (unit != null)
                    {
                        if (!unitDictionary.TryGetValue(unit.Id, out var currentUnit))
                        {
                            currentUnit = unit;
                            currentUnit.MainModels = new List<MainModel>();
                            unitDictionary.Add(currentUnit.Id, currentUnit);
                            currentArmy.Units.Add(currentUnit);
                        }

                        if (mainModel != null)
                        {
                            if (!currentUnit.MainModels.Any(m => m.Id == mainModel.Id))
                            {
                                mainModel.SingleModels = new List<SingleModel>();
                                currentUnit.MainModels.Add(mainModel);
                            }

                            if (singleModel != null)
                            {
                                singleModel.Profile = profile;
                                mainModel.SingleModels.Add(singleModel);
                            }
                        }
                    }

                    return currentArmy;
                },
                new { Id = id },
                splitOn: "Id,Id,Id,Id,Id"
            );

            return armyDictionary.Values.FirstOrDefault();
        }

    }
}
