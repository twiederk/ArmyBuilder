using ArmyBuilder.Domain;

namespace ArmyBuilder.Dao
{
    public interface IArmyBuilderRepository
    {
        // ArmyList
        List<ArmyList> ArmyLists();
        List<MainModel> MainModels(int armyId);
        SingleModel SingleModel(int id);
        MainModel MainModel(int id);

        // Army
        List<Army> Armies();
        Army Army(int id);
        Army CreateArmy(Army army);
        Army UpdateArmy(Army army);
        void DeleteArmy(int id);
        Unit CreateUnit(int armyId, Unit unit);
        MainModel AddMainModel(int unitId, MainModel mainModel);
        void UpdateMainModelCount(int unitId, int mainModelId, int count);
        void DeleteUnit(int unitId);
        void DeleteMainModelFromUnit(int unitId, int mainModelId);
        List<Equipment> ArmyEquipment(int armyId);

        // Equipment
        List<MeleeWeapon> AllMeleeWeapon();
        List<RangedWeapon> AllRangedWeapon();
        List<Shield> AllShield();
        List<Armor> AllArmor();
        List<Standard> AllStandard();
        List<Instrument> AllInstrument();
        List<Misc> AllMisc();
        Equipment Equipment(int singleModelId);
        List<Equipment> ArmyListEquipment(int armyListId);
        void UpdateSlotItem(Slot slot);
    }
}
