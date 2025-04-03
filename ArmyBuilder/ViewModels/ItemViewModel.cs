using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{
    public class ItemViewModel
    {
        public string Name => $"{Item.Name} ({Item.Points})";
        public string NameDescription => nameAndDescription();
        public string Description => Item.Description;
        public Item Item { get; set; }

        public ItemViewModel(Item item)
        {
            Item = item;
        }

        private string nameAndDescription()
        {
            if (Item.Description.Length == 0)
            {
                return Name;
            }
            return $"{Name}: {Item.Description}";
        }

        public override bool Equals(object obj)
        {
            if (obj == null || GetType() != obj.GetType())
                return false;

            ItemViewModel other = (ItemViewModel)obj;
            return Item.Equals(other.Item);
        }

        public override int GetHashCode()
        {
            return Item.GetHashCode();
        }
    }
}