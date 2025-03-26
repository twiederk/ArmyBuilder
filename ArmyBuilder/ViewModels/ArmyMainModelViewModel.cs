using System.Windows.Media;
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
        public Brush PointsColor => colorOfPoints();
        public MainModel MainModel { get; set; }

        private int _currentImageIndex = 0;

        public ArmyMainModelViewModel(MainModel mainModel)
        {
            MainModel = mainModel;
        }

        private Brush colorOfPoints()
        {
            if (MainModel.NewPoints != MainModel.OldPoints)
            {
                return Brushes.Red;
            }
            else
            {
                return Brushes.Green;
            }
        }

        public string ImagePath()
        {
            return MainModel.Figures[_currentImageIndex].ImagePath;
        }

        public void PreviousImage()
        {
            if (_currentImageIndex > 0)
            {
                _currentImageIndex--;
            }
        }

        public void NextImage()
        {
            if (_currentImageIndex < MainModel.Figures.Count - 1)
            {
                _currentImageIndex++;
            }
        }

    }
}
