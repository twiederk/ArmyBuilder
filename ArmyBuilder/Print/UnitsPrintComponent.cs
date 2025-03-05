using QuestPDF.Infrastructure;
using QuestPDF.Fluent;

namespace ArmyBuilder.Print
{

    public class UnitsPrintComponent : IComponent
    {

        private List<ArmyBuilder.Domain.Unit> _units { get; }

        public UnitsPrintComponent(List<ArmyBuilder.Domain.Unit> units)
        {
            _units = units;
        }

        public void Compose(IContainer container)
        {
            container.Column(column =>
            {
                foreach (var unit in _units)
                {
                    composeUnit(column, unit);
                }
            });
        }

        private void composeUnit(ColumnDescriptor column, ArmyBuilder.Domain.Unit unit)
        {
            column.Spacing(2);
            column.Item().BorderBottom(1).PaddingBottom(5).Text(unit.Name).SemiBold();
            foreach (var mainModel in unit.MainModels)
            {
                column.Item().Component(new MainModelPrintComponent(mainModel));
            }
        }
    }
}
