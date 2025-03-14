using ArmyBuilder.Domain;
using System.Data;
using Dapper;

namespace ArmyBuilder.Dao
{
    public class ArmyRepositorySqlite : IArmyRepository
    {
        private IDbConnection _dbConnection;

        public ArmyRepositorySqlite(IDbConnection dbConnection)
        {
            _dbConnection = dbConnection;
        }

        public List<Army> Armies()
        {
            var sql = @"
                    SELECT 
                        a.Id, a.Name, a.Author, a.Points,
                        al.Id, al.Name
                    FROM 
                        army a
                    LEFT JOIN 
                        army_list al ON a.army_list_id = al.Id";

            var armyDictionary = new Dictionary<int, Army>();

            _dbConnection.Query<Army, ArmyListDigest, Army>(
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
                    a.Id, a.Name, a.Author, a.army_list_id, a.Points,
                    al.Id, al.Name,
                    au.Id, au.Name,
                    amm.Id, amm.army_category_id as ArmyCategory, amm.Name, amm.Description, amm.Points as OldPoints, amm.count as Count, amm.Uniquely, amm.standard_bearer AS StandardBearer, amm.musician,
                    asm.Id, asm.Name, asm.profile_id as ProfileId, asm.movement_type_id as MovementType, asm.mount, asm.mountable, asm.count,
                    p.Id, p.Movement, p.weapon_skill as WeaponSkill, p.ballistic_skill as BallisticSkill, p.Strength, p.Toughness, p.Wounds, p.Initiative, p.Attacks, p.Moral, p.Points, p.Save
                FROM 
                    army a
                LEFT JOIN 
                    army_list al ON a.army_list_id = al.Id
                LEFT JOIN 
                    army_unit au ON a.Id = au.army_id
                LEFT JOIN 
                    army_main_model amm ON au.Id = amm.army_unit_id
                LEFT JOIN 
                    army_single_model asm ON amm.Id = asm.army_main_model_id
                LEFT JOIN 
                    profile p ON asm.profile_id = p.Id
                WHERE 
                    a.Id = @Id";

            var armyDictionary = new Dictionary<int, Army>();
            var unitDictionary = new Dictionary<int, Unit>();
            var mainModelDictionary = new Dictionary<int, MainModel>();

            _dbConnection.Query<Army, ArmyListDigest, Unit, MainModel, SingleModel, Profile, Army>(
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
                            if (!mainModelDictionary.TryGetValue(mainModel.Id, out var currentMainModel))
                            {
                                currentMainModel = mainModel;
                                currentMainModel.SingleModels = new List<SingleModel>();
                                mainModelDictionary.Add(currentMainModel.Id, currentMainModel);
                                currentUnit.MainModels.Add(currentMainModel);
                            }

                            if (singleModel != null)
                            {
                                singleModel.Profile = profile;
                                currentMainModel.AddSingleModel(singleModel);
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

        public Army CreateArmy(Army army)
        {
            var sql = @"
                INSERT INTO army (name, author, army_list_id, points)
                VALUES (@Name, @Author, @ArmyListId, @Points);
                SELECT last_insert_rowid();";
            var armyId = _dbConnection.ExecuteScalar<int>(sql, new
            {
                army.Name,
                army.Author,
                ArmyListId = army.ArmyList.Id,
                army.Points
            });
            army.Id = armyId;
            return army;
        }

        public void DeleteArmy(int armyId)
        {
            // Delete slot_selections of slots of single models of the main model of unit
            var sql = @"
                DELETE FROM army_slot_selection
                WHERE army_slot_id IN (SELECT asl.id FROM army_slot asl LEFT JOIN army_single_model asm ON asm.id = asl.army_single_model_id LEFT JOIN army_main_model amm ON amm.id = asm.army_main_model_id LEFT JOIN army_unit au ON au.id = amm.army_unit_id WHERE au.army_id = @ArmyId)";
            _dbConnection.Execute(sql, new { ArmyId = armyId });

            // Delete slots of single models of the main model of unit
            sql = @"
                DELETE FROM army_slot
                WHERE army_single_model_id IN (SELECT asm.id FROM army_single_model asm LEFT JOIN army_main_model amm ON amm.id == asm.army_main_model_id LEFT JOIN army_unit au ON au.id = amm.army_unit_id WHERE au.army_id = @ArmyId)";
            _dbConnection.Execute(sql, new { ArmyId = armyId });

            // Delete single models of the main models of the army
            sql = @"
                DELETE FROM army_single_model
                WHERE id IN (SELECT asm.id FROM army_single_model asm LEFT JOIN army_main_model amm ON amm.id == asm.army_main_model_id LEFT JOIN army_unit au ON au.id = amm.army_unit_id WHERE au.army_id = @ArmyId)";
            _dbConnection.Execute(sql, new { ArmyId = armyId });

            // Delete main models of the units of the army
            sql = @"
                DELETE FROM army_main_model
                WHERE id IN (SELECT amm.id FROM army_main_model amm LEFT JOIN army_unit au ON au.id = amm.army_unit_id WHERE au.army_id = @ArmyId)";
            _dbConnection.Execute(sql, new { ArmyId = armyId });

            // Delete units of the army
            sql = "DELETE FROM army_unit WHERE army_id = @ArmyId";
            _dbConnection.Execute(sql, new { ArmyId = armyId });

            // Delete the army
            sql = "DELETE FROM army WHERE Id = @ArmyId";
            _dbConnection.Execute(sql, new { ArmyId = armyId });
        }


        public Unit CreateUnit(int armyId, Unit unit)
        {
            var sql = @"
                INSERT INTO army_unit (name, army_id)
                VALUES (@Name, @ArmyId);
                SELECT last_insert_rowid();";

            var unitId = _dbConnection.ExecuteScalar<int>(sql, new
            {
                unit.Name,
                ArmyId = armyId
            });

            unit.Id = unitId;
            return unit;
        }

        public MainModel AddMainModel(int unitId, MainModel mainModel)
        {
            var sql = @"
                INSERT INTO army_main_model (army_unit_id, army_category_id, name, description, uniquely, points, count, standard_bearer, musician)
                VALUES (@ArmyUnitId, @ArmyCategoryId, @Name, @Description, @Uniquely, @Points, @Count, @StandardBearer, @Musician);
                SELECT last_insert_rowid();";
            var main_model_id = _dbConnection.ExecuteScalar<int>(sql, new
            {
                ArmyUnitId = unitId,
                ArmyCategoryId = (int)mainModel.ArmyCategory,
                mainModel.Name,
                mainModel.Description,
                mainModel.Uniquely,
                Points = mainModel.OldPoints,
                mainModel.Count,
                mainModel.StandardBearer,
                mainModel.Musician
            });
            mainModel.Id = main_model_id;

            foreach (var singleModel in mainModel.SingleModels)
            {
                AddSingleModel(main_model_id, singleModel);
            }
            return mainModel;
        }

        public SingleModel AddSingleModel(int mainModelId, SingleModel singleModel)
        {
            var sql = @"
                INSERT INTO army_single_model (army_main_model_id, name, profile_id, movement_type_id, mount, mountable, count)
                VALUES (@MainModelId, @Name, @ProfileId, @MovementType, @Mount, @Mountable, @Count);
                SELECT last_insert_rowid();";

            var singleModelId = _dbConnection.ExecuteScalar<int>(sql, new
            {
                MainModelId = mainModelId,
                singleModel.Name,
                ProfileId = singleModel.Profile.Id,
                singleModel.MovementType,
                singleModel.Mount,
                singleModel.Mountable,
                singleModel.Count
            });

            singleModel.Id = singleModelId;

            foreach (var slot in singleModel.Equipment.Slots)
            {
                sql = @"
                    INSERT INTO army_slot (army_single_model_id, item_id, editable, magic, item_class_id)
                    VALUES (@SingleModelId, @ItemId, @Editable, @Magic, @ItemClassId);
                    SELECT last_insert_rowid();";

                var slotId = _dbConnection.ExecuteScalar<int>(sql, new
                {
                    SingleModelId = singleModelId,
                    ItemId = slot.Item.Id,
                    slot.Editable,
                    slot.Magic,
                    ItemClassId = (int)slot.ItemClass
                });

                slot.Id = slotId;

                if (slot.Editable && !slot.Magic)
                {
                    foreach (var item in slot.Selection)
                    {
                        sql = @"
                            INSERT INTO army_slot_selection (army_slot_id, item_id)
                            VALUES (@SlotId, @ItemId);";

                        _dbConnection.Execute(sql, new
                        {
                            SlotId = slotId,
                            ItemId = item.Id
                        });
                    }
                }
            }
            return singleModel;
        }


        public void UpdateMainModel(int unitId, MainModel mainModel)
        {
            var sql = @"
                UPDATE army_main_model
                SET count = @Count, standard_bearer = @StandardBearer, musician = @Musician
                WHERE army_unit_id = @UnitId AND id = @MainModelId;";

            _dbConnection.Execute(sql, new
            {
                mainModel.Count,
                mainModel.StandardBearer,
                mainModel.Musician,
                UnitId = unitId,
                MainModelId = mainModel.Id
            });
        }

        public Army UpdateArmy(Army army)
        {
            var sql = @"
                UPDATE army
                SET name = @Name, author = @Author, points = @Points
                WHERE Id = @Id";

            _dbConnection.Execute(sql, new
            {
                army.Name,
                army.Author,
                army.Points,
                army.Id
            });

            return army;
        }

        public void DeleteUnit(int unitId)
        {
            // Delete slot_selections of slots of single models of the main model of unit
            var sql = @"
                DELETE FROM army_slot_selection
                WHERE army_slot_id IN (SELECT asl.id FROM army_slot asl LEFT JOIN army_single_model asm ON asm.id = asl.army_single_model_id LEFT JOIN army_main_model amm ON amm.id = asm.army_main_model_id WHERE amm.army_unit_id = @UnitId)";
            _dbConnection.Execute(sql, new { UnitId = unitId });

            // Delete slots of single models of the main model of unit
            sql = @"
                DELETE FROM army_slot
                WHERE army_single_model_id IN (SELECT asm.id FROM army_single_model asm LEFT JOIN army_main_model amm ON amm.id == asm.army_main_model_id LEFT JOIN army_unit au ON au.id = amm.army_unit_id WHERE au.id = @UnitId)";
            _dbConnection.Execute(sql, new { UnitId = unitId });

            // Delete single models of the main models of unit
            sql = @"
                DELETE FROM army_single_model
                WHERE id IN (SELECT asm.id FROM army_single_model asm LEFT JOIN army_main_model amm ON amm.id == asm.army_main_model_id LEFT JOIN army_unit au ON au.id = amm.army_unit_id WHERE au.id = @UnitId)";
            _dbConnection.Execute(sql, new { UnitId = unitId });

            // Delete main models of the unit
            sql = @"
                DELETE FROM army_main_model
                WHERE id IN (SELECT amm.id FROM army_main_model amm LEFT JOIN army_unit au ON au.id = amm.army_unit_id WHERE au.id = @UnitId)";
            _dbConnection.Execute(sql, new { UnitId = unitId });

            // Delete units of the army
            sql = "DELETE FROM army_unit WHERE id = @UnitId";
            _dbConnection.Execute(sql, new { UnitId = unitId });
        }

        public void DeleteMainModelFromUnit(int unitId, int mainModelId)
        {
            // Delete slot_selections of slots of single models of the main model
            var sql = @"
                DELETE FROM army_slot_selection
                WHERE army_slot_id IN (SELECT asl.id FROM army_slot asl LEFT JOIN army_single_model asm ON asm.id = asl.army_single_model_id WHERE asm.army_main_model_id = @MainModelId)";
            _dbConnection.Execute(sql, new { MainModelId = mainModelId });

            // Delete slots of single models of the main model
            sql = @"
                DELETE FROM army_slot
                WHERE army_single_model_id IN (SELECT asm.id FROM army_single_model asm LEFT JOIN army_main_model amm ON amm.id == asm.army_main_model_id WHERE amm.id = @MainModelId)";
            _dbConnection.Execute(sql, new { MainModelId = mainModelId });

            // Delete single models of the main model
            sql = @"
                DELETE FROM army_single_model
                WHERE id IN (SELECT asm.id FROM army_single_model asm LEFT JOIN army_main_model amm ON amm.id == asm.army_main_model_id WHERE amm.id = @MainModelId)";
            _dbConnection.Execute(sql, new { MainModelId = mainModelId });

            // Delete main models of the unit
            sql = @"
                DELETE FROM army_main_model
                WHERE army_unit_id = @UnitId";
            _dbConnection.Execute(sql, new { UnitId = unitId });
        }

        public SingleModel UpdateSingleModel(SingleModel singleModel)
        {
            var sql = @"
                UPDATE army_single_model
                SET name = @Name,
                    profile_id = @ProfileId,
                    movement_type_id = @MovementType,
                    mount = @Mount,
                    mountable = @Mountable,
                    count = @Count
                WHERE id = @Id";

            _dbConnection.Execute(sql, new
            {
                singleModel.Name,
                ProfileId = singleModel.Profile.Id,
                singleModel.MovementType,
                singleModel.Mount,
                singleModel.Mountable,
                singleModel.Count,
                singleModel.Id
            });

            return singleModel;
        }
    }

} 