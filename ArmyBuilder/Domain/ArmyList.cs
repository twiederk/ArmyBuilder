using Dapper.Contrib.Extensions;

namespace ArmyBuilder.Domain {

    [Table("Army")]
    public class ArmyList
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

}
