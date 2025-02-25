using System.Diagnostics;
using Dapper.Contrib.Extensions;

namespace ArmyBuilder.Domain
{
    public class SingleModel
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public Profile Profile { get; set; }
        public bool Musician { get; set; }
        public bool StandardBearer { get; set; }
        public MovementType MovementType { get; set; }
        public bool Mount { get; set; }
        public bool Mountable { get; set; }
        public Equipment Equipment { get; set; } = new Equipment();
        public String Save => CalculateSave();
        public MainModel MainModel { get; set; }

        public String CalculateSave()
        {
            int save = Profile.Save;
            int armorSave = Equipment.Armor().Sum(a => a?.Save ?? 0);
            int shieldSave = Equipment.Shield().Sum(s => s?.Save ?? 0);
            int mountSave = MovementType == MovementType.OnMount ? 1 : 0;
            return displaySave(save - armorSave - shieldSave - mountSave);
        }

        private String displaySave(int save)
        {
            return save switch
            {
                > 6 => "-",
                6 => "6",
                _ => $"{save}+"
            };
        }

        public override bool Equals(object obj)
        {
            if (obj is SingleModel other)
            {
                return Id == other.Id;
            }
            return false;
        }

        public override int GetHashCode()
        {
            return Id.GetHashCode();
        }

        public bool isCharacter()
        {
            return MainModel.ArmyCategory == ArmyCategory.Character;
        }

        public float TotalPoints()
        {
            if (isCharacter())
            {
                return Profile.Points + Equipment.ItemsPoints();
            }
            if (MovementType == MovementType.OnMount)
            {
                return (Profile.Points + Equipment.NonMagicItemsPoints()) * 2;
            }
            return Profile.Points + Equipment.NonMagicItemsPoints();
        }

        public float TotalPointsMagicItems()
        {
            return Equipment.MagicItemsPoints();
        }
    }
}
