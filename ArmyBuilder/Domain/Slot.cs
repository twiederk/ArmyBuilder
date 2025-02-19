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
        public List<Item> Selection { get; set; } = new List<Item>();

        public bool IsAllItems()
        {
            return Selection.Count() == 0;
        }

        public override bool Equals(object obj)
        {
            if (obj is Slot other)
            {
                return Id == other.Id;
            }
            return false;
        }

        public override int GetHashCode()
        {
            return Id.GetHashCode();
        }
    }
}