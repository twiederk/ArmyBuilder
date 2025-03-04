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
        public MovementType MovementType { get; set; }
        public bool Mount { get; set; }
        public bool Mountable { get; set; }
        public int Count { get; set; } = 1;
        public Equipment Equipment { get; set; } = new Equipment();

        public string Movement => DisplayValue(Profile.Movement);
        public string WeaponSkill => DisplayValue(Profile.WeaponSkill);
        public string BallisticSkill => DisplayValue(Profile.BallisticSkill);
        public string Strength => DisplayValue(Profile.Strength);
        public string Toughness => DisplayValue(Profile.Toughness);
        public string Wounds => DisplayValue(Profile.Wounds);
        public string Initiative => DisplayValue(Profile.Initiative);
        public string Attacks => DisplayValue(Profile.Attacks);
        public string Moral => DisplayValue(Profile.Moral);
        public string Save => DisplaySave();

        public string DisplayValue(int value) {
            return value > 0 ? value.ToString() : "-";
        }

        public string DisplaySave()
        {
            int save = Profile.Save;
            int armorSave = Equipment.Armor().Sum(a => a?.Save ?? 0);
            int shieldSave = Equipment.Shield().Sum(s => s?.Save ?? 0);
            int mountSave = MovementType == MovementType.OnMount ? 1 : 0;
            return displaySave(save - armorSave - shieldSave - mountSave);
        }

        private string displaySave(int save)
        {
            return save switch
            {
                > 6 => "-",
                6 => "6",
                _ => $"{save}+"
            };
        }

        public string DisplayName()
        {
            return $"{Name} ({Profile.Points})";
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

        public float TotalPointsMagicItems()
        {
            return Equipment.MagicItemsPoints();
        }

        public float ProfilePoints() {
            return Profile.Points;
        }

        public float BasePoints() {
            return (Profile.Points + Equipment.NonMagicItemsPoints()) * Count;
        }

        public float MagicPoints() {
            return Equipment.MagicItemsPoints();
        }

    }
}
