using ArmyBuilder.Domain;
using QuestPDF.Fluent;
using QuestPDF.Infrastructure;
using QuestPDF.Helpers;

namespace ArmyBuilder.Print
{
    public class ArmyCategoryPointsPrintComponent : IComponent
    {
        private ArmyCategoryPoints _armyCategoryPoints { get; }


        public ArmyCategoryPointsPrintComponent(ArmyCategoryPoints armyCategoryPoints)
        {
            _armyCategoryPoints = armyCategoryPoints;
        }

        public void Compose(IContainer container)
        {
            container.Column(column =>
            {
                column.Spacing(10);
                column.Item()
                    .Background(Colors.Grey.Lighten5)
                    .AlignCenter()
                    .AlignMiddle()
                    .Text("Gesamtkosten").FontSize(16);
                column.Item().Text("Charakter: " + _armyCategoryPoints.Character);
                column.Item().Text("Regiment: " + _armyCategoryPoints.Trooper);
                column.Item().Text("Kriegsgerät: " + _armyCategoryPoints.WarMachine);
                column.Item().Text("Monster: " + _armyCategoryPoints.Monster);
                column.Item().BorderTop(1).PaddingTop(5).Text($"Gesamtkosten der Armee: {_armyCategoryPoints.Total}").SemiBold();
            });

        }
    }
}