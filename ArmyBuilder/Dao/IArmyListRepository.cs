using ArmyBuilder.Domain;

namespace ArmyBuilder.Dao
{
    public interface IArmyListRepository
    {
        List<ArmyList> ArmyLists();
        List<MainModel> MainModels(int armyListId);
        List<SingleModel> Mounts(int armyListId);
        SingleModel SingleModel(int id);
        MainModel MainModel(int id);
}
}