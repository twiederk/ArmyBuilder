using ArmyBuilder.Domain;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace ArmyBuilder.ViewModels
{
    public class ArmyTreeNode : INotifyPropertyChanged
    {
        public string Name => _army.Name;
        public float TotalPoints => _army.TotalPoints();
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
                Children.Add(new UnitTreeNode(unit, this));
            }
        }

        public void AddUnit(Unit unit)
        {
            Children.Add(new UnitTreeNode(unit, this));
            UpdateTotalPoints();
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public void UpdateTotalPoints()
        {
            OnPropertyChanged("TotalPoints");
        }
    }
}
