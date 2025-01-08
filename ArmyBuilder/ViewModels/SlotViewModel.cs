using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels {

    public class SlotViewModel {

        public string ItemDisplay => $"{Item.Name} ({Item.Points})";
        public Item Item { get; set; }
        public bool Editable => _slot.Editable;
        public bool AllItems => _slot.AllItems;
        public List<Item> SelectableItems => _slot.SelectableItems;
        private Slot _slot;

        public SlotViewModel(Slot slot) {
            _slot = slot;
            Item = slot.Item;
        }

        
    }
}