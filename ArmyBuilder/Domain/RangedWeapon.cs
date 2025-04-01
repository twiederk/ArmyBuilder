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

        public string DisplayAttacks(int attacks)
        {
            switch(Id)
            {
                case ID_PISTOL:
                    return $"{attacks}+1";
                default:
                    return attacks.ToString();
            }
        }

    }


}
