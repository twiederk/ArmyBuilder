
namespace ArmyBuilder.Domain
{
    public class Unit
    {
        public string Name;
        public List<MainModel> MainModels { get; set; } = new List<MainModel>();


        public Unit(string name)
        {
            this.Name = name;
        }

        public float Points()
        {
            float totalPoints = 0;
            foreach (var mainModel in MainModels)
            {
                totalPoints += mainModel.Count * mainModel.Points;
            }
            return totalPoints;
        }

        public void AddMainModel(MainModel mainModel)
        {
            MainModels.Add(mainModel);
        }
    }
}