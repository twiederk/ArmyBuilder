using ArmyBuilder.Domain;
using QuestPDF.Fluent;
using QuestPDF.Infrastructure;
using QuestPDF.Helpers;

namespace ArmyBuilder.Print
{
    public class MagicItemsPrintComponent : IComponent
    {
        private List<Item> _magicItems { get; }


        public MagicItemsPrintComponent(List<Item> magicItems)
        {
            _magicItems = magicItems;
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
                    .Text("Magische Gegenstände").FontSize(16);

                foreach (var magicItem in _magicItems) {
                    column.Item().Text($"{magicItem.Name} ({magicItem.Points}): {magicItem.Description}");
                }
            });

        }
    }
}