using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;
using System;
using System.Diagnostics;
using ArmyBuilder.Domain;
using ArmyBuilder.Print;

namespace ArmyBuilder
{
    public class ArmyPrinter
    {
        public void PrintArmy(Army army)
        {
            QuestPDF.Settings.License = LicenseType.Community;

            var model = new ArmyPrintModel(army);
            var document = new ArmyDocument(model);
            //document.GeneratePdfAndShow();

            String filename = "temp_army.pdf";
            document.GeneratePdf(filename);
            Process.Start(new ProcessStartInfo(filename) { UseShellExecute = true });
        }

    }
}
