using ArmyBuilder.Domain;

namespace ArmyBuilder.Print
{
    public class ArmyPrintModel
    {
        public string ArmyName => Army.Name;
        public float ArmyPoints => Army.TotalPoints();
        public List<Unit> Units => Army.Units;
        public Army Army { get; }

        public ArmyPrintModel(Army army)
        {
            Army = army;
        }

        public List<Item> AllMagicItems() {
            return Army.AllMagicItems();
        }
    }
}
