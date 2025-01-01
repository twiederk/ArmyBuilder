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
        public ObservableCollection<UnitTreeNode> Units { get; set; } = new ObservableCollection<UnitTreeNode>();


        public ArmyTreeNode(Army army)
        {
            Army = army;
            SetChildren();
        }

        private void SetChildren()
        {
            foreach (var unit in Army.Units)
            {
                Units.Add(new UnitTreeNode(unit, this));
            }
        }

        public void AddUnit(Unit unit)
        {
            Units.Add(new UnitTreeNode(unit, this));
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

        public void RemoveUnit(UnitTreeNode unitTreeNode)
        {
            Army.RemoveUnit(unitTreeNode.Unit);
            Units.Remove(unitTreeNode);
        }
    }
}
