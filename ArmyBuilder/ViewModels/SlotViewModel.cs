using ArmyBuilder.Domain;
using System.Collections.Generic;
using System.Linq;

namespace ArmyBuilder.ViewModels
{
    public class SlotViewModel
    {
        public string ItemName => SelectedItem.Name;
        public string Name => SlotName();

        private ItemViewModel _selectedItem;
        public ItemViewModel SelectedItem
        {
            get => _selectedItem;
            set
            {
                if (_selectedItem != value)
                {
                    _selectedItem = value;
                    _slot.Item = _selectedItem.Item;
                }
            }
        }

        public bool Editable => _slot.Editable;
        public bool AllItems => _slot.AllItems;
        public List<ItemViewModel> SelectableItems { get; set; } = new List<ItemViewModel>();
        private Slot _slot;

        public SlotViewModel(Slot slot)
        {
            _slot = slot;
            SelectedItem = new ItemViewModel(slot.Item);
            SelectableItems = slot.SelectableItems.Select(item => new ItemViewModel(item)).ToList();
        }

        public string SlotName() {
            switch (_slot.ItemClass)
            {
                case ItemClass.MeleeWeapon:
                    return "Waffe:";
                case ItemClass.RangedWeapon:
                    return "Fernwaffe:";
                case ItemClass.Armor:
                    return "Rüstung:";
                case ItemClass.Shield:
                    return "Schild:";
                case ItemClass.Standard:
                    return "Standarte:";
                case ItemClass.Instrument:
                    return "Instrument:";
                case ItemClass.Misc:
                    return "Verschiedenes:";
                default:
                    return $"UNBEKANNT {_slot.ItemClass}";
            }
        }
    }

}


