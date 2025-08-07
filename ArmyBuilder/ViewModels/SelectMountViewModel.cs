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

        public SelectMountViewModel(List<MountModel> mountModels)
        {
            Mounts = new ObservableCollection<MountViewModel>(convertToMountViewModels(mountModels));
        }

        private List<MountViewModel> convertToMountViewModels(List<MountModel> mountModels)
        {
            List<MountViewModel> mountViewModels = new List<MountViewModel>();
            foreach (var mountModel in mountModels)
            {
                mountViewModels.Add(new MountViewModel(mountModel));
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