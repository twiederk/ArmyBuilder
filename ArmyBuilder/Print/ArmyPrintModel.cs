using ArmyBuilder.Domain;

namespace ArmyBuilder.Print
{
    public class ArmyPrintModel
    {
        public string ArmyName => _army.Name;
        public List<string> UnitNames => _army.Units.Select(unit => unit.Name).ToList();
        private Army _army { get; }

        public ArmyPrintModel(Army army)
        {
            _army = army;
        }
    }
}
