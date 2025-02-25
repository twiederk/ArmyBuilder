using Dapper.Contrib.Extensions;

namespace ArmyBuilder.Domain
{
    [Table("army_list")]
    public class ArmyListDigest
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public override bool Equals(object obj)
        {
            if (obj is ArmyListDigest other)
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
