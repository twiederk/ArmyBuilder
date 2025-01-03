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
            container.Column(column =>
            {
                column.Spacing(2);
                column.Item().BorderBottom(1).PaddingBottom(5).Text(_unit.Name).SemiBold();
                foreach (var mainModel in _unit.MainModels)
                {
                    column.Item().Text(mainModel.Name);
                }
            });
        }
    }
}
