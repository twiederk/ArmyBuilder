using Dapper.Contrib.Extensions;

namespace ArmyBuilder.Domain
{
    [Table("unit")]
    public class Unit
    {
        public string Name;
        public List<MainModel> MainModels { get; set; } = new List<MainModel>();

        public Unit()
        {
        }

        public Unit(string name)
        {
            this.Name = name;
        }

        public float TotalPoints()
        {
            return MainModels.Sum(mainModel => mainModel.TotalPoints());
        }

        public void AddMainModel(MainModel mainModel)
        {
            MainModels.Add(mainModel);
        }
    }
}