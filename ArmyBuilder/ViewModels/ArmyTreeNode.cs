using ArmyBuilder.Domain;
using System.Collections.ObjectModel;

namespace ArmyBuilder.ViewModels
{
    public class ArmyTreeNode
    {
        public string Name => _army.Name;
        private Army _army;
        public int Points => _army.Points();

        public ArmyTreeNode(Army army)
        {
            _army = army;
        }


        public ObservableCollection<UnitTreeNode> Children { get; set; } = new ObservableCollection<UnitTreeNode>();
    }
}
