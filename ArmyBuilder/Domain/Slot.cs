namespace ArmyBuilder.Domain
{
    public class Slot
    {
        public int Id { get; set; }
        public Item Item { get; set; }
        public ItemClass ItemClass { get; set; }
        public bool Editable { get; set; }
        public bool AllItems { get; set; }
        public bool Magic { get; set; }
        public List<Item> SelectableItems { get; set; } = new List<Item>();
    }
}