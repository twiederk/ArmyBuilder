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
            // Define the output file path
            string outputPath = "example.pdf";
            QuestPDF.Settings.License = LicenseType.Community;

            // Create a PDF document
            Document.Create(container =>
            {
                container.Page(page =>
                {
                    page.Size(PageSizes.A4);
                    page.Margin(2, QuestPDF.Infrastructure.Unit.Centimetre);
                    page.PageColor(Colors.White);
                    page.DefaultTextStyle(x => x.FontSize(20));

                    page.Header()
                        .Text("Hello, World!")
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
                                header.Cell().Element(CellStyle).Text("Header 1");
                                header.Cell().Element(CellStyle).Text("Header 2");
                                header.Cell().Element(CellStyle).Text("Header 3");

                                static IContainer CellStyle(IContainer container)
                                {
                                    return container.DefaultTextStyle(x => x.SemiBold()).Padding(5).Background(Colors.Grey.Lighten3);
                                }
                            });

                            // Add data rows
                            for (int i = 0; i < 9; i++)
                            {
                                table.Cell().Element(CellStyle).Text($"Cell {i + 1}");
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

            // Start a viewer
            Process.Start(new ProcessStartInfo(outputPath) { UseShellExecute = true });
        }
    }
}
