using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArmyBuilder.Domain
{
    public class Profile
    {
        public int Id { get; set; }
        public int Movement { get; set; }
        public int WeaponSkill { get; set; }
        public int BallisticSkill { get; set; }
        public int Strength { get; set; }
        public int Toughness { get; set; }
        public int Wounds { get; set; }
        public int Initiative { get; set; }
        public int Attacks { get; set; }
        public int Moral { get; set; }
        public int Save { get; set; }
        public float Points { get; set; }

        public override bool Equals(object obj)
        {
            if (obj is Profile other)
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
