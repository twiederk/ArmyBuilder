using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels {

    public class SlotViewModel {

        public string ItemName => SelectedItem.Name;
        public ItemViewModel SelectedItem { get; set; }
        public bool Editable => _slot.Editable;
        public bool AllItems => _slot.AllItems;
        public List<ItemViewModel> SelectableItems { get; set; } = new List<ItemViewModel>();
        private Slot _slot;

        public SlotViewModel(Slot slot) {
            _slot = slot;
            SelectedItem = new ItemViewModel(slot.Item);
            SelectableItems = slot.SelectableItems.Select(item => new ItemViewModel(item)).ToList();
        }

        public void UpdateItem()
        {
            _slot.Item = SelectedItem.Item;
        }


    }
}