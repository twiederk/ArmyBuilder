using QuestPDF.Elements;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;

namespace ArmyBuilder.Print
{
    public class ArmyDocument : IDocument
    {
        public ArmyPrintModel Model { get; }

        public ArmyDocument(ArmyPrintModel model)
        {
            Model = model;
        }

        public DocumentMetadata GetMetadata() => DocumentMetadata.Default;
        public DocumentSettings GetSettings() => DocumentSettings.Default;

        public void Compose(IDocumentContainer container)
        {
            container
                .Page(page =>
                {
                    page.Margin(50);

                    page.Header().Element(ComposeHeader);
                    page.Content().Element(ComposeContent);

                    page.Footer().AlignCenter().Text(x =>
                    {
                        x.CurrentPageNumber();
                        x.Span(" / ");
                        x.TotalPages();
                    });
                });
        }

        void ComposeHeader(IContainer container)
        {
            container
                .Background(Colors.Grey.Lighten5)
                .AlignCenter()
                .AlignMiddle()
                .Text(Model.ArmyName).FontSize(16);

        }

        void ComposeContent(IContainer container)
        {
            container.Column(column =>
            {
                column.Spacing(10);
                foreach (var unit in Model.Units)
                {
                    column.Item().Component(new UnitPrintComponent(unit));
                }
                column.Item().Component(new ArmyCategoryPointsPrintComponent(Model.Army.ArmyCategoryPoints()));

            });
        }
    }
}