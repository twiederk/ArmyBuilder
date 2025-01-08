namespace ArmyBuilder.Domain
{
    public class Item
    {

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public ArmyList ArmyList { get; set; }
        public bool Magic { get; set; }
        public float Points { get; set; }
    }
}
