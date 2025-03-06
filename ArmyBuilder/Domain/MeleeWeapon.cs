using System.Data.SQLite;
using System.Reflection;
using Dapper.Contrib.Extensions;

namespace ArmyBuilder.Domain
{
    [Table("melee_weapon")]
    public class MeleeWeapon: Item
    {
        public int Strength { get; set; }

        const int ID_TWO_HANDED_WEAPON = 2;
        const int ID_FLAIL = 3;
        const int ID_HELBERD = 4;
        const int ID_SPEAR = 5;
        const int ID_LANCE = 6;
        const int ID_EXECUTIONEER_AXE = 7;
        const int ID_TWO_HANDED_SWORD_OF_HOETH = 9;

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
