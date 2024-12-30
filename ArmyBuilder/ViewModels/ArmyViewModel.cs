using ArmyBuilder.Domain;
using ArmyBuilder.Dao;
using System.ComponentModel;

namespace ArmyBuilder.ViewModels
{
    public class ArmyViewModel : INotifyPropertyChanged
    {
        private readonly IArmyBuilderRepository _repository;
        private ArmyList _selectedArmyList;
        private MainModel _selectedMainModel;
        private List<MainModel> _characters;
        private List<MainModel> _troopers;
        private List<MainModel> _warMachines;
        private List<MainModel> _monsters;

        public ArmyViewModel(IArmyBuilderRepository repository)
        {
            _repository = repository;
        }

        public ArmyTreeViewModel ArmyTreeViewModel { get; set; }
        
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

        public Army CreateArmy(string armyListName, ArmyList armyList)
        {
            Army army = new Army($"{armyListName} Armee");
            army.ArmyList = armyList;
            army.Author = "Torsten";
            _repository.CreateArmy(army);
            return army;
        }

        public Unit CreateUnit(Army army, MainModel mainModel)
        {
            Unit unit = army.CreateUnit(mainModel);
            _repository.CreateUnit(army.Id, unit);
            _repository.AddMainModel(unit.Id, mainModel);
            return unit;
        }

        public void AddMainModel(int unitId, MainModel mainModel)
        {
            _repository.AddMainModel(unitId, mainModel);
        }


        private void LoadMainModels()
        {
            if (_selectedArmyList != null)
            {
                var mainModels = _repository.MainModels(_selectedArmyList.Id);
                Characters = mainModels.Where(mm => mm.ArmyCategory == ArmyCategory.Character).OrderBy(mm => mm.Name).ToList();
                Troopers = mainModels.Where(mm => mm.ArmyCategory == ArmyCategory.Trooper).OrderBy(mm => mm.Name).ToList();
                WarMachines = mainModels.Where(mm => mm.ArmyCategory == ArmyCategory.WarMachine).OrderBy(mm => mm.Name).ToList();
                Monsters = mainModels.Where(mm => mm.ArmyCategory == ArmyCategory.Monster).OrderBy(mm => mm.Name).ToList();
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




