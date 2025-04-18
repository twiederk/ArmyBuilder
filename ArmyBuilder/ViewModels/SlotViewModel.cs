using ArmyBuilder.Domain;
using System.Windows;

namespace ArmyBuilder.ViewModels
{
    public class SlotViewModel
    {
        public string ItemName => SelectedItem.NameDescription;
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
                    Slot.Item = _selectedItem.Item;
                }
            }
        }

        public bool Editable => Slot.Editable;
        public Visibility ItemNameVisibility => GetItemNameVisibility();
        public Visibility ItemSelectionVisibility => GetItemSelectionVisibility();
        public bool AllItems => Slot.AllItems;
        public List<ItemViewModel> Selection { get; set; } = new List<ItemViewModel>();
        public Slot Slot;

        public SlotViewModel(Slot slot)
        {
            Slot = slot;
            SelectedItem = new ItemViewModel(slot.Item);
            Selection = slot.Selection.Select(item => new ItemViewModel(item)).ToList();
        }

        public string SlotName() {
            switch (Slot.ItemClass)
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
                    return $"UNBEKANNT {Slot.ItemClass}";
            }
        }

        public Visibility GetItemNameVisibility()
        {
            return Slot.Editable ? Visibility.Collapsed : Visibility.Visible;
        }

        public Visibility GetItemSelectionVisibility()
        {
            return Slot.Editable ? Visibility.Visible : Visibility.Collapsed;
        }
    }

}


