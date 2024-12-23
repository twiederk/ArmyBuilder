using System.Collections.ObjectModel;
using ArmyBuilder.Domain;


namespace ArmyBuilder.ViewModels
{
    public class UnitTreeNode
    {
        public string Name => _unit.Name;
        public int Points => _unit.Points();
        public ObservableCollection<MainModelTreeNode> Children { get; set; } = new ObservableCollection<MainModelTreeNode>();
        private Unit _unit;

        public UnitTreeNode(Unit unit)
        {
            _unit = unit;
        }
    }
}




