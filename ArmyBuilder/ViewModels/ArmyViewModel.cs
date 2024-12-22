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
        private List<MainModel> _characters;
        private List<MainModel> _troopers;
        private List<MainModel> _warMachines;
        private List<MainModel> _monsters;
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

        public List<MainModel> Characters
        {
            get => _characters;
            private set
            {
                _characters = value;
                OnPropertyChanged(nameof(Characters));
            }
        }

        public List<MainModel> Troopers
        {
            get => _troopers;
            private set
            {
                _troopers = value;
                OnPropertyChanged(nameof(Troopers));
            }
        }

        public List<MainModel> WarMachines
        {
            get => _warMachines;
            private set
            {
                _warMachines = value;
                OnPropertyChanged(nameof(WarMachines));
            }
        }
        public List<MainModel> Monsters
        {
            get => _monsters;
            private set
            {
                _monsters = value;
                OnPropertyChanged(nameof(Monsters));
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
                var mainModels = _repository.MainModels(_selectedArmyList.Id);
                Characters = mainModels.FindAll(mm => mm.ArmyCategory == ArmyCategory.Character);
                Troopers = mainModels.FindAll(mm => mm.ArmyCategory == ArmyCategory.Trooper);
                WarMachines = mainModels.FindAll(mm => mm.ArmyCategory == ArmyCategory.WarMachine);
                Monsters = mainModels.FindAll(mm => mm.ArmyCategory == ArmyCategory.Monster);
            }
            else
            {
                Characters = new List<MainModel>();
                Troopers = new List<MainModel>();
                WarMachines = new List<MainModel>();
                Monsters = new List<MainModel>();
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}


