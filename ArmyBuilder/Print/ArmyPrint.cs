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

            string outputPath = "invoid.pdf";

            var model = InvoiceDocumentDataSource.GetInvoiceDetails();
            var document = new InvoiceDocument(model);
            document.GeneratePdfAndShow();
            document.GeneratePdf(outputPath);

            // Process.Start(new ProcessStartInfo(outputPath) { UseShellExecute = true });
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
