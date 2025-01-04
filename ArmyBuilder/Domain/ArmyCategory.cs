namespace ArmyBuilder.Domain
{
    public enum ArmyCategory
    {
        Character,
        Trooper,
        WarMachine,
        Monster,
    }

    public static class ArmyCategoryExtensions
    {
        public static string Display(this ArmyCategory category)
        {
            return category switch
            {
                ArmyCategory.Character => "Charakter",
                ArmyCategory.Trooper => "Regiment",
                ArmyCategory.WarMachine => "Kriegsgerät",
                ArmyCategory.Monster => "Monster",
                _ => "Unbekannt",
            };
        }
    }
}
