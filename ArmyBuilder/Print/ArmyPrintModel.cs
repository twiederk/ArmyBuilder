using ArmyBuilder.Domain;

namespace ArmyBuilder.Print
{
    public class ArmyPrintModel
    {
        public string ArmyName => _army.Name;
        public List<Unit> Units => _army.Units;
        private Army _army { get; }

        public ArmyPrintModel(Army army)
        {
            _army = army;
        }
    }
}
