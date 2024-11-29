using Dapper.Contrib.Extensions;

namespace ArmyBuilder.Domain {

    [Table("ArmyList")]
    public class ArmyList
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

}
