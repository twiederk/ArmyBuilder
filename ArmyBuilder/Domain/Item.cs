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

        public override bool Equals(object obj)
        {
            if (obj == null || GetType() != obj.GetType())
                return false;

            Item other = (Item)obj;
            return Id == other.Id;
        }

        public override int GetHashCode()
        {
            return Id.GetHashCode();
        }

        public override string ToString()
        {
            return $"Id: {Id}, Name: {Name}";
        }
    }
}
