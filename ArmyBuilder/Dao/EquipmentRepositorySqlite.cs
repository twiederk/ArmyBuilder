using ArmyBuilder.Domain;
using System.Data;
using Dapper;

namespace ArmyBuilder.Dao
{
    public class EquipmentRepositorySqlite : IEquipmentRepository
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


        public EquipmentRepositorySqlite(IDbConnection dbConnection)
        {
            _dbConnection = dbConnection;
        }

        public List<MeleeWeapon> AllMeleeWeapon()
        {
            if (_allMeleeWeapon != null)
            {
                return _allMeleeWeapon;
            }

            var sql = @"
                SELECT 
                    mw.Id, mw.Name, mw.Description, mw.army_list_id as ArmyListId, mw.Magic, mw.Points, mw.Uniquely, mw.Strength,
                    al.Id, al.Name
                FROM 
                    melee_weapon mw
                LEFT JOIN 
                    army_list al ON mw.army_list_id = al.Id";

            var meleeWeaponDictionary = new Dictionary<int, MeleeWeapon>();

            _dbConnection.Query<MeleeWeapon, ArmyListDigest, MeleeWeapon>(
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

            _dbConnection.Query<RangedWeapon, ArmyListDigest, RangedWeapon>(
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

            _dbConnection.Query<Shield, ArmyListDigest, Shield>(
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

            _dbConnection.Query<Armor, ArmyListDigest, Armor>(
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

            _dbConnection.Query<Standard, ArmyListDigest, Standard>(
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

            _dbConnection.Query<Instrument, ArmyListDigest, Instrument>(
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

            _dbConnection.Query<Misc, ArmyListDigest, Misc>(
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
            Item? item = AllItems().FirstOrDefault(i => i.Id == slotRdo.ItemId);

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

        public List<Equipment> ArmyEquipment(int armyId)
        {
            var sql = @"
                SELECT
	                ars.id, ars.item_id AS ItemId, ars.editable AS Editable, ars.magic AS Magic, ars.item_class_id AS ItemClass,
	                asm.id AS SingleModelId, ass.item_id AS SelectionItemId
                FROM
	                army_slot ars
                INNER JOIN
	                army_single_model asm ON ars.army_single_model_id = asm.id
                INNER JOIN
	                army_main_model amm ON asm.army_main_model_id = amm.id
                INNER JOIN
	                army_unit au ON amm.army_unit_id = au.id
                INNER JOIN
	                army a ON au.army_id = a.id
                LEFT JOIN
	                army_slot_selection ass ON ars.id = ass.army_slot_id
                WHERE
	                a.id = @ArmyId;";

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
                new { ArmyId = armyId },
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
            _allItems =
            [
                .. AllMeleeWeapon(),
                .. AllRangedWeapon(),
                .. AllArmor(),
                .. AllShield(),
                .. AllStandard(),
                .. AllInstrument(),
                .. AllMisc(),
            ];
            return _allItems;
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

    }
}