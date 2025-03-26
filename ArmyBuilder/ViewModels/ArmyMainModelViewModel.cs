using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{


    public class ArmyMainModelViewModel
    {
        public string Name => $"{MainModel.Name} ({MainModel.Points()})";

        public MainModel MainModel { get; set; }

        public ArmyMainModelViewModel(MainModel mainModel)
        {
            MainModel = mainModel;
        }
    }
}
