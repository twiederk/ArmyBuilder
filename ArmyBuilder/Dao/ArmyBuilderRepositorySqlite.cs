using ArmyBuilder.Domain;
using System.Data;
using Dapper.Contrib.Extensions;
using Dapper;

namespace ArmyBuilder.Dao
{
    public class ArmyBuilderRepositorySqlite : IArmyBuilderRepository
    {
        private IDbConnection _dbConnection;
        private List<MeleeWeapon>? _allMeleeWeapon = null;
        private List<RangedWeapon>? _allRangedWeapon = null;
        private List<Shield>? _allShield = null;
        private List<Armor>? _allArmor = null;
        private List<Standard>? _allStandard = null;
        private List<Instrument>? _allInstrument = null;
        private List<Misc>? _allMisc = null;
        private List<Item>? _allItems = null;

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
                    a.Id, a.Name, a.Author, a.army_list_id, a.Points,
                    al.Id, al.Name,
                    au.Id, au.Name,
                    amm.Id, amm.army_category_id as ArmyCategory, amm.Name, amm.Description, amm.Points as OldPoints, amm.count as Count, amm.Uniquely,
                    asm.Id, asm.Name, asm.Description, asm.profile_id as ProfileId, asm.standard_bearer as StandardBearer, asm.musician, asm.movement_type_id as MovementType, asm.mount, asm.mountable,
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
                                currentMainModel.SingleModels.Add(singleModel);
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
            // Delete slots of single models of the main model of unit
            var sql = @"
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
                INSERT INTO army_main_model (army_unit_id, army_category_id, name, description, uniquely, points, count)
                VALUES (@ArmyUnitId, @ArmyCategoryId, @Name, @Description, @Uniquely, @Points, @Count);
                SELECT last_insert_rowid();";
            var main_model_id = _dbConnection.ExecuteScalar<int>(sql, new
            {
                ArmyUnitId = unitId,
                ArmyCategoryId = (int)mainModel.ArmyCategory,
                mainModel.Name,
                mainModel.Description,
                mainModel.Uniquely,
                Points = mainModel.OldPoints,
                mainModel.Count
            });
            mainModel.Id = main_model_id;

            foreach (var singleModel in mainModel.SingleModels)
            {
                sql = @"
                    INSERT INTO army_single_model (army_main_model_id, name, description, profile_id, standard_bearer, musician, movement_type_id, mount, mountable)
                    VALUES (@ArmyMainModelId, @Name, @Description, @ProfileId, @StandardBearer, @Musician, @MovementType, @Mount, @Mountable);
                    SELECT last_insert_rowid();";
                var single_model_id = _dbConnection.ExecuteScalar<int>(sql, new
                {
                    ArmyMainModelId = main_model_id,
                    singleModel.Name,
                    singleModel.Description,
                    ProfileId = singleModel.Profile.Id,
                    singleModel.StandardBearer,
                    singleModel.Musician,
                    singleModel.MovementType,
                    singleModel.Mount,
                    singleModel.Mountable
                });
                singleModel.Id = single_model_id;

                foreach (var slot in singleModel.Equipment.Slots)
                {
                    sql = @"
                        INSERT INTO army_slot (army_single_model_id, item_id, editable, magic, item_class_id)
                        VALUES (@ArmySingleModelId, @ItemId, @Editable, @Magic, @ItemClassId);
                        SELECT last_insert_rowid();";
                    var slot_id = _dbConnection.ExecuteScalar<int>(sql, new
                    {
                        ArmySingleModelId = single_model_id,
                        ItemId = slot.Item.Id,
                        slot.Editable,
                        slot.Magic,
                        ItemClassId = (int)slot.ItemClass
                    });
                    slot.Id = slot_id;
                }
            }
            return mainModel;
        }

        public void UpdateMainModel(int unitId, int mainModelId, int count)
        {
            var sql = @"
                UPDATE army_main_model
                SET count = @Count
                WHERE army_unit_id = @UnitId AND id = @MainModelId;";

            _dbConnection.Execute(sql, new
            {
                Count = count,
                UnitId = unitId,
                MainModelId = mainModelId
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
            // Delete slots of single models of the main model of unit
            var sql = @"
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
            // Delete slots of single models of the main model
            var sql = @"
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

        public List<MeleeWeapon> AllMeleeWeapon()
        {
            if (_allMeleeWeapon != null)
            {
                return _allMeleeWeapon;
            }

            var sql = @"
                SELECT 
                    mw.Id, mw.Name, mw.Description, mw.army_list_id as ArmyListId, mw.Magic, mw.Points, mw.Uniquely,
                    al.Id, al.Name
                FROM 
                    melee_weapon mw
                LEFT JOIN 
                    army_list al ON mw.army_list_id = al.Id";

            var meleeWeaponDictionary = new Dictionary<int, MeleeWeapon>();

            _dbConnection.Query<MeleeWeapon, ArmyList, MeleeWeapon>(
                sql,
                (meleeWeapon, armyList) =>
                {
                    if (!meleeWeaponDictionary.TryGetValue(meleeWeapon.Id, out var currentMeleeWeapon))
                    {
                        currentMeleeWeapon = meleeWeapon;
                        currentMeleeWeapon.ArmyList = armyList;
                        meleeWeaponDictionary.Add(currentMeleeWeapon.Id, currentMeleeWeapon);
                    }

                    return currentMeleeWeapon;
                },
                splitOn: "Id"
            );

            return meleeWeaponDictionary.Values.ToList();
        }


        public List<RangedWeapon> AllRangedWeapon()
        {
            if (_allRangedWeapon != null)
            {
                return _allRangedWeapon;
            }

            var sql = @"
            SELECT 
                rw.Id, rw.Name, rw.Description, rw.army_list_id as ArmyListId, rw.Magic, rw.Points, rw.Uniquely,
                al.Id, al.Name
            FROM 
                ranged_weapon rw
            LEFT JOIN 
                army_list al ON rw.army_list_id = al.Id";

            var rangedWeaponDictionary = new Dictionary<int, RangedWeapon>();

            _dbConnection.Query<RangedWeapon, ArmyList, RangedWeapon>(
                sql,
                (rangedWeapon, armyList) =>
                {
                    if (!rangedWeaponDictionary.TryGetValue(rangedWeapon.Id, out var currentRangedWeapon))
                    {
                        currentRangedWeapon = rangedWeapon;
                        currentRangedWeapon.ArmyList = armyList;
                        rangedWeaponDictionary.Add(currentRangedWeapon.Id, currentRangedWeapon);
                    }

                    return currentRangedWeapon;
                },
                splitOn: "Id"
            );

            _allRangedWeapon = rangedWeaponDictionary.Values.ToList();
            return _allRangedWeapon;
        }

        public List<Shield> AllShield()
        {
            if (_allShield != null)
            {
                return _allShield;
            }

            var sql = @"
            SELECT 
                s.Id, s.Name, s.Description, s.army_list_id as ArmyListId, s.Magic, s.Points, s.Save, s.Uniquely,
                al.Id, al.Name
            FROM 
                shield s
            LEFT JOIN 
                army_list al ON s.army_list_id = al.Id";

            var shieldDictionary = new Dictionary<int, Shield>();

            _dbConnection.Query<Shield, ArmyList, Shield>(
                sql,
                (shield, armyList) =>
                {
                    if (!shieldDictionary.TryGetValue(shield.Id, out var currentShield))
                    {
                        currentShield = shield;
                        currentShield.ArmyList = armyList;
                        shieldDictionary.Add(currentShield.Id, currentShield);
                    }

                    return currentShield;
                },
                splitOn: "Id"
            );

            _allShield = shieldDictionary.Values.ToList();
            return _allShield;
        }

        public List<Armor> AllArmor()
        {
            if (_allArmor != null)
            {
                return _allArmor;
            }

            var sql = @"
                SELECT 
                    a.Id, a.Name, a.Description, a.army_list_id as ArmyListId, a.Magic, a.Points, a.Save, a.Uniquely,
                    al.Id, al.Name
                FROM 
                    armor a
                LEFT JOIN 
                    army_list al ON a.army_list_id = al.Id";

            var armorDictionary = new Dictionary<int, Armor>();

            _dbConnection.Query<Armor, ArmyList, Armor>(
                sql,
                (armor, armyList) =>
                {
                    if (!armorDictionary.TryGetValue(armor.Id, out var currentArmor))
                    {
                        currentArmor = armor;
                        currentArmor.ArmyList = armyList;
                        armorDictionary.Add(currentArmor.Id, currentArmor);
                    }

                    return currentArmor;
                },
                splitOn: "Id"
            );

            _allArmor = armorDictionary.Values.ToList();
            return _allArmor;
        }

        public List<Standard> AllStandard()
        {
            if (_allStandard != null)
            {
                return _allStandard;
            }

            var sql = @"
        SELECT 
            s.Id, s.Name, s.Description, s.army_list_id as ArmyListId, s.Magic, s.Points, s.Uniquely,
            al.Id, al.Name
        FROM 
            standard s
        LEFT JOIN 
            army_list al ON s.army_list_id = al.Id";

            var standardDictionary = new Dictionary<int, Standard>();

            _dbConnection.Query<Standard, ArmyList, Standard>(
                sql,
                (standard, armyList) =>
                {
                    if (!standardDictionary.TryGetValue(standard.Id, out var currentStandard))
                    {
                        currentStandard = standard;
                        currentStandard.ArmyList = armyList;
                        standardDictionary.Add(currentStandard.Id, currentStandard);
                    }

                    return currentStandard;
                },
                splitOn: "Id"
            );

            _allStandard = standardDictionary.Values.ToList();
            return _allStandard;
        }

        public List<Instrument> AllInstrument()
        {
            if (_allInstrument != null)
            {
                return _allInstrument;
            }

            var sql = @"
        SELECT 
            i.Id, i.Name, i.Description, i.army_list_id as ArmyListId, i.Magic, i.Points, i.Uniquely,
            al.Id, al.Name
        FROM 
            instrument i
        LEFT JOIN 
            army_list al ON i.army_list_id = al.Id";

            var instrumentDictionary = new Dictionary<int, Instrument>();

            _dbConnection.Query<Instrument, ArmyList, Instrument>(
                sql,
                (instrument, armyList) =>
                {
                    if (!instrumentDictionary.TryGetValue(instrument.Id, out var currentInstrument))
                    {
                        currentInstrument = instrument;
                        currentInstrument.ArmyList = armyList;
                        instrumentDictionary.Add(currentInstrument.Id, currentInstrument);
                    }

                    return currentInstrument;
                },
                splitOn: "Id"
            );

            _allInstrument = instrumentDictionary.Values.ToList();
            return _allInstrument;
        }

        public List<Misc> AllMisc()
        {
            if (_allMisc != null)
            {
                return _allMisc;
            }

            var sql = @"
                SELECT 
                    m.Id, m.Name, m.Description, m.army_list_id as ArmyListId, m.Magic, m.Points, m.Uniquely,
                    al.Id, al.Name
                FROM 
                    misc m
                LEFT JOIN 
                    army_list al ON m.army_list_id = al.Id";

            var miscDictionary = new Dictionary<int, Misc>();

            _dbConnection.Query<Misc, ArmyList, Misc>(
                sql,
                (misc, armyList) =>
                {
                    if (!miscDictionary.TryGetValue(misc.Id, out var currentMisc))
                    {
                        currentMisc = misc;
                        currentMisc.ArmyList = armyList;
                        miscDictionary.Add(currentMisc.Id, currentMisc);
                    }

                    return currentMisc;
                },
                splitOn: "Id"
            );

            _allMisc = miscDictionary.Values.ToList();
            return _allMisc;
        }





        public Equipment Equipment(int id)
        {
            var sql = @"
                SELECT 
                    s.id, s.item_id as ItemId, s.editable as Editable, s.item_class_id as ItemClass
                FROM 
                    slot s
                WHERE 
                    s.single_model_id = @Id";

            var slotRdos = _dbConnection.Query<SlotRdo>(sql, new { Id = id }).ToList();

            List<Slot> slots = new List<Slot>();
            foreach (var slotRdo in slotRdos)
            {
                Slot slot = slotRdo.toSlot();
                slot.Item = SlotItem(slotRdo);
                slots.Add(slot);
            }
            return new Equipment { Slots = slots };
        }

        public Item SlotItem(SlotRdo slotRdo)
        {
            List<MeleeWeapon> allMeleeWeapon = AllMeleeWeapon();
            List<RangedWeapon> allRangedWeapon = AllRangedWeapon();
            List<Armor> allArmor = AllArmor();
            List<Shield> allShield = AllShield();
            List<Standard> allStandard = AllStandard();
            List<Instrument> allInstrument = AllInstrument();
            List<Misc> allMisc = AllMisc();

            Item? item = slotRdo.ItemClass switch
            {
                ItemClass.MeleeWeapon => allMeleeWeapon.FirstOrDefault(meleeWeapon => meleeWeapon.Id == slotRdo.ItemId),
                ItemClass.Shield => allShield.FirstOrDefault(shield => shield.Id == slotRdo.ItemId),
                ItemClass.RangedWeapon => allRangedWeapon.FirstOrDefault(rangedWeapon => rangedWeapon.Id == slotRdo.ItemId),
                ItemClass.Armor => allArmor.FirstOrDefault(armor => armor.Id == slotRdo.ItemId),
                ItemClass.Misc => allMisc.FirstOrDefault(misc => misc.Id == slotRdo.ItemId),
                ItemClass.Standard => allStandard.FirstOrDefault(standard => standard.Id == slotRdo.ItemId),
                ItemClass.Instrument => allInstrument.FirstOrDefault(instrument => instrument.Id == slotRdo.ItemId),
                _ => new Item { Id = slotRdo.ItemId, Name = $"UNKNOWN ITEM with id: {slotRdo.ItemId}" }
            };

            if (item == null)
            {
                item = new Item
                {
                    Id = slotRdo.ItemId,
                    Name = $"ITEM ID {slotRdo.ItemId} NOT OF CLASS {slotRdo.ItemClass}",
                    Description = ""
                };
            }

            return item;
        }


        public List<Equipment> ArmyListEquipment(int armyListId)
        {
            var sql = @"
                SELECT
                    s.id, s.item_id as ItemId, s.editable as Editable, s.magic as Magic, s.item_class_id as ItemClass,
                    sm.id as SingleModelId, ss.item_id as SelectionItemId
                FROM
                    slot s
                INNER JOIN
                    single_model sm ON s.single_model_id = sm.id
                INNER JOIN
                    main_model mm ON sm.main_model_id = mm.id
                LEFT JOIN
                    slot_selection ss ON s.id = ss.slot_id
                WHERE
                    mm.army_list_id = @ArmyListId";

            var slotRdoDictionary = new Dictionary<int, SlotRdo>();

            _dbConnection.Query<SlotRdo, long?, SlotRdo>(
                sql,
                (slotRdo, selectionItemId) =>
                {
                    if (!slotRdoDictionary.TryGetValue(slotRdo.Id, out var currentSlotRdo))
                    {
                        currentSlotRdo = slotRdo;
                        slotRdoDictionary.Add(currentSlotRdo.Id, currentSlotRdo);
                    }

                    if (selectionItemId.HasValue)
                    {
                        currentSlotRdo.Selection.Add((int)selectionItemId.Value);
                    }

                    return currentSlotRdo;
                },
                new { ArmyListId = armyListId },
                splitOn: "SelectionItemId"
            );

            var equipmentDictionary = new Dictionary<int, Equipment>();

            foreach (var slotRdo in slotRdoDictionary.Values)
            {
                if (!equipmentDictionary.TryGetValue(slotRdo.SingleModelId, out var equipment))
                {
                    equipment = new Equipment { Id = slotRdo.SingleModelId, Slots = new List<Slot>() };
                    equipmentDictionary.Add(slotRdo.SingleModelId, equipment);
                }

                Slot slot = slotRdo.toSlot();
                slot.Item = SlotItem(slotRdo);
                slot.Selection = SlotSelection(slotRdo.Selection);
                equipment.Slots.Add(slot);
            }

            return equipmentDictionary.Values.ToList();
        }




        public List<Item> SlotSelection(List<int> selectionIds)
        {
            var allItems = AllItems();
            var selectedItems = new List<Item>();

            foreach (var id in selectionIds)
            {
                var item = allItems.FirstOrDefault(i => i.Id == id);
                if (item != null)
                {
                    selectedItems.Add(item);
                }
            }

            return selectedItems;
        }

        public List<Item> AllItems()
        {
            if (_allItems != null)
            {
                return _allItems;
            }
            _allItems = new List<Item>();
            _allItems.AddRange(AllMeleeWeapon());
            _allItems.AddRange(AllRangedWeapon());
            _allItems.AddRange(AllArmor());
            _allItems.AddRange(AllShield());
            _allItems.AddRange(AllStandard());
            _allItems.AddRange(AllInstrument());
            _allItems.AddRange(AllMisc());
            return _allItems;
        }


        public List<Equipment> ArmyEquipment(int armyId)
        {
            var sql = @"
                SELECT
                    s.id, s.item_id as ItemId, s.editable as Editable, s.magic as Magic, s.item_class_id as ItemClass,
                    asm.id as SingleModelId
                FROM
                    army_slot s
                LEFT JOIN
                    army_single_model asm ON s.army_single_model_id = asm.id
                LEFT JOIN
                    army_main_model amm ON asm.army_main_model_id = amm.id
                LEFT JOIN
                    army_unit au ON au.id = amm.army_unit_id
                LEFT JOIN
                    army a ON a.id = au.army_id
                WHERE
                    a.id = @ArmyId";


            var slotRdos = _dbConnection.Query<SlotRdo>(sql, new { ArmyId = armyId }).ToList();

            var equipmentDictionary = new Dictionary<int, Equipment>();

            foreach (var slotRdo in slotRdos)
            {
                if (!equipmentDictionary.TryGetValue(slotRdo.SingleModelId, out var equipment))
                {
                    equipment = new Equipment { Id = slotRdo.SingleModelId, Slots = new List<Slot>() };
                    equipmentDictionary.Add(slotRdo.SingleModelId, equipment);
                }

                Slot slot = slotRdo.toSlot();
                slot.Item = SlotItem(slotRdo);
                equipment.Slots.Add(slot);
            }

            return equipmentDictionary.Values.ToList();

        }

        public void UpdateSlotItem(Slot slot)
        {
            var sql = @"
                UPDATE army_slot
                SET item_id = @ItemId
                WHERE id = @Id";

            _dbConnection.Execute(sql, new
            {
                ItemId = slot.Item.Id,
                slot.Id
            });
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

        public SingleModel AddSingleModel(int mainModelId, SingleModel singleModel)
        {
            var sql = @"
                INSERT INTO army_single_model (army_main_model_id, name, description, profile_id, standard_bearer, musician, movement_type_id, mount, mountable)
                VALUES (@MainModelId, @Name, @Description, @ProfileId, @StandardBearer, @Musician, @MovementType, @Mount, @Mountable);
                SELECT last_insert_rowid();";

            var singleModelId = _dbConnection.ExecuteScalar<int>(sql, new
            {
                MainModelId = mainModelId,
                singleModel.Name,
                singleModel.Description,
                ProfileId = singleModel.Profile.Id,
                singleModel.StandardBearer,
                singleModel.Musician,
                singleModel.MovementType,
                singleModel.Mount,
                singleModel.Mountable
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
            }

            return singleModel;
        }

        public SingleModel UpdateSingleModel(SingleModel singleModel)
        {
            var sql = @"
                UPDATE army_single_model
                SET name = @Name,
                    description = @Description,
                    profile_id = @ProfileId,
                    standard_bearer = @StandardBearer,
                    musician = @Musician,
                    movement_type_id = @MovementType,
                    mount = @Mount,
                    mountable = @Mountable
                WHERE id = @Id";

            _dbConnection.Execute(sql, new
            {
                singleModel.Name,
                singleModel.Description,
                ProfileId = singleModel.Profile.Id,
                singleModel.StandardBearer,
                singleModel.Musician,
                singleModel.MovementType,
                singleModel.Mount,
                singleModel.Mountable,
                singleModel.Id
            });

            return singleModel;
        }
    }

}
