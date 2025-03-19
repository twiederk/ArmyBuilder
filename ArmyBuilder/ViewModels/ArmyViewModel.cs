using ArmyBuilder.Domain;
using ArmyBuilder.Dao;
using System.ComponentModel;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace ArmyBuilder.ViewModels
{
    public class ArmyViewModel : INotifyPropertyChanged
    {
        private readonly IArmyBuilderRepository _repository;
        private ArmyListDigest _selectedArmyList;
        private MainModel _selectedMainModel;
        private List<MainModel> _characters;
        private List<MainModel> _troopers;
        private List<MainModel> _warMachines;
        private List<MainModel> _monsters;
        private List<SingleModel> _mounts;
        public BitmapImage Image { get; private set; }



        public ArmyViewModel(IArmyBuilderRepository repository)
        {
            _repository = repository;
        }

        public ArmyTreeViewModel ArmyTreeViewModel { get; set; }
        
        public ArmyListDigest SelectedArmyList
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
        public List<SingleModel> Mounts
        {
            get => _mounts;
            private set
            {
                _mounts = value;
                OnPropertyChanged(nameof(Mounts));
            }
        }

        public MainModel SelectedMainModel
        {
            get => _selectedMainModel;
            set
            {
                _selectedMainModel = value;
                OnPropertyChanged(nameof(SelectedMainModel));

                string relativePath = _selectedMainModel.ImagePath;
                string filePath = System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, relativePath);
                Image = new BitmapImage(new Uri(filePath, UriKind.Absolute));
                OnPropertyChanged(nameof(Image));
            }
        }

        public Army CreateArmy(string armyListName, ArmyListDigest armyList)
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

        public void UpdateMainModel(int unitId, MainModel mainModel)
        {
            _repository.UpdateMainModel(unitId, mainModel);
        }

        public void UpdateSingleModel(SingleModel singleModel)
        {
            _repository.UpdateSingleModel(singleModel);
        }

        private void LoadMainModels()
        {
            if (_selectedArmyList != null)
            {
                ArmyList armyList = new ArmyListLoader(_repository).LoadArmyList(_selectedArmyList);

                Characters = armyList.MainModels.Where(mm => mm.ArmyCategory == ArmyCategory.Character).OrderBy(mm => mm.Name).ToList();
                Troopers = armyList.MainModels.Where(mm => mm.ArmyCategory == ArmyCategory.Trooper).OrderBy(mm => mm.Name).ToList();
                WarMachines = armyList.MainModels.Where(mm => mm.ArmyCategory == ArmyCategory.WarMachine).OrderBy(mm => mm.Name).ToList();
                Monsters = armyList.MainModels.Where(mm => mm.ArmyCategory == ArmyCategory.Monster).OrderBy(mm => mm.Name).ToList();
                Mounts = _repository.Mounts(_selectedArmyList.Id).OrderBy(mm => mm.Name).ToList();

            }
            else
            {
                Characters = new List<MainModel>();
                Troopers = new List<MainModel>();
                WarMachines = new List<MainModel>();
                Monsters = new List<MainModel>();
                Mounts = new List<SingleModel>();
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public void DeleteUnit(int unitId)
        {
            _repository.DeleteUnit(unitId);
        }

        public void DeleteMainModelFromUnit(int unitId, int mainModelId)
        {
            _repository.DeleteMainModelFromUnit(unitId, mainModelId);
        }

        public void UpdateSlotItem(Slot slot)
        {
            _repository.UpdateSlotItem(slot);
        }

        public void AddSingleModelToMainModel(int mainModelId, SingleModel singleModel)
        {
            _repository.AddSingleModel(mainModelId, singleModel);
        }

    }

}




