using Dapper.Contrib.Extensions;


namespace ArmyBuilder.Domain
{
    [Table("armor")]
    public class Armor: Item
    {
        public int Save;
    }
}
