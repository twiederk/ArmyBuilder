using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArmyBuilder.Domain
{
    public class RangedWeapon: Item
    {
        public int Strength;
        public int Range;
        public int Damage = 1;
    }
}
