using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Windows;
using System.Windows.Input;
using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{
    public class MainModelTreeNode : INotifyPropertyChanged
    {
        public string Name => $"{MainModel.Name} ({MainModel.Points})";
        public String Count => $"{MainModel.Count}x";
        public float TotalPoints => MainModel.TotalPoints();
        public MainModel MainModel { get; set; }
        public Unit Unit => _parent.Unit;
        private UnitTreeNode _parent;

        public string DisplayArmyCategory
        {
            get
            {
                switch (MainModel.ArmyCategory)
                {
                    case ArmyCategory.Character:
                        return "Charakter";
                    case ArmyCategory.Trooper:
                        return "Regiment";
                    case ArmyCategory.WarMachine:
                        return "Kriegsgerät";
                    case ArmyCategory.Monster:
                        return "Monster";
                    default:
                        return "Unbekannt";
                }
            }
        }

        public ObservableCollection<SingleModelTreeNode> Children { get; set; } = new ObservableCollection<SingleModelTreeNode>();

        public MainModelTreeNode(MainModel mainModel, UnitTreeNode parent)
        {
            _parent = parent;
            MainModel = mainModel;
            SetChildren();
        }

        private void SetChildren()
        {
            foreach (var singleModel in MainModel.SingleModels)
            {
                Children.Add(new SingleModelTreeNode(singleModel));
            }
        }

        public void DecreaseCount()
        {
            MainModel.DecreaseCount();
        }

        public ICommand DecreaseCountCommand => new RelayCommand(DecreaseCount);

        public void IncreaseCount()
        {
            OnPropertyChanged(nameof(Count));
            OnPropertyChanged(nameof(TotalPoints));
            _parent.UpdateTotalPoints();
        }

        private void DecreaseCount(object parameter)
        {
            if (parameter is MainModelTreeNode mainModelTreeNode)
            {
                mainModelTreeNode.DecreaseCount();
                OnPropertyChanged(nameof(Count));
                OnPropertyChanged(nameof(TotalPoints));
                _parent.UpdateTotalPoints();
            }
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




