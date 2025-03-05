using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{
    public class EquipmentTreeNode
    {
        public List<SlotViewModel> SlotViews { get; set; } = new List<SlotViewModel>();
        private SingleModelTreeNode _parent;
        private Equipment _equipment;

        public EquipmentTreeNode(Equipment equipment, SingleModelTreeNode parent)
        {
            _parent = parent;
            _equipment = equipment;
            SlotViews = equipment.OrderedSlots().Select(slot => new SlotViewModel(slot)).ToList();
        }

        public void UpdateEquipment()
        {
            _parent.UpdateEquipment();
        }
    }
}