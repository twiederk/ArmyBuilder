using System.Collections.ObjectModel;

namespace ArmyBuilder.ViewModels
{
    public class UnitTreeNode
    {
        public string Name { get; set; }
        public int Value { get; set; }
        public ObservableCollection<MainModelTreeNode> Children { get; set; } = new ObservableCollection<MainModelTreeNode>();
    }
}




