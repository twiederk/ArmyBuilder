using ArmyBuilder.Domain;
using System.Collections.ObjectModel;

namespace ArmyBuilder.ViewModels
{
    public class ArmyTreeNode
    {
        public string Name => _army.Name;
        public int Points => _army.Points();
        private Army _army;

        public ArmyTreeNode(Army army)
        {
            _army = army;
        }


        public ObservableCollection<UnitTreeNode> Children { get; set; } = new ObservableCollection<UnitTreeNode>();
    }
}
