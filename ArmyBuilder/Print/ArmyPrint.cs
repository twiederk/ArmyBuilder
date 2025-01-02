using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;
using System;
using System.Diagnostics;
using ArmyBuilder.Domain;

namespace ArmyBuilder
{
    public class ArmyPrint
    {
        public void PrintArmy(Army army)
        {
            QuestPDF.Settings.License = LicenseType.Community;

            string outputPath = "army.pdf";

            Document.Create(container =>
            {
                container.Page(page =>
                {
                    page.Size(PageSizes.A4);
                    page.Margin(2, QuestPDF.Infrastructure.Unit.Centimetre);
                    page.PageColor(Colors.White);
                    page.DefaultTextStyle(x => x.FontSize(20));

                    page.Header()
                        .Text(army.Name)
                        .SemiBold().FontSize(36).FontColor(Colors.Blue.Medium);

                    page.Content()
                        .Table(table =>
                        {
                            // Define columns
                            table.ColumnsDefinition(columns =>
                            {
                                columns.RelativeColumn();
                                columns.RelativeColumn();
                                columns.RelativeColumn();
                            });

                            // Add header row
                            table.Header(header =>
                            {
                                header.Cell().Element(CellStyle).Text("Unit Name");
                                header.Cell().Element(CellStyle).Text("Points");
                                header.Cell().Element(CellStyle).Text("Count");

                                static IContainer CellStyle(IContainer container)
                                {
                                    return container.DefaultTextStyle(x => x.SemiBold()).Padding(5).Background(Colors.Grey.Lighten3);
                                }
                            });

                            // Add data rows
                            foreach (var unit in army.Units)
                            {
                                PrintUnit(table, unit);
                            }

                            static IContainer CellStyle(IContainer container)
                            {
                                return container.Border(1).BorderColor(Colors.Grey.Lighten2).Padding(5);
                            }
                        });

                    page.Footer()
                        .AlignCenter()
                        .Text(x =>
                        {
                            x.Span("Page ");
                            x.CurrentPageNumber();
                        });
                });
            })
            .GeneratePdf(outputPath);

            Process.Start(new ProcessStartInfo(outputPath) { UseShellExecute = true });
        }

        private void PrintUnit(TableDescriptor table, ArmyBuilder.Domain.Unit unit)
        {
            table.Cell().Element(CellStyle).Text(unit.Name);
            table.Cell().Element(CellStyle).Text(unit.TotalPoints().ToString());
            table.Cell().Element(CellStyle).Text(unit.MainModels.Count.ToString());

            static IContainer CellStyle(IContainer container)
            {
                return container.Border(1).BorderColor(Colors.Grey.Lighten2).Padding(5);
            }
        }
    }
}
