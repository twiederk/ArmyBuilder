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
        public string Count => $"{MainModel.Count}x";
        public float TotalPoints => MainModel.TotalPoints();
        public string Description => MainModel.Description;
        public MainModel MainModel { get; set; }
        public Unit Unit => _parent.Unit;
        public string DisplayArmyCategory => MainModel.ArmyCategory.Display();
        public Visibility MountButtonVisibility => GetMountButtonVisibility();
        public Visibility CountButtonVisibility => GetCountButtonVisibility();
        public Visibility TrooperVisiblity => GetTrooperVisibility();
        public Visibility DescriptionVisibility => GetDescriptionVisibilty();
        public string StandardBearerLabel => StandardBearerText();
        public string MusicianLabel => MusicianText();

        public bool StandardBearer
        {
            get => MainModel.StandardBearer;
            set
            {
                if (MainModel.StandardBearer != value)
                {
                    MainModel.StandardBearer = value;
                    OnPropertyChanged(nameof(StandardBearer));
                }
            }
        }
        public bool Musician
        {
            get => MainModel.Musician;
            set
            {
                if (MainModel.Musician != value)
                {
                    MainModel.Musician = value;
                    OnPropertyChanged(nameof(Musician));
                }
            }
        }

        private UnitTreeNode _parent;

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
            MainModel.AddMount(singleModel);
            SingleModels.Add(new SingleModelTreeNode(singleModel, this));
            OnPropertyChanged("TotalPoints");
            SingleModels[0].OnPropertyChanged("Save");
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
            OnPropertyChanged("StandardBearerLabel");
            OnPropertyChanged("MusicianLabel");
            _parent.UpdateTotalPoints();
        }

        public void UpdateName() => OnPropertyChanged("Name");

        public Visibility GetMountButtonVisibility()
        {
            return MainModel.ArmyCategory == ArmyCategory.Character ? Visibility.Visible : Visibility.Collapsed;
        }

        public Visibility GetCountButtonVisibility()
        {
            return MainModel.ArmyCategory == ArmyCategory.Character ? Visibility.Collapsed : Visibility.Visible;
        }

        public Visibility GetTrooperVisibility()
        {
            return MainModel.ArmyCategory == ArmyCategory.Trooper ? Visibility.Visible : Visibility.Collapsed;
        }

        public Visibility GetDescriptionVisibilty()
        {
            return string.IsNullOrEmpty(MainModel.Description) ? Visibility.Collapsed : Visibility.Visible;
        }

        public string StandardBearerText() {
            return $"Standartenträger ({MainModel.ModelPoints() * 2})";
        }

        public string MusicianText() {
            return $"Musiker ({MainModel.ModelPoints() * 2})";
        }

        public event PropertyChangedEventHandler? PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}




