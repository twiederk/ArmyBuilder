using System.Collections.ObjectModel;
using System.ComponentModel;
using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{
    public class SelectMountViewModel : INotifyPropertyChanged
    {
        private MountViewModel _selectedMount;

        public ObservableCollection<MountViewModel> Mounts { get; set; }
        public MountViewModel SelectedMount
        {
            get { return _selectedMount; }
            set
            {
                if (_selectedMount != value)
                {
                    _selectedMount = value;
                    OnPropertyChanged(nameof(SelectedMount));
                }
            }
        }

        public SelectMountViewModel(List<SingleModel> singleModels)
        {
            Mounts = new ObservableCollection<MountViewModel>(convertToMountViewModels(singleModels));
        }

        private List<MountViewModel> convertToMountViewModels(List<SingleModel> singleModels)
        {
            List<MountViewModel> mountViewModels = new List<MountViewModel>();
            foreach (var singleModel in singleModels)
            {
                mountViewModels.Add(new MountViewModel(singleModel));
            }
            return mountViewModels;
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}