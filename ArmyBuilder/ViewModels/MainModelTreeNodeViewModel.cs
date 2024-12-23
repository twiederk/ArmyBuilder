using System.Collections.ObjectModel;

namespace ArmyBuilder.ViewModels
{
    public class MainModelTreeNodeViewModel
    {
        public string Name { get; set; }
        public int Value { get; set; }
        public ObservableCollection<SingleModelTreeNodeViewModel> Children { get; set; } = new ObservableCollection<SingleModelTreeNodeViewModel>();
    }
}




