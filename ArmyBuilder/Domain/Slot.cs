using System.Windows.Navigation;

namespace ArmyBuilder.Domain
{
    public class Slot
    {
        public string ItemName => $"{Item.Name} ({Item.Points})";
        public int Id { get; set; }
        public Item Item { get; set; }
        public bool Editable { get; set; }
        public bool AllItems { get; set; }
        public List<Item> SelectableItems { get; set; }
    }
}