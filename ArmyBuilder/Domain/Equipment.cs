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

        public List<Slot> OrderedSlots() {
            return Slots.OrderBy(slot => slot.ItemClass).ToList();
        }

        public bool IsEmpty()
        {
            return !Slots.Any();
        }

        public List<Armor> Armor()
        {
            return Slots.Where(slot => slot.Item is Armor).Select(slot => slot.Item as Armor).ToList();
        }

        public List<Shield> Shield()
        {
            return Slots.Where(slot => slot.Item is Shield).Select(slot => slot.Item as Shield).ToList();
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

        public float ItemsPoints()
        {
            return Slots.Sum(slot => slot.Item.Points);
        }

        public float NonMagicItemsPoints()
        {
            return Slots.Where(slot => !slot.Item.Magic).Sum(slot => slot.Item.Points);
        }

        public float MagicItemsPoints()
        {
            return Slots.Where(slot => slot.Item.Magic).Sum(slot => slot.Item.Points);
        }
    }
}



