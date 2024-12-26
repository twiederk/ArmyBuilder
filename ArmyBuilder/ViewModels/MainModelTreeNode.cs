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

        public MainModelTreeNode(MainModel mainModel)
        {
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
            MessageBox.Show("IncreaseCount");
            _mainModel.Count++;
            MessageBox.Show($"Count increased to {_mainModel.Count}");
        }

        public ICommand IncreaseCountCommand => new RelayCommand(IncreaseCount);

        private void IncreaseCount(object parameter)
        {
            if (parameter is MainModelTreeNode node)
            {
                node.IncreaseCount();
                // Notify property changed if using INotifyPropertyChanged
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

    }
}




