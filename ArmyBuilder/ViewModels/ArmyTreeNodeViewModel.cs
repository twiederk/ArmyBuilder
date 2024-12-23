using System.Collections.ObjectModel;

namespace ArmyBuilder.ViewModels
{
    public class ArmyTreeNodeViewModel
    {
        public string Name { get; set; }
        public int Value { get; set; }
        public ObservableCollection<UnitTreeNodeViewModel> Children { get; set; } = new ObservableCollection<UnitTreeNodeViewModel>();
    }
}




