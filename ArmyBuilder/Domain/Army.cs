
namespace ArmyBuilder.Domain
{
    public class Army
    {
        public string Name;
        public List<Unit> Units { get; set; } = new List<Unit>();

        public Army(string name)
        {
            this.Name = name;
        }

        public float TotalPoints()
        {
            return Units.Sum(unit => unit.TotalPoints());
        }

        public Unit CreateUnit(MainModel mainModel)
        {
            Unit unit = new Unit(mainModel.Name);
            unit.MainModels.Add(mainModel);
            Units.Add(unit);
            return unit;

        }
    }
}