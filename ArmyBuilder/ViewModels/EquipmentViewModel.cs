using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels {

    public class EquipmentViewModel {
        public int Id { get; set; }
        public List<SlotViewModel> SlotViews { get; set; } = new List<SlotViewModel>();
        private Equipment _equipment;

        
        public EquipmentViewModel(Equipment equipment) {
            _equipment = equipment;
            SlotViews = equipment.Slots.Select(slot => new SlotViewModel(slot)).ToList();
        }

    }

}