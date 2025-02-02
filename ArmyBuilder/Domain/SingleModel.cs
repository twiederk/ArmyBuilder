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
        public Equipment Equipment { get; set; } = new Equipment();
        public String Save => CalculateSave();

        public String CalculateSave()
        {
            int save = Profile.Save;
            int armorSave = Equipment.Armor().Sum(a => a?.Save ?? 0);
            int shieldSave = Equipment.Shield().Sum(s => s?.Save ?? 0);
            return displaySave(save - armorSave - shieldSave);
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
    }
}
