namespace ArmyBuilder.Domain
{
    public class ArmyCategoryPoints
    {
        public float Character { get; set; }
        public float Trooper { get; set; }
        public float WarMachine { get; set; }
        public float Monster { get; set; }
        public float Total => Character + Trooper + WarMachine + Monster;
    }
}
