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
        public Equipment Equipment { get; set; }
    }
}
