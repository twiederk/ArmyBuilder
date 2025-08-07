using ArmyBuilder.Domain;

namespace ArmyBuilder.Dao
{
    public interface IArmyListRepository
    {
        List<ArmyListDigest> ArmyLists();
        List<MainModel> MainModels(int armyListId);
        List<MountModel> MountModels(int armyListId);
        SingleModel SingleModel(int id);
        MainModel MainModel(int id);
}
}