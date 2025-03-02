namespace ArmyBuilder.Domain
{
    public class ArmyList
    {
        public List<MainModel> MainModels;

        public ArmyList(List<MainModel> mainModels) {
            this.MainModels = mainModels;
        }
    }
}