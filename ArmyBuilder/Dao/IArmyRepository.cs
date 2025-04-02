using ArmyBuilder.Domain;

namespace ArmyBuilder.Dao
{
    public interface IArmyRepository
    {
        List<Army> Armies();
        Army Army(int id);
        Army CreateArmy(Army army);
        Army UpdateArmy(Army army);
        void DeleteArmy(int id);
        Unit CreateUnit(int armyId, Unit unit);
        Unit UpdateUnit(Unit unit);
        MainModel AddMainModel(int unitId, MainModel mainModel);
        void UpdateMainModel(int unitId, MainModel mainModel);
        SingleModel AddSingleModel(int main_model_id, SingleModel singleModel);
        SingleModel UpdateSingleModel(SingleModel singleModel);
        void DeleteUnit(int unitId);
        void DeleteMainModelFromUnit(int unitId, int mainModelId);

    }
}