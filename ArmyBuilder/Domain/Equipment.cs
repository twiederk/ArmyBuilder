namespace ArmyBuilder.Domain
{
    public class Equipment
    {
        public int Id { get; set; }
        public List<Slot> Slots { get; set; } = new List<Slot>();

        public override bool Equals(object obj)
        {
            if (obj is Equipment other)
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



