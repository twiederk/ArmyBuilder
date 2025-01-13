using ArmyBuilder.Domain;
using ArmyBuilder.Dao;
using System.ComponentModel;
using System.Windows;

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

        public void UpdateMainModelCount(int unitId, int mainModelId, int count)
        {
            _repository.UpdateMainModelCount(unitId, mainModelId, count);
        }

        private void LoadMainModels()
        {
            if (_selectedArmyList != null)
            {
                var mainModels = _repository.MainModels(_selectedArmyList.Id);
                var equipment = _repository.ArmyListEquipment(_selectedArmyList.Id);
                assignEquipment(mainModels, equipment);
                assignSelectableItems(mainModels, _selectedArmyList);

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

        public void assignEquipment(List<MainModel> mainModels, List<Equipment> equipment)
        {
            var equipmentDictionary = equipment.ToDictionary(e => e.Id);
            foreach (var mainModel in mainModels)
            {
                foreach (var singleModel in mainModel.SingleModels)
                {
                    if (equipmentDictionary.TryGetValue(singleModel.Id, out var singleModelEquipment))
                    {
                        singleModel.Equipment = singleModelEquipment;
                    }
                }
            }
        }

        private void assignSelectableItems(List<MainModel> mainModels, ArmyList armyList)
        {
            foreach (var mainModel in mainModels)
            {
                foreach (var singleModel in mainModel.SingleModels)
                {
                    if (singleModel.Equipment != null)
                    {
                        foreach (var slot in singleModel.Equipment.Slots)
                        {
                            if (slot.IsAllItems())
                            {
                                slot.SelectableItems = selectableItems(slot, armyList);
                            }
                        }
                    }
                }
            }
        }

        private List<Item> selectableItems(Slot slot, ArmyList armyList)
        {
            var allMeleeWeapon = _repository.AllMeleeWeapon();
            var allRangedWeapon = _repository.AllRangedWeapon();
            var allShield = _repository.AllShield();
            var allArmor = _repository.AllArmor();
            var allStandard = _repository.AllStandard();
            var allInstrument = _repository.AllInstrument();
            var allMisc = _repository.AllMisc();

            switch (slot.ItemClass)
            {
                case ItemClass.MeleeWeapon:
                    return allMeleeWeapon.Cast<Item>().Where(i => i.ArmyList == null || i.ArmyList == armyList).OrderBy(i => i.Name).ToList();
                case ItemClass.RangedWeapon:
                    return allRangedWeapon.Cast<Item>().Where(i => i.ArmyList == null || i.ArmyList == armyList).OrderBy(i => i.Name).ToList();
                case ItemClass.Shield:
                    return allShield.Cast<Item>().Where(i => i.ArmyList == null || i.ArmyList == armyList).OrderBy(i => i.Name).ToList();
                case ItemClass.Armor:
                    return allArmor.Cast<Item>().Where(i => i.ArmyList == null || i.ArmyList == armyList).OrderBy(i => i.Name).ToList();
                case ItemClass.Standard:
                    return allStandard.Cast<Item>().Where(i => i.ArmyList == null || i.ArmyList == armyList).OrderBy(i => i.Name).ToList();
                case ItemClass.Instrument:
                    return allInstrument.Cast<Item>().Where(i => i.ArmyList == null || i.ArmyList == armyList).OrderBy(i => i.Name).ToList();
                case ItemClass.Misc:
                    return allMisc.Cast<Item>().Where(i => i.ArmyList == null || i.ArmyList == armyList).OrderBy(i => i.Name).ToList();
                default:
                    return new List<Item>() {
                        new Item
                        {
                            Id = slot.Item.Id,
                            Name = $"UNKNOWN ITEM with id: {slot.Item.Id}",
                        }
                    };
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
    }

}




