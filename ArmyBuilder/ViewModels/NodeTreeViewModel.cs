using System.Collections.ObjectModel;

namespace ArmyBuilder.ViewModels
{
    public class NodeTreeViewModel
    {
        public string Name { get; set; }
        public int Value { get; set; }
        public ObservableCollection<NodeTreeViewModel> Children { get; set; } = new ObservableCollection<NodeTreeViewModel>();
    }
}




