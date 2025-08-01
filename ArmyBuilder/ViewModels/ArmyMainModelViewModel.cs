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
        public int CurrentFigure => currentFigure();
        public int MaxFigures => MainModel.Figures.Count;
        public string Equipment => equipment();


        private int _currentFigureIndex = 0;

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
            return MainModel.Figures[_currentFigureIndex].ImagePath;
        }

        public void PreviousImage()
        {
            if (_currentFigureIndex > 0)
            {
                _currentFigureIndex--;
            }
            else
            {
                _currentFigureIndex = MainModel.Figures.Count - 1;
            }
            OnPropertyChanged("NumberOfFigures");
            OnPropertyChanged("CurrentFigure");
        }

        public void NextImage()
        {
            if (_currentFigureIndex < MainModel.Figures.Count - 1)
            {
                _currentFigureIndex++;
            }
            else
            {
                _currentFigureIndex = 0;
            }
            OnPropertyChanged("NumberOfFigures");
            OnPropertyChanged("CurrentFigure");
        }

        private int numberOfFigures()
        {
            if (MainModel.Figures.Count() == 0)
            {
                return 0;
            }
            return MainModel.Figures[_currentFigureIndex].NumberOfFigures;
        }

        private int currentFigure()
        {
            if (MainModel.Figures.Count() == 0)
            {
                return 0;
            }
            return _currentFigureIndex + 1;
        }

        private string equipment() 
        {
            return string.Join(", ", MainModel.SingleModels
                .Select(sm => string.Join(", ", sm.Equipment.ItemNames())));
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

    }
}
