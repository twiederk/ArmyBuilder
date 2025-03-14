using System.Data.SQLite;
using System.Reflection;
using Dapper.Contrib.Extensions;

namespace ArmyBuilder.Domain
{
    [Table("melee_weapon")]
    public class MeleeWeapon: Item
    {
        public int Strength { get; set; }

        public string DisplayStrength(int profileStrength, MovementType movementType = MovementType.OnFoot)
        {
            int totalStrength = profileStrength + Strength;

            switch (Id)
            {
                case ID_TWO_HANDED_WEAPON:           
                    return $"*{totalStrength}*";
                case ID_SPEAR:
                case ID_LANCE:
                    if (movementType == MovementType.OnMount)
                        return $"{totalStrength}/{profileStrength}";
                    else
                        return $"{profileStrength}";
                case ID_FLAIL:
                    return $"{totalStrength}/{profileStrength}";
                default:
                    return totalStrength.ToString();
            }
        }

        public string DisplayAttacks(int attacks)
        {
            if (Id == ID_SECOND_HAND_WEAPON)
                return $"{attacks}+1";
            else
                return attacks.ToString();
        }
    }

}
