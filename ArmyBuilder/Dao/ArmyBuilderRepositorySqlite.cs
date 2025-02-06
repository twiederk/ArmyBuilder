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
                    sm.Id, sm.Name, sm.Description, sm.profile_id as ProfileId, sm.mount_status as MountStatus,
                    p.Id, p.Movement, p.weapon_skill as WeaponSkill, p.ballistic_skill as BallisticSkill, p.Strength, p.Toughness, p.Wounds, p.Initiative, p.Attacks, p.Moral, p.Save
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
                    sm.Id, sm.Name, sm.Description, sm.profile_id as ProfileId, sm.mount_status as MountStatus,
                    p.Id, p.Movement, p.weapon_skill as WeaponSkill, p.ballistic_skill as BallisticSkill, p.strength, p.toughness, p.wounds, p.initiative, p.attacks, p.moral, p.save
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
                    sm.Id, sm.Name, sm.Description, sm.profile_id as ProfileId, sm.mount_status as MountStatus,
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
                    u.Id, u.Name,
                    mm.Id, mm.army_category_id as ArmyCategory, mm.Name, mm.Description, mm.Points, umm.count as Count,
                    sm.Id, sm.Name, sm.Description, sm.profile_id as ProfileId, sm.mount_status as MountStatus,
                    p.Id, p.Movement, p.weapon_skill as WeaponSkill, p.ballistic_skill as BallisticSkill, p.Strength, p.Toughness, p.Wounds, p.Initiative, p.Attacks, p.Moral, p.Save
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

        public void DeleteArmy(int id)
        {
            // Delete main_model of the units of the army
            var sql = @"
                DELETE FROM unit_main_model
                WHERE unit_id IN (SELECT Id FROM unit WHERE army_id = @Id)";
            _dbConnection.Execute(sql, new { Id = id });

            // Delete units of the army
            sql = "DELETE FROM unit WHERE army_id = @Id";
            _dbConnection.Execute(sql, new { Id = id });

            // Delete the army
            sql = "DELETE FROM army WHERE Id = @Id";
            _dbConnection.Execute(sql, new { Id = id });
        }


        public Unit CreateUnit(int armyId, Unit unit)
        {
            var sql = @"
                INSERT INTO unit (name, army_id)
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

        public void AddMainModel(int unitId, MainModel mainModel)
        {
            var sql = @"
                INSERT INTO unit_main_model (unit_id, main_model_id, count)
                VALUES (@UnitId, @MainModelId, @Count);";
            _dbConnection.Execute(sql, new
            {
                UnitId = unitId,
                MainModelId = mainModel.Id,
                mainModel.Count
            });
        }

        public void UpdateMainModelCount(int unitId, int mainModelId, int count)
        {
            var sql = @"
                UPDATE unit_main_model
                SET count = @Count
                WHERE unit_id = @UnitId AND main_model_id = @MainModelId;";

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
            var sql = @"
                DELETE FROM unit_main_model
                WHERE unit_id = @Id";
            _dbConnection.Execute(sql, new { Id = unitId });

            sql = "DELETE FROM unit WHERE Id = @Id";
            _dbConnection.Execute(sql, new { Id = unitId });
        }

        public void DeleteMainModelFromUnit(int unitId, int mainModelId)
        {
            var sql = @"
                DELETE FROM unit_main_model
                WHERE unit_id = @UnitId AND main_model_id = @MainModelId";
            _dbConnection.Execute(sql, new
            {
                UnitId = unitId,
                MainModelId = mainModelId
            });
        }

        public List<MeleeWeapon> AllMeleeWeapon()
        {
            if (_allMeleeWeapon != null)
            {
                return _allMeleeWeapon;
            }

            var sql = @"
                SELECT 
                    mw.Id, mw.Name, mw.Description, mw.army_list_id as ArmyListId, mw.Magic, mw.Points,
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
                rw.Id, rw.Name, rw.Description, rw.army_list_id as ArmyListId, rw.Magic, rw.Points,
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
                s.Id, s.Name, s.Description, s.army_list_id as ArmyListId, s.Magic, s.Points, s.Save,
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
                    a.Id, a.Name, a.Description, a.army_list_id as ArmyListId, a.Magic, a.Points, a.Save,
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
            s.Id, s.Name, s.Description, s.army_list_id as ArmyListId, s.Magic, s.Points,
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
            i.Id, i.Name, i.Description, i.army_list_id as ArmyListId, i.Magic, i.Points,
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
            m.Id, m.Name, m.Description, m.army_list_id as ArmyListId, m.Magic, m.Points,
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
                    sm.id as SingleModelId
                FROM
                    slot s
                INNER JOIN
                    single_model sm ON s.single_model_id = sm.id
                INNER JOIN
                    main_model mm ON sm.main_model_id = mm.id
                WHERE
                    mm.army_list_id = @ArmyListId";


            var slotRdos = _dbConnection.Query<SlotRdo>(sql, new { ArmyListId = armyListId }).ToList();

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



    }

}
