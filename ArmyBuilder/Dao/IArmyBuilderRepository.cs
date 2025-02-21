using ArmyBuilder.Domain;

namespace ArmyBuilder.Dao
{
    public interface IArmyBuilderRepository: IArmyListRepository, IArmyRepository, IEquipmentRepository
    {
    }
}
