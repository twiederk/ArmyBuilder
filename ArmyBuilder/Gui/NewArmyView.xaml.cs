using Microsoft.Extensions.DependencyInjection;
using ArmyBuilder.Domain;
using ArmyBuilder.ViewModels;
using System.Data;
using System.Windows;
using System.Windows.Controls;
using ArmyBuilder.Dao;

namespace ArmyBuilder
{
    public partial class NewArmyView : UserControl
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly ArmyViewModel _armyViewModel;

        public NewArmyView(IServiceProvider serviceProvider)
        {
            InitializeComponent();

            _serviceProvider = serviceProvider;
            _armyViewModel = serviceProvider.GetRequiredService<ArmyViewModel>();

            IArmyBuilderRepository repository = serviceProvider.GetRequiredService<IArmyBuilderRepository>();

            List<ArmyList> armyLists = repository.ArmyLists();
            var sortedArmyLists = armyLists.OrderBy(al => al.Name).ToList();

            lstArmyLists.ItemsSource = sortedArmyLists;
            lstArmyLists.DisplayMemberPath = "Name";
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            var startView = _serviceProvider.GetRequiredService<StartView>();
            Window window = Window.GetWindow(this);
            window.Content = startView;
        }
        private void lstArmies_MouseDoubleClick(object sender, RoutedEventArgs e)
        {
            if (lstArmyLists.SelectedItem == null)
            {
                MessageBox.Show("Bitte eine Armeeliste auswählen!", "Auswahl erforderlich");
                return;
            }

            if (lstArmyLists.SelectedItem is ArmyList selectedArmyList)
            {
                _armyViewModel.SelectedArmyList = selectedArmyList;
                Army army = _armyViewModel.CreateArmy(selectedArmyList.Name, selectedArmyList);
                _armyViewModel.ArmyTreeViewModel = new ArmyTreeViewModel(army);

                Window window = Window.GetWindow(this);
                window.Content = _serviceProvider.GetRequiredService<ArmyView>();
            }
        }
    }
}
