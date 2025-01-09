using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{
    public class EquipmentTreeNode
    {
        public string Name => "EquipmentTreeNode";
        public List<SlotViewModel> SlotViews => _equipmentView.SlotViews;

        private Equipment _equipment;
        private EquipmentViewModel _equipmentView;

        public EquipmentTreeNode(Equipment equipment)
        {
            _equipment = equipment;
            _equipmentView = new EquipmentViewModel(equipment);
        }
    }
}