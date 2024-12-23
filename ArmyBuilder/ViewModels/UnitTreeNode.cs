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
            SetChildren();
        }

        private void SetChildren()
        {
            foreach (var mainModel in _unit.MainModels)
            {
                Children.Add(new MainModelTreeNode(mainModel.Second, mainModel.First));
            }
        }
    }
}




