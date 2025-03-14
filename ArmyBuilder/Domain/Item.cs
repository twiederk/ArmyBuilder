namespace ArmyBuilder.Domain
{
    public class Item
    {
        public const int ID_HAND_WEAPON = 1;
        public const int ID_TWO_HANDED_WEAPON = 2;
        public const int ID_FLAIL = 3;
        public const int ID_HELBERD = 4;
        public const int ID_SPEAR = 5;
        public const int ID_LANCE = 6;
        public const int ID_EXECUTIONEER_AXE = 7;
        public const int ID_SECOND_HAND_WEAPON = 8;
        public const int ID_TWO_HANDED_SWORD_OF_HOETH = 9;

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public ArmyListDigest? ArmyList { get; set; }
        public bool Magic { get; set; }
        public bool Uniquely { get; set; }
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
