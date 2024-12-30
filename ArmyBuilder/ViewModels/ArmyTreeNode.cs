using ArmyBuilder.Domain;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace ArmyBuilder.ViewModels
{
    public class ArmyTreeNode : INotifyPropertyChanged
    {
        public Army Army;
        public string Name => Army.Name;
        public float TotalPoints => Army.TotalPoints();
        public ObservableCollection<UnitTreeNode> Children { get; set; } = new ObservableCollection<UnitTreeNode>();


        public ArmyTreeNode(Army army)
        {
            Army = army;
            SetChildren();
        }

        private void SetChildren()
        {
            foreach (var unit in Army.Units)
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
