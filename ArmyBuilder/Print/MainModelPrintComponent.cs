using ArmyBuilder.Domain;
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
            container.Column(column =>
            {
                column.Spacing(2);
                column.Item().Text(Heading());
                foreach (var singleModel in _mainModel.SingleModels)
                {
                    column.Item().Text(singleModel.Name);
                }
            });
        }

        public string Heading()
        {
            return $"{_mainModel.Count}x {_mainModel.Name} ({_mainModel.Points}) => {_mainModel.TotalPoints()}";
        }
    }
}
