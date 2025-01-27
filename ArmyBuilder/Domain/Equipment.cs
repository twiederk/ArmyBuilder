using Dapper.Contrib.Extensions;
using System.Collections.Generic;
using System.Linq;

namespace ArmyBuilder.Domain
{
    public class Equipment
    {
        public int Id { get; set; }
        public List<Slot> Slots { get; set; } = new List<Slot>();

        public List<string> ItemNames()
        {
            return Slots.Where(slot => slot.Item.Points > 0).Select(slot => $"{slot.Item.Name} ({slot.Item.Points})").ToList();
        }

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


