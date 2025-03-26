using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{


    public class ArmyMainModelViewModel
    {
        public string Name => $"{MainModel.Name} ({MainModel.Points()})";
        public float NewPoints => MainModel.NewPoints;
        public float OldPoints => MainModel.OldPoints;
        public string NumberOfFigures => MainModel.NumberOfFigures.ToString();
        public List<SingleModel> SingleModels => MainModel.SingleModels;
        public string Description => MainModel.Description;

        public MainModel MainModel { get; set; }

        public ArmyMainModelViewModel(MainModel mainModel)
        {
            MainModel = mainModel;
        }
    }
}
