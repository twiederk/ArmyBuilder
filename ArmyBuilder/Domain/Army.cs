namespace ArmyBuilder.Domain
{
    public class Army
    {
        public string Name;

        public Army(string name)
        {
            this.Name = name;
        }

        public int Points()
        {
            return 100;
        }
    }
}