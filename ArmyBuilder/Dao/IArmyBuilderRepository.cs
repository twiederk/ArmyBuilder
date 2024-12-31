using ArmyBuilder.Domain;

namespace ArmyBuilder.Dao
{
    public interface IArmyBuilderRepository
    {
        List<ArmyList> ArmyLists();
        List<MainModel> MainModels(int armyId);
        SingleModel SingleModel(int id);
        MainModel MainModel(int id);
        List<Army> Armies();
        Army Army(int id);
        Army CreateArmy(Army army);
        void DeleteArmy(int id);
        Unit CreateUnit(int armyId, Unit unit);
        void AddMainModel(int unitId, MainModel mainModel);
        void UpdateMainModelCount(int unitId, int mainModelId, int count);
    }
}
