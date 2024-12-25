using System.Collections.ObjectModel;
using ArmyBuilder.Domain;


namespace ArmyBuilder.ViewModels
{
    public class UnitTreeNode
    {
        public string Name => _unit.Name;
        public float Points => _unit.TotalPoints();
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
                Children.Add(new MainModelTreeNode(mainModel));
            }
        }

        public void AddMainModel(MainModel mainModel)
        {
            _unit.AddMainModel(mainModel);
            Children.Add(new MainModelTreeNode(mainModel));
        }
    }
}




