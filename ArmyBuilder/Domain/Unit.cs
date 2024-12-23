namespace ArmyBuilder.Domain
{
    public class Unit
    {
        public string Name;
        public List<Pair<int,MainModel>> MainModels { get; set; } = new List<Pair<int,MainModel>>();


        public Unit(string name)
        {
            this.Name = name;
        }

        public int Points()
        {
            return 75;
        }
    }
}