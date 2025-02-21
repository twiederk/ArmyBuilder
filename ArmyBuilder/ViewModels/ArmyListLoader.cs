using ArmyBuilder.Dao;
using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{
    public class ArmyListLoader
    {
        private IArmyBuilderRepository _repository;

        public ArmyListLoader(IArmyBuilderRepository repository)
        {
            this._repository = repository;
        }

        public List<MainModel> LoadArmyList(ArmyList armyList)
        {
            var mainModels = _repository.MainModels(armyList.Id);
            var equipment = _repository.ArmyListEquipment(armyList.Id);
            assignEquipment(mainModels, equipment);
            assignSelection(mainModels, armyList);
            return mainModels;
        }

        public Army LoadArmy(int armyId)
        {
            Army army = _repository.Army(armyId);
            List<Equipment> equipment = _repository.ArmyEquipment(armyId);
            assignEquipment(army.MainModels(), equipment);
            assignSelection(army.MainModels(), army.ArmyList);
            return army;
        }

        public void assignEquipment(List<MainModel> mainModels, List<Equipment> equipment)
        {
            var equipmentDictionary = equipment.ToDictionary(e => e.Id);

            mainModels.ForEach(mainModel =>
                mainModel.SingleModels.ForEach(singleModel =>
                {
                    if (equipmentDictionary.TryGetValue(singleModel.Id, out var singleModelEquipment))
                    {
                        singleModel.Equipment = singleModelEquipment;
                    }
                })
            );
        }


        public void assignSelection(List<MainModel> mainModels, ArmyList armyList)
        {
            mainModels.ForEach(mainModel =>
                mainModel.SingleModels.ForEach(singleModel =>
                {
                    AssignSelectionToSingleModel(armyList, singleModel);
                })
            );
        }

        private void AssignSelectionToSingleModel(ArmyList armyList, SingleModel singleModel)
        {
            if (singleModel.Equipment != null)
            {
                foreach (var slot in singleModel.Equipment.Slots)
                {
                    slot.Selection = selection(slot, armyList);
                }
            }
        }

        public List<Item> selection(Slot slot, ArmyList armyList)
        {

            if (!slot.IsAllItems() || !slot.Editable)
            {
                return slot.Selection;
            }

            var allMeleeWeapon = _repository.AllMeleeWeapon();
            var allRangedWeapon = _repository.AllRangedWeapon();
            var allShield = _repository.AllShield();
            var allArmor = _repository.AllArmor();
            var allStandard = _repository.AllStandard();
            var allInstrument = _repository.AllInstrument();
            var allMisc = _repository.AllMisc();

            switch (slot.ItemClass)
            {
                case ItemClass.MeleeWeapon:
                    return FilterItems(allMeleeWeapon.Cast<Item>(), armyList, slot);
                case ItemClass.RangedWeapon:
                    return FilterItems(allRangedWeapon.Cast<Item>(), armyList, slot);
                case ItemClass.Shield:
                    return FilterItems(allShield.Cast<Item>(), armyList, slot);
                case ItemClass.Armor:
                    return FilterItems(allArmor.Cast<Item>(), armyList, slot);
                case ItemClass.Standard:
                    return FilterItems(allStandard.Cast<Item>(), armyList, slot);
                case ItemClass.Instrument:
                    return FilterItems(allInstrument.Cast<Item>(), armyList, slot);
                case ItemClass.Misc:
                    return FilterItems(allMisc.Cast<Item>(), armyList, slot);
                default:
                    return new List<Item>() {
                        new Item
                        {
                            Id = slot.Item.Id,
                            Name = $"UNKNOWN ITEM with id: {slot.Item.Id}",
                        }
                    };
            }
        }

        private List<Item> FilterItems(IEnumerable<Item> items, ArmyList armyList, Slot slot)
        {
            if (slot.Magic)
            {
                return items.Where(i => (i.ArmyList == null || i.ArmyList.Equals(armyList)) && !i.Uniquely).OrderBy(i => i.Name).ToList();
            }
            return items.Where(i => (i.ArmyList == null || i.ArmyList.Equals(armyList)) && !i.Magic && !i.Uniquely).OrderBy(i => i.Name).ToList();
        }

    }
}