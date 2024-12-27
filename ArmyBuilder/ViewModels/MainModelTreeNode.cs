using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Windows;
using System.Windows.Input;
using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{
    public class MainModelTreeNode : INotifyPropertyChanged
    {
        public string Name => $"{_mainModel.Name} ({_mainModel.Points})";
        public String Count => $"{_mainModel.Count}x";
        public float TotalPoints => _mainModel.TotalPoints();
        private MainModel _mainModel;
        private UnitTreeNode _parent;

        public string DisplayArmyCategory
        {
            get
            {
                switch (_mainModel.ArmyCategory)
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
            _mainModel = mainModel;
            SetChildren();
        }

        private void SetChildren()
        {
            foreach (var singleModel in _mainModel.SingleModels)
            {
                Children.Add(new SingleModelTreeNode(singleModel));
            }
        }

        public void IncreaseCount()
        {
            _mainModel.Count++;
        }

        public ICommand IncreaseCountCommand => new RelayCommand(IncreaseCount);

        private void IncreaseCount(object parameter)
        {
            if (parameter is MainModelTreeNode node)
            {
                node.IncreaseCount();
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




