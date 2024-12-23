namespace ArmyBuilder.Domain
{
    public class Unit
    {
        public string Name;
        public List<MainModelCount> MainModels { get; set; } = new List<MainModelCount>();


        public Unit(string name)
        {
            this.Name = name;
        }

        public int Points()
        {
            int totalPoints = 0;
            foreach (var pair in MainModels)
            {
                totalPoints += pair.First * (int)pair.Second.Points;
            }
            return totalPoints;
        }
    }
}