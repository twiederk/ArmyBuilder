using System.Collections.ObjectModel;

namespace ArmyBuilder.ViewModels
{
    public class UnitTreeNodeViewModel
    {
        public string Name { get; set; }
        public int Value { get; set; }
        public ObservableCollection<MainModelTreeNodeViewModel> Children { get; set; } = new ObservableCollection<MainModelTreeNodeViewModel>();
    }
}




