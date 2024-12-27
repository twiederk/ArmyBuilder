using System.Collections.ObjectModel;
using System.ComponentModel;
using ArmyBuilder.Domain;


namespace ArmyBuilder.ViewModels
{
    public class UnitTreeNode : INotifyPropertyChanged
    {
        public string Name => _unit.Name;
        public float TotalPoints => _unit.TotalPoints();
        public ObservableCollection<MainModelTreeNode> Children { get; set; } = new ObservableCollection<MainModelTreeNode>();
        private Unit _unit;
        private ArmyTreeNode _parent;

        public UnitTreeNode(Unit unit, ArmyTreeNode parent)
        {
            _parent = parent;
            _unit = unit;
            SetChildren();
        }

        private void SetChildren()
        {
            foreach (var mainModel in _unit.MainModels)
            {
                Children.Add(new MainModelTreeNode(mainModel, this));
            }
        }

        public void AddMainModel(MainModel mainModel)
        {
            _unit.AddMainModel(mainModel);
            Children.Add(new MainModelTreeNode(mainModel, this));
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public void UpdateTotalPoints()
        {
            OnPropertyChanged("TotalPoints");
            _parent.UpdateTotalPoints();
        }
    }
}




