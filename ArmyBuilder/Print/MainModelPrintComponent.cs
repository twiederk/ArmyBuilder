using ArmyBuilder.Domain;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;
using QuestPDF.Fluent;
//using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;

namespace ArmyBuilder.Print
{
    public class MainModelPrintComponent: IComponent
    {
        private MainModel _mainModel { get; }

        public MainModelPrintComponent(MainModel mainModel)
        {
            _mainModel = mainModel;
        }

        public void Compose(IContainer container)
        {

            container.PaddingLeft(20).Table(table =>
            {
                columnDefinitions(table);
                heading(table);
                singleModels(table);
            });
        }

        private static void columnDefinitions(TableDescriptor table)
        {
            table.ColumnsDefinition(columns =>
            {
                columns.ConstantColumn(150);
                columns.RelativeColumn(20);
                columns.RelativeColumn(20);
                columns.RelativeColumn(20);
                columns.RelativeColumn(20);
                columns.RelativeColumn(20);
                columns.RelativeColumn(20);
                columns.RelativeColumn(20);
                columns.RelativeColumn(20);
                columns.RelativeColumn(20);
            });
        }

        private static void heading(TableDescriptor table)
        {
            table.Header(header =>
            {
                header.Cell().Element(CellStyle).Text("Name");
                header.Cell().Element(CellStyle).Text("B");
                header.Cell().Element(CellStyle).Text("WS");
                header.Cell().Element(CellStyle).Text("BS");
                header.Cell().Element(CellStyle).Text("S");
                header.Cell().Element(CellStyle).Text("W");
                header.Cell().Element(CellStyle).Text("LP");
                header.Cell().Element(CellStyle).Text("I");
                header.Cell().Element(CellStyle).Text("A");
                header.Cell().Element(CellStyle).Text("MW");

                static IContainer CellStyle(IContainer container)
                {
                    return container.DefaultTextStyle(x => x.SemiBold()).PaddingVertical(5).BorderBottom(1).BorderColor(Colors.Black);
                }
            });
        }

        private void singleModels(TableDescriptor table)
        {
            foreach (SingleModel singleModel in _mainModel.SingleModels)
            {
                composeSingleModel(table, singleModel);
            }
        }

        private void composeSingleModel(TableDescriptor table, SingleModel singleModel)
        {
            table.Cell().Element(CellStyle).Text(singleModel.Name);
            table.Cell().Element(CellStyle).Text(singleModel.Profile.Movement.ToString());
            table.Cell().Element(CellStyle).Text(singleModel.Profile.WeaponSkill.ToString());
            table.Cell().Element(CellStyle).Text(singleModel.Profile.BallisticSkill.ToString());
            table.Cell().Element(CellStyle).Text(singleModel.Profile.Strength.ToString());
            table.Cell().Element(CellStyle).Text(singleModel.Profile.Toughness.ToString());
            table.Cell().Element(CellStyle).Text(singleModel.Profile.Wounds.ToString());
            table.Cell().Element(CellStyle).Text(singleModel.Profile.Initiative.ToString());
            table.Cell().Element(CellStyle).Text(singleModel.Profile.Attacks.ToString());
            table.Cell().Element(CellStyle).Text(singleModel.Profile.Moral.ToString());

            static IContainer CellStyle(IContainer container)
            {
                return container.BorderBottom(1).BorderColor(Colors.Grey.Lighten2).PaddingVertical(5);
            }
        }

        public string Heading()
        {
            return $"{_mainModel.Count}x {_mainModel.Name} ({_mainModel.Points}) => {_mainModel.TotalPoints()}";
        }
    }
}
