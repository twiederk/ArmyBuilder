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

        public List<ArmyListDigest> ArmyLists()
        {
            return _dbConnection.GetAll<ArmyListDigest>().ToList();
        }

        public List<MainModel> MainModels(int armyListId)
        {
            var sql = @"
                SELECT 
                    mm.id, mm.army_category_id as ArmyCategory, mm.name, mm.description, mm.points as OldPoints, mm.Uniquely, mm.standard_bearer AS StandardBearer, mm.musician, mm.image_path AS ImagePath, mm.number_of_figures AS NumberOfFigures,
                    sm.Id, sm.Name, sm.profile_id as ProfileId, sm.movement_type_id as MovementType, sm.mount, sm.mountable, sm.count,
                    p.Id, p.Movement, p.weapon_skill as WeaponSkill, p.ballistic_skill as BallisticSkill, p.Strength, p.Toughness, p.Wounds, p.Initiative, p.Attacks, p.Moral, p.Points, p.Save,
                    f.Id, f.number_of_figures as NumberOfFigures, f.image_path as ImagePath
                FROM 
                    main_model mm
                LEFT JOIN 
                    single_model sm ON mm.Id = sm.main_model_id
                LEFT JOIN 
                    profile p ON sm.profile_id = p.Id
                LEFT JOIN 
                    main_model_figure mmf ON mm.Id = mmf.main_model_id
                LEFT JOIN 
                    figure f ON mmf.figure_id = f.Id
                WHERE 
                    mm.army_list_id = @Id";

            var mainModelDictionary = new Dictionary<int, MainModel>();
            var singleModelDictionary = new Dictionary<int, HashSet<SingleModel>>();
            var figureDictionary = new Dictionary<int, HashSet<Figure>>();

            _dbConnection.Query<MainModel, SingleModel, Profile, Figure, MainModel>(
                sql,
                (mainModel, singleModel, profile, figure) =>
                {
                    if (!mainModelDictionary.TryGetValue(mainModel.Id, out var currentMainModel))
                    {
                        currentMainModel = mainModel;
                        mainModelDictionary.Add(currentMainModel.Id, currentMainModel);
                    }

                    if (singleModel != null)
                    {
                        singleModel.Profile = profile;
                        if (!singleModelDictionary.TryGetValue(currentMainModel.Id, out var singleModels))
                        {
                            singleModels = new HashSet<SingleModel>();
                            singleModelDictionary.Add(currentMainModel.Id, singleModels);
                        }
                        singleModels.Add(singleModel);
                    }

                    if (figure != null)
                    {
                        if (!figureDictionary.TryGetValue(currentMainModel.Id, out var figures))
                        {
                            figures = new HashSet<Figure>();
                            figureDictionary.Add(currentMainModel.Id, figures);
                        }
                        figures.Add(figure);
                    }

                    return currentMainModel;
                },
                new { Id = armyListId },
                splitOn: "Id,Id,Id"
            );

            foreach (var mainModel in mainModelDictionary.Values)
            {
                if (singleModelDictionary.TryGetValue(mainModel.Id, out var singleModels))
                {
                    mainModel.SingleModels = singleModels.ToList();
                }
                if (figureDictionary.TryGetValue(mainModel.Id, out var figures))
                {
                    mainModel.Figures = figures.OrderByDescending(f => f.NumberOfFigures).ToList();
                }
            }
            return mainModelDictionary.Values.ToList();
        }

        public SingleModel SingleModel(int id)
        {
            var sql = @"
                SELECT 
                    sm.Id, sm.Name, sm.profile_id as ProfileId, sm.movement_type_id as MovementType, sm.mount, sm.mountable, sm.count,
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
                    mm.Id, mm.army_category_id as ArmyCategory, mm.Name, mm.Description, mm.Points, mm.Uniquely, mm.standard_bearer AS StandardBearer, mm.musician, mm.image_path AS ImagePath, mm.number_of_figures AS NumberOfFigures,
                    sm.Id, sm.Name, sm.profile_id as ProfileId, sm.movement_type_id as MovementType, sm.mount, sm.mountable, sm.count,
                    p.Id, p.Movement, p.weapon_skill as WeaponSkill, p.ballistic_skill as BallisticSkill, p.Strength, p.Toughness, p.Wounds, p.Initiative, p.Attacks, p.Moral, p.Points, p.Save,
                    f.Id, f.number_of_figures as NumberOfFigures, f.image_path as ImagePath
                FROM 
                    main_model mm
                LEFT JOIN 
                    single_model sm ON mm.Id = sm.main_model_id
                LEFT JOIN 
                    profile p ON sm.profile_id = p.Id
                LEFT JOIN 
                    main_model_figure mmf ON mm.Id = mmf.main_model_id
                LEFT JOIN 
                    figure f ON mmf.figure_id = f.Id
                WHERE 
                    mm.Id = @Id";

            var mainModelDictionary = new Dictionary<int, MainModel>();
            var singleModelDictionary = new Dictionary<int, HashSet<SingleModel>>();
            var figureDictionary = new Dictionary<int, HashSet<Figure>>();

            var result = _dbConnection.Query<MainModel, SingleModel, Profile, Figure, MainModel>(
                sql,
                (mainModel, singleModel, profile, figure) =>
                {
                    if (!mainModelDictionary.TryGetValue(mainModel.Id, out var currentMainModel))
                    {
                        currentMainModel = mainModel;
                        mainModelDictionary.Add(currentMainModel.Id, currentMainModel);
                    }

                    if (singleModel != null)
                    {
                        singleModel.Profile = profile;
                        if (!singleModelDictionary.TryGetValue(currentMainModel.Id, out var singleModels))
                        {
                            singleModels = new HashSet<SingleModel>();
                            singleModelDictionary.Add(currentMainModel.Id, singleModels);
                        }
                        singleModels.Add(singleModel);
                    }

                    if (figure != null)
                    {
                        if (!figureDictionary.TryGetValue(currentMainModel.Id, out var figures))
                        {
                            figures = new HashSet<Figure>();
                            figureDictionary.Add(currentMainModel.Id, figures);
                        }
                        figures.Add(figure);
                    }

                    return currentMainModel;
                },
                new { Id = id },
                splitOn: "Id,Id,Id"
            );

            foreach (var mainModel in mainModelDictionary.Values)
            {
                if (singleModelDictionary.TryGetValue(mainModel.Id, out var singleModels))
                {
                    mainModel.SingleModels = singleModels.ToList();
                }
                if (figureDictionary.TryGetValue(mainModel.Id, out var figures))
                {
                    mainModel.Figures = figures.OrderByDescending(f => f.NumberOfFigures).ToList();
                }
            }


            return mainModelDictionary.Values.FirstOrDefault();
        }

        public List<SingleModel> Mounts(int armyListId)
        {
            var sql = @"
                SELECT 
                    sm.Id, sm.Name, sm.profile_id as ProfileId, sm.movement_type_id as MovementType, sm.mount, sm.mountable, sm.count,
                    p.Id, p.Movement, p.weapon_skill as WeaponSkill, p.ballistic_skill as BallisticSkill, p.Strength, p.Toughness, p.Wounds, p.Initiative, p.Attacks, p.Moral, p.Points, p.Save
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
