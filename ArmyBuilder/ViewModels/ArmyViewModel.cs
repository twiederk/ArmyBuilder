using ArmyBuilder.Domain;
using ArmyBuilder.Dao;
using System.ComponentModel;
using System.Windows.Media.Imaging;

namespace ArmyBuilder.ViewModels
{
    public class ArmyViewModel : INotifyPropertyChanged
    {
        public BitmapImage? Image { get; private set; }

        private readonly IArmyBuilderRepository _repository;
        private ArmyListDigest _selectedArmyList;
        private ArmyMainModelViewModel _selectedMainModel;
        private List<ArmyMainModelViewModel> _characters;
        private List<ArmyMainModelViewModel> _troopers;
        private List<ArmyMainModelViewModel> _warMachines;
        private List<ArmyMainModelViewModel> _monsters;
        private List<SingleModel> _mounts;

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

        public List<ArmyMainModelViewModel> Characters
        {
            get => _characters;
            private set
            {
                _characters = value;
                OnPropertyChanged(nameof(Characters));
            }
        }

        public List<ArmyMainModelViewModel> Troopers
        {
            get => _troopers;
            private set
            {
                _troopers = value;
                OnPropertyChanged(nameof(Troopers));
            }
        }

        public List<ArmyMainModelViewModel> WarMachines
        {
            get => _warMachines;
            private set
            {
                _warMachines = value;
                OnPropertyChanged(nameof(WarMachines));
            }
        }
        public List<ArmyMainModelViewModel> Monsters
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

        public ArmyMainModelViewModel SelectedMainModel
        {
            get => _selectedMainModel;
            set
            {
                _selectedMainModel = value;
                OnPropertyChanged(nameof(SelectedMainModel));

                Image = loadImage(_selectedMainModel);
                OnPropertyChanged(nameof(Image));
            }
        }

        private BitmapImage? loadImage(ArmyMainModelViewModel armyMainModelViewModel)
        {
            if (armyMainModelViewModel == null)
            {
                return null;
            }
            MainModel mainModel = armyMainModelViewModel.MainModel;
            if (mainModel == null || mainModel.Figures == null || mainModel.Figures.Count == 0)
            {
                return null;
            }

            string relativePath = armyMainModelViewModel.ImagePath();
            if (string.IsNullOrEmpty(relativePath))
            {
                return null;
            }

            string filePath = System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "images", relativePath);
            if (!System.IO.File.Exists(filePath))
            {
                return null;
            }
            return new BitmapImage(new Uri(filePath, UriKind.Absolute));

        }

        public Army CreateArmy(string armyListName, ArmyListDigest armyList)
        {
            Army army = new Army($"{armyListName} Armee");
            army.ArmyList = armyList;
            army.Author = Environment.UserName;
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

        public void UpdateUnit(Unit unit)
        {
            _repository.UpdateUnit(unit);
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

                Characters = armyList.MainModels.Where(mm => mm.ArmyCategory == ArmyCategory.Character).OrderBy(mm => mm.Name).Select(mm => new ArmyMainModelViewModel(mm)).ToList();
                Troopers = armyList.MainModels.Where(mm => mm.ArmyCategory == ArmyCategory.Trooper).OrderBy(mm => mm.Name).Select(mm => new ArmyMainModelViewModel(mm)).ToList();
                WarMachines = armyList.MainModels.Where(mm => mm.ArmyCategory == ArmyCategory.WarMachine).OrderBy(mm => mm.Name).Select(mm => new ArmyMainModelViewModel(mm)).ToList();
                Monsters = armyList.MainModels.Where(mm => mm.ArmyCategory == ArmyCategory.Monster).OrderBy(mm => mm.Name).Select(mm => new ArmyMainModelViewModel(mm)).ToList();
                Mounts = _repository.Mounts(_selectedArmyList.Id).OrderBy(mm => mm.Name).ToList();

            }
            else
            {
                Characters = new List<ArmyMainModelViewModel>();
                Troopers = new List<ArmyMainModelViewModel>();
                WarMachines = new List<ArmyMainModelViewModel>();
                Monsters = new List<ArmyMainModelViewModel>();
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

        public void PrevImage()
        {
            if (SelectedMainModel == null)
            {
                return;
            }
            SelectedMainModel.PreviousImage();
            Image = loadImage(SelectedMainModel);
            OnPropertyChanged(nameof(Image));
        }

        public void NextImage()
        {
            if (SelectedMainModel == null)
            {
                return;
            }
            SelectedMainModel.NextImage();
            Image = loadImage(SelectedMainModel);
            OnPropertyChanged(nameof(Image));
        }

    }

}




