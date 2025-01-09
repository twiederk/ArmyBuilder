using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{
    public class EquipmentTreeNode
    {
        public string Name => "EquipmentTreeNode";
        public List<SlotViewModel> SlotViews { get; set; } = new List<SlotViewModel>();
        private Equipment _equipment;

        public EquipmentTreeNode(Equipment equipment)
        {
            _equipment = equipment;
            SlotViews = equipment.Slots.Select(slot => new SlotViewModel(slot)).ToList();
        }
    }
}