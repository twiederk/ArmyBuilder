using QuestPDF.Infrastructure;
using ArmyBuilder.Domain;
using QuestPDF.Fluent;

namespace ArmyBuilder.Print
{

    public class UnitPrintComponent : IComponent
    {

        private ArmyBuilder.Domain.Unit _unit { get; }

        public UnitPrintComponent(ArmyBuilder.Domain.Unit unit)
        {
            _unit = unit;
        }

        public void Compose(IContainer container)
        {
            container.Text($"Einheit: {_unit.Name}");
        }
    }
}
