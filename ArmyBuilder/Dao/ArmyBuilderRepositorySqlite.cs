using ArmyBuilder.Domain;
using System.Data;
using Dapper.Contrib.Extensions;
using Dapper;

namespace ArmyBuilder.Dao
{
    public class ArmyBuilderRepositorySqlite : IArmyBuilderRepository
    {

        private IArmyListRepository _armyListRepository;
        private IArmyRepository _armyRepository;
        private IEquipmentRepository _equipmentRepository;

        public ArmyBuilderRepositorySqlite(IDbConnection dbConnection)
        {
            _armyListRepository = new ArmyListRepositorySqlite(dbConnection);
            _armyRepository = new ArmyRepositorySqlite(dbConnection);
            _equipmentRepository = new EquipmentRepositorySqlite(dbConnection);
        }

        public List<ArmyListDigest> ArmyLists()
        {
            return _armyListRepository.ArmyLists();
        }
        
        public List<MainModel> MainModels(int armyListId) {
            return _armyListRepository.MainModels(armyListId);
        }

        public List<MountModel> MountModels(int armyListId) {
            return _armyListRepository.MountModels(armyListId);
        }

        public SingleModel SingleModel(int id) {
            return _armyListRepository.SingleModel(id);
        }

        public MainModel MainModel(int id) {
            return MainModel(id);
        }

        public List<Army> Armies() {
            return _armyRepository.Armies();
        }

        public Army Army(int id) {
            return _armyRepository.Army(id);
        }

        public Army CreateArmy(Army army) {
            return _armyRepository.CreateArmy(army);
        }

        public Army UpdateArmy(Army army) {
            return _armyRepository.UpdateArmy(army);
        }

        public void DeleteArmy(int id) {
            _armyRepository.DeleteArmy(id);
        }

        public Unit CreateUnit(int armyId, Unit unit) {
            return _armyRepository.CreateUnit(armyId, unit);
        }

        public Unit UpdateUnit(Unit unit)
        {
            return _armyRepository.UpdateUnit(unit);
        }

        public MainModel AddMainModel(int unitId, MainModel mainModel) {
            return _armyRepository.AddMainModel(unitId, mainModel);
        }

        public void UpdateMainModel(MainModel mainModel)
        {
            _armyRepository.UpdateMainModel(mainModel);
        }

        public SingleModel AddSingleModel(int main_model_id, SingleModel singleModel) {
            return _armyRepository.AddSingleModel(main_model_id, singleModel);
        }

        public SingleModel UpdateSingleModel(SingleModel singleModel) {
            return _armyRepository.UpdateSingleModel(singleModel);
        }

        public void DeleteUnit(int unitId) {
            _armyRepository.DeleteUnit(unitId);
        }

        public void DeleteMainModelFromUnit(int unitId, int mainModelId) {
            _armyRepository.DeleteMainModelFromUnit(unitId, mainModelId);
        }

        public List<MeleeWeapon> AllMeleeWeapon() {
            return _equipmentRepository.AllMeleeWeapon();
        }

        public List<RangedWeapon> AllRangedWeapon() {
            return _equipmentRepository.AllRangedWeapon();
        }

        public List<Shield> AllShield() {
            return _equipmentRepository.AllShield();
        }
        
        public List<Armor> AllArmor() {
            return _equipmentRepository.AllArmor();
        }
        
        public List<Standard> AllStandard() {
            return _equipmentRepository.AllStandard();
        }
        
        public List<Instrument> AllInstrument() {
            return _equipmentRepository.AllInstrument();
        }
        
        public List<Misc> AllMisc() {
            return _equipmentRepository.AllMisc();
        }
        
        public Equipment Equipment(int singleModelId) {
            return _equipmentRepository.Equipment(singleModelId);
        }
        
        public List<Equipment> ArmyListEquipment(int armyListId) {
            return _equipmentRepository.ArmyListEquipment(armyListId);
        }
        
        public List<Equipment> ArmyEquipment(int armyId) {
            return _equipmentRepository.ArmyEquipment(armyId);
        }
        
        public void UpdateSlotItem(Slot slot) {
            _equipmentRepository.UpdateSlotItem(slot);
        }

    }

}
