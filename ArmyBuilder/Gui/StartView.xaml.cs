using ArmyBuilder.ViewModels;
using ArmyBuilder.Dao;
using ArmyBuilder.Domain;
using Microsoft.Extensions.DependencyInjection;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace ArmyBuilder
{
    public partial class StartView : UserControl
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly ArmyViewModel _armyViewModel;
        private readonly IArmyBuilderRepository _repository;

        public StartView(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
            _armyViewModel = serviceProvider.GetRequiredService<ArmyViewModel>();
            _repository = serviceProvider.GetRequiredService<IArmyBuilderRepository>();
            InitializeComponent();
            DataContext = _serviceProvider.GetRequiredService<StartViewModel>();
        }

        private void NewMenuItem_Click(object sender, RoutedEventArgs e)
        {
            Window window = Window.GetWindow(this);
            window.Content = _serviceProvider.GetRequiredService<NewArmyView>();
        }

        private void QuitMenuItem_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void lstArmies_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (lstArmies.SelectedItem is Army selectedArmy)
            {
                _armyViewModel.SelectedArmyList = selectedArmy.ArmyList;
                Army army = new ArmyListLoader(_repository).LoadArmy(selectedArmy.Id);
                _armyViewModel.ArmyTreeViewModel = new ArmyTreeViewModel(army);

                Window window = Window.GetWindow(this);
                window.Content = _serviceProvider.GetRequiredService<ArmyView>();
            }

        }

        private void DeleteArmyButton_Click(object sender, RoutedEventArgs e)
        {
            if (sender is Button button && button.DataContext is Army army)
            {
                var result = MessageBox.Show($"Sind Sie sicher, dass Sie die Armee '{army.Name}' löschen möchten?", "Löschung bestätigen", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                if (result == MessageBoxResult.Yes)
                {
                    _repository.DeleteArmy(army.Id);
                    var startViewModel = DataContext as StartViewModel;
                    startViewModel.LoadArmies();
                }
            }
        }

        private void NewButton_Click(object sender, RoutedEventArgs e)
        {
            Window window = Window.GetWindow(this);
            window.Content = _serviceProvider.GetRequiredService<NewArmyView>();
        }

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            if (lstArmies.SelectedItem is Army selectedArmy) {
                var editForm = new EditArmyWindow(selectedArmy);
                if (editForm.ShowDialog() == true)
                {
                    _repository.UpdateArmy(selectedArmy);
                    var startViewModel = DataContext as StartViewModel;
                    startViewModel.LoadArmies();
                }
            }
            else
            {
                MessageBox.Show("Bitte eine Armee zum Editieren auswählen.");
            }


        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("DeleteButton_Click");
        }        

    }

}
