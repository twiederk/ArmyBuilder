using System.Collections.ObjectModel;
using System.ComponentModel;
using ArmyBuilder.Domain;


namespace ArmyBuilder.ViewModels
{
    public class UnitTreeNode : INotifyPropertyChanged
    {
        public  Unit Unit { get; set; }
        public string Name => Unit.Name;
        public float TotalPoints => Unit.TotalPoints();
        public ObservableCollection<MainModelTreeNode> Children { get; set; } = new ObservableCollection<MainModelTreeNode>();
        private ArmyTreeNode _parent;

        public UnitTreeNode(Unit unit, ArmyTreeNode parent)
        {
            _parent = parent;
            Unit = unit;
            SetChildren();
        }

        private void SetChildren()
        {
            foreach (var mainModel in Unit.MainModels)
            {
                Children.Add(new MainModelTreeNode(mainModel, this));
            }
        }

        public void AddMainModel(MainModel mainModel)
        {
            Unit.AddMainModel(mainModel);
            Children.Add(new MainModelTreeNode(mainModel, this));
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
            _parent.UpdateTotalPoints();
        }
    }
}




