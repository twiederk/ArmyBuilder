using Dapper.Contrib.Extensions;

namespace ArmyBuilder.Domain
{
    public class MountModel
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string DisplayName => $"{Name} ({Profile.Points})";
        public Profile Profile { get; set; }
        public int MountSave { get; set; }

        public string Movement => DisplayValue(Profile.Movement);
        public string WeaponSkill => DisplayValue(Profile.WeaponSkill);
        public string BallisticSkill => DisplayValue(Profile.BallisticSkill);
        public string Strength => DisplayValue(Profile.Strength);
        public string Toughness => DisplayValue(Profile.Toughness);
        public string Wounds => DisplayValue(Profile.Wounds);
        public string Initiative => DisplayValue(Profile.Initiative);
        public string Attacks => DisplayValue(Profile.Attacks);
        public string Moral => DisplayValue(Profile.Moral);
        public string Save => DisplaySave(Profile.Save);

        public string DisplayValue(int value)
        {
            return value > 0 ? value.ToString() : "-";
        }

        public string DisplaySave(int save)
        {
            return save switch
            {
                > 6 => "-",
                6 => "6",
                _ => $"{save}+"
            };
        }

        public SingleModel ToSingleModel()
        {
            return new SingleModel
            {
                Name = Name,
                Profile = Profile.Clone(),
                MountSave = 0
            };
        }
    }
}