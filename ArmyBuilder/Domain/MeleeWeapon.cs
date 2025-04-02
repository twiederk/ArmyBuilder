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
            switch(Id)
            {
                case ID_SECOND_HAND_WEAPON:
                    return $"{attacks}+1";
                default:
                    return attacks.ToString();
            }
        }

        public string DisplayInitiative(int initiative)
        {
            switch(Id)
            {
                case ID_TWO_HANDED_WEAPON:
                    return $"*{initiative}*";
                default:
                    return initiative.ToString();
            }
        }
    }

}
