using System.ComponentModel;
using System.Windows.Media;
using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{


    public class ArmyMainModelViewModel : INotifyPropertyChanged
    {
        public string Name => $"{MainModel.Name} ({MainModel.Points()})";
        public float NewPoints => MainModel.NewPoints;
        public float OldPoints => MainModel.OldPoints;
        public int NumberOfFigures => numberOfFigures();
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
                OnPropertyChanged("NumberOfFigures");
            }
        }

        public void NextImage()
        {
            if (_currentImageIndex < MainModel.Figures.Count - 1)
            {
                _currentImageIndex++;
                OnPropertyChanged("NumberOfFigures");
            }
        }

        private int numberOfFigures()
        {
            return MainModel.Figures[_currentImageIndex].NumberOfFigures;
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

    }
}
