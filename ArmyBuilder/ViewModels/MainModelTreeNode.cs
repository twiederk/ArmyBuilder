using System.Collections.ObjectModel;

namespace ArmyBuilder.ViewModels
{
    public class MainModelTreeNode
    {
        public string Name { get; set; }
        public int Value { get; set; }
        public int Count { get; set; }
        public ObservableCollection<SingleModelTreeNode> Children { get; set; } = new ObservableCollection<SingleModelTreeNode>();
    }
}




