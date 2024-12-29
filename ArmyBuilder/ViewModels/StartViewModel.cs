using ArmyBuilder.Domain;
using ArmyBuilder.Dao;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace ArmyBuilder.ViewModels
{
    public class StartViewModel : INotifyPropertyChanged
    {
        private readonly IArmyBuilderRepository _repository;
        private ObservableCollection<Army> _armies;

        public StartViewModel(IArmyBuilderRepository repository)
        {
            _repository = repository;
            LoadArmies();
        }

        public ObservableCollection<Army> Armies
        {
            get => _armies;
            set
            {
                _armies = value;
                OnPropertyChanged();
            }
        }

        private void LoadArmies()
        {
            var armies = _repository.Armies();
            Armies = new ObservableCollection<Army>(armies);
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
