using ArmyBuilder.Domain;
using System.Collections.ObjectModel;

namespace ArmyBuilder.ViewModels
{
    public class ArmyTreeNode
    {
        public string Name => _army.Name;
        public int Points => _army.Points();
        public ObservableCollection<UnitTreeNode> Children { get; set; } = new ObservableCollection<UnitTreeNode>();

        private Army _army;

        public ArmyTreeNode(Army army)
        {
            _army = army;
            SetChildren();
        }

        private void SetChildren()
        {
            foreach (var unit in _army.Units)
            {
                Children.Add(new UnitTreeNode(unit));
            }
        }

    }
}
