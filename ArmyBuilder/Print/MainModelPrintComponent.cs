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

                foreach (SingleModel singleModel in _mainModel.SingleModels)
                {
                    table.Cell().Element(CellStyle).Text(singleModel.Name);
                    table.Cell().Element(CellStyle).Text(singleModel.Profile.Movement);
                    table.Cell().Element(CellStyle).Text(singleModel.Profile.WeaponSkill);
                    table.Cell().Element(CellStyle).Text(singleModel.Profile.BallisticSkill);
                    table.Cell().Element(CellStyle).Text(singleModel.Profile.Strength);
                    table.Cell().Element(CellStyle).Text(singleModel.Profile.Toughness);
                    table.Cell().Element(CellStyle).Text(singleModel.Profile.Wounds);
                    table.Cell().Element(CellStyle).Text(singleModel.Profile.Initiative);
                    table.Cell().Element(CellStyle).Text(singleModel.Profile.Attacks);
                    table.Cell().Element(CellStyle).Text(singleModel.Profile.Moral);

                    static IContainer CellStyle(IContainer container)
                    {
                        return container.BorderBottom(1).BorderColor(Colors.Grey.Lighten2).PaddingVertical(5);
                    }
                }

                //    container.PaddingLeft(10).Column(column =>
                //{
                //    column.Spacing(2);
                //    column.Item().Text(Heading());
                //    foreach (var singleModel in _mainModel.SingleModels)
                //    {
                //        column.Item().Component(new SingleModelPrintComponent(singleModel));
                //    }
            });
        }

        public string Heading()
        {
            return $"{_mainModel.Count}x {_mainModel.Name} ({_mainModel.Points}) => {_mainModel.TotalPoints()}";
        }
    }
}
