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

            ArmyListBox.ItemsSource = sortedArmyLists;
            ArmyListBox.DisplayMemberPath = "Name";
        }

        private void Ok_Click(object sender, RoutedEventArgs e)
        {
            if (ArmyListBox.SelectedItem is ArmyList selectedArmyList)
            {
                _armyViewModel.SelectedArmyList = selectedArmyList;
            }

            Window window = Window.GetWindow(this);
            window.Content = _serviceProvider.GetRequiredService<ArmyView>();
        }
    }
}
