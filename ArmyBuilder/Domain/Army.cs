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

        public int Points()
        {
            int totalPoints = 0;
            foreach (var unit in Units)
            {
                totalPoints += unit.Points();
            }
            return totalPoints;
        }
    }
}