using System.Windows;
using System.Windows.Controls;
using Microsoft.Extensions.DependencyInjection;
using ArmyBuilder.ViewModels;
using ArmyBuilder.Domain;
using ArmyBuilder.Dao;

namespace ArmyBuilder
{
    public partial class ArmyView : UserControl
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly IArmyBuilderRepository _repository;

        public ArmyView(IServiceProvider serviceProvider, ArmyViewModel armyViewModel)
        {
            _serviceProvider = serviceProvider;
            _repository = serviceProvider.GetRequiredService<IArmyBuilderRepository>();
            InitializeComponent();
            DataContext = armyViewModel;
        }

        private void PrintButton_Click(object sender, RoutedEventArgs e)
        {
            var armyViewModel = DataContext as ArmyViewModel;
            var army = armyViewModel.ArmyTreeViewModel.Army;
            var armyPrint = new ArmyPrinter();
            armyPrint.PrintArmy(army);
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            var armyViewModel = DataContext as ArmyViewModel;
            Army army = armyViewModel.ArmyTreeViewModel.Army;
            army.Points = army.TotalPoints();
            _repository.UpdateArmy(army);

            var startView = _serviceProvider.GetRequiredService<StartView>();
            var startViewModel = startView.DataContext as StartViewModel;
            startViewModel.LoadArmies();

            Window window = Window.GetWindow(this);
            window.Content = _serviceProvider.GetRequiredService<StartView>();
        }

    }
}