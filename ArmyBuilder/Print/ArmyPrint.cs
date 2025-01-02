using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;
using System;
using System.Diagnostics;
using ArmyBuilder.Domain;
using ArmyBuilder.Print;

namespace ArmyBuilder
{
    public class ArmyPrint
    {
        public void PrintArmy(Army army)
        {
            QuestPDF.Settings.License = LicenseType.Community;

            //var model = InvoiceDocumentDataSource.GetInvoiceDetails();
            //var document = new InvoiceDocument(model);
            var model = new ArmyPrintModel(army);
            var document = new ArmyDocument(model);
            document.GeneratePdfAndShow();

            //document.GeneratePdf("invoice.pdf");
            // Process.Start(new ProcessStartInfo(outputPath) { UseShellExecute = true });
        }

    }
}
