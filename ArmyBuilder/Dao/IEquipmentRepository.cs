using ArmyBuilder.Domain;

namespace ArmyBuilder.Dao
{
    public interface IEquipmentRepository
    {
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