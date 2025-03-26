using System.Windows;
using System.Windows.Controls;
using ArmyBuilder.ViewModels;

namespace ArmyBuilder
{
    public partial class MainModelControl : UserControl
    {
        public MainModelControl()
        {
            InitializeComponent();
        }
        
        private void PreviousImage_Click(object sender, RoutedEventArgs e)
        {
            ArmyViewModel armyViewModel = DataContext as ArmyViewModel;
            if (armyViewModel == null)
            {
                return;
            }
            armyViewModel.PrevImage();
        }

        private void NextImage_Click(object sender, RoutedEventArgs e)
        {
            ArmyViewModel armyViewModel = DataContext as ArmyViewModel;
            if (armyViewModel == null)
            {
                return;
            }
            armyViewModel.NextImage();
        }

    }
}
