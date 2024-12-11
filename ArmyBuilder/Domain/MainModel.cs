namespace ArmyBuilder.Domain
{
    public class MainModel
    {
        public int Id { get; set; }
        public ArmyCategory ArmyCategory { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public float Points { get; set; }
        public List<SingleModel> SingleModels { get; set; } = new List<SingleModel>();
    }
}
