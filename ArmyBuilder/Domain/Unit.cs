namespace ArmyBuilder.Domain
{
    public class Unit
    {
        public string Name;

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