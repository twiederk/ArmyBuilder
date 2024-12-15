using ArmyBuilder.Domain;

namespace ArmyBuilder.Dao
{
    public interface IArmyBuilderRepository
    {
        List<ArmyList> ArmyLists();
        List<MainModel> MainModels(int armyId);
        SingleModel SingleModel(int id);
        MainModel MainModel(int id);
    }
}
