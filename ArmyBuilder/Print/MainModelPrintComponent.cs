using ArmyBuilder.Domain;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;
using QuestPDF.Fluent;

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
            container.PaddingLeft(20).PaddingBottom(10).Column(column =>
            {
                column.Item().Text(Heading());
                column.Item().PaddingLeft(20).PaddingBottom(2).Table(table =>
                {
                    columnDefinitions(table);
                    heading(table);
                    singleModels(table);
                });
                composeEquipment(column);
                composeStandardBearerAndMusician(column);
                composeDescription(column);
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
                header.Cell().Element(CellStyle).Text("RW");

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
            table.Cell().Element(CellStyle).Text(singleModel.DisplayName());
            table.Cell().Element(CellStyle).Text(singleModel.Movement);
            table.Cell().Element(CellStyle).Text(singleModel.WeaponSkill);
            table.Cell().Element(CellStyle).Text(singleModel.BallisticSkill);
            table.Cell().Element(CellStyle).Text(singleModel.Strength);
            table.Cell().Element(CellStyle).Text(singleModel.Toughness);
            table.Cell().Element(CellStyle).Text(singleModel.Wounds);
            table.Cell().Element(CellStyle).Text(singleModel.Initiative);
            table.Cell().Element(CellStyle).Text(singleModel.Attacks);
            table.Cell().Element(CellStyle).Text(singleModel.Moral);
            table.Cell().Element(CellStyle).Text(singleModel.Save);

            static IContainer CellStyle(IContainer container)
            {
                return container.BorderBottom(1).BorderColor(Colors.Grey.Lighten2).PaddingVertical(5);
            }
        }

        public string Heading()
        {
            if (_mainModel.ArmyCategory == ArmyCategory.Character) {
                return $"{_mainModel.Name} ({_mainModel.Points()}) => {_mainModel.TotalPoints()} {_mainModel.ArmyCategory.Display()}";
            }
            return $"{_mainModel.Count}x {_mainModel.Name} ({_mainModel.Points()}) => {_mainModel.TotalPoints()} {_mainModel.ArmyCategory.Display()}";
        }


        public void composeEquipment(ColumnDescriptor column)
        {
            foreach (var singleModel in _mainModel.SingleModels)
            {
                var itemNames = singleModel.Equipment.ItemNames();
                if (itemNames.Any())
                {
                    column.Item().PaddingLeft(20).PaddingBottom(2).Text(string.Join(", ", itemNames));
                }
            }
        }
        
        public void composeStandardBearerAndMusician(ColumnDescriptor column)
        {
            string output = "";
            if (_mainModel.StandardBearer)
            {
                output += $"Standartenträger ({_mainModel.ModelPoints() * 2}) ";
            }
            if (_mainModel.StandardBearer)
            {
                output += $"Musiker ({_mainModel.ModelPoints() * 2})";
            }
            if (!string.IsNullOrEmpty(output))
            {
                column.Item().PaddingLeft(20).PaddingBottom(2).Text(output);
            }
        }

        public void composeDescription(ColumnDescriptor column)
        {
            if (!string.IsNullOrEmpty(_mainModel.Description))
            {
                column.Item().PaddingLeft(20).PaddingBottom(2).Text(_mainModel.Description);
            }
        }
    }
}
