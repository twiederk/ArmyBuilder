using System.Data.SQLite;
using System.Reflection;
using Dapper.Contrib.Extensions;

namespace ArmyBuilder.Domain
{
    [Table("melee_weapon")]
    public class MeleeWeapon: Item
    {
        public int Strength { get; set; }

        const int ID_TWO_HANDED_WEAPON = 1000;
        const int ID_LANCE = 1001;

        public string DisplayStrength(int profileStrength)
        {
            int totalStrength = profileStrength + Strength;

            switch (Id)
            {
                case ID_TWO_HANDED_WEAPON:
                    return $"*{totalStrength}*";
                case ID_LANCE:
                    return $"{totalStrength}/{profileStrength}";
                default:
                    return totalStrength.ToString();
            }
        }
    }

}
