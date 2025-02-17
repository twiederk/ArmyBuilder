using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Windows;
using System.Windows.Input;
using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{
    public class MainModelTreeNode : INotifyPropertyChanged
    {
        public string Name => $"{MainModel.Name} ({MainModel.Points()})";
        public String Count => $"{MainModel.Count}x";
        public float TotalPoints => MainModel.TotalPoints();
        public MainModel MainModel { get; set; }
        public Unit Unit => _parent.Unit;
        private UnitTreeNode _parent;

        public string DisplayArmyCategory => MainModel.ArmyCategory.Display();


        public ObservableCollection<SingleModelTreeNode> SingleModels { get; set; } = new ObservableCollection<SingleModelTreeNode>();

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
                SingleModels.Add(new SingleModelTreeNode(singleModel, this));
            }
        }

        public void AddSingleModel(SingleModel singleModel)
        {
            SingleModels.Add(new SingleModelTreeNode(singleModel, this));
            OnPropertyChanged("TotalPoints");
            OnPropertyChanged("SingleModels");
            _parent.UpdateTotalPoints();
        }


        public void UpdateCount()
        {
            OnPropertyChanged("Count");
            OnPropertyChanged("TotalPoints");
            _parent.UpdateTotalPoints();
        }

        public void RemoveMainModel()
        {
            _parent.RemoveMainModel(this);
        }

        public void UpdateTotalPoints()
        {
            OnPropertyChanged("Name");
            OnPropertyChanged("TotalPoints");
            _parent.UpdateTotalPoints();
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

    }
}




