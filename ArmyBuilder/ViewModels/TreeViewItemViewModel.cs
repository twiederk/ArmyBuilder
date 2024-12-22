using System.Collections.ObjectModel;

namespace ArmyBuilder.ViewModels
{
    public class TreeViewItemViewModel
    {
        public string Name { get; set; }
        public int Value { get; set; }
        public ObservableCollection<TreeViewItemViewModel> Children { get; set; } = new ObservableCollection<TreeViewItemViewModel>();
    }
}




