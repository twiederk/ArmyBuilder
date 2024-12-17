using ArmyBuilder.Domain;
using ArmyBuilder.Dao;
using System.Collections.Generic;
using System.ComponentModel;

namespace ArmyBuilder.ViewModels
{
    public class ArmyViewModel : INotifyPropertyChanged
    {
        private readonly IArmyBuilderRepository _repository;
        private ArmyList _selectedArmyList;
        private List<MainModel> _mainModels;
        private MainModel _selectedMainModel;

        public ArmyViewModel(IArmyBuilderRepository repository)
        {
            _repository = repository;
        }

        public ArmyList SelectedArmyList
        {
            get => _selectedArmyList;
            set
            {
                _selectedArmyList = value;
                OnPropertyChanged(nameof(SelectedArmyList));
                LoadMainModels();
            }
        }

        public List<MainModel> MainModels
        {
            get => _mainModels;
            private set
            {
                _mainModels = value;
                OnPropertyChanged(nameof(MainModels));
            }
        }

        public MainModel SelectedMainModel
        {
            get => _selectedMainModel;
            set
            {
                _selectedMainModel = value;
                OnPropertyChanged(nameof(SelectedMainModel));
            }
        }

        private void LoadMainModels()
        {
            if (_selectedArmyList != null)
            {
                MainModels = _repository.MainModels(_selectedArmyList.Id);
            }
            else
            {
                MainModels = new List<MainModel>();
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}


