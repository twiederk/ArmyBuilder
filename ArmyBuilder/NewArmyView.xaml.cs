using ArmyBuilder.Dao;
using ArmyBuilder.Domain;
using System.Data;
using System.Windows;
using System.Windows.Controls;

namespace ArmyBuilder
{
    public partial class NewArmyView : UserControl
    {
        public NewArmyView(IArmyBuilderRepository repository)
        {
            InitializeComponent();


            List<ArmyList> armyLists = repository.ArmyLists();

            var sortedArmyLists = armyLists.OrderBy(al => al.Name).ToList();
            ArmyListBox.ItemsSource = sortedArmyLists;
            ArmyListBox.DisplayMemberPath = "Name";
        }

        private void Ok_Click(object sender, RoutedEventArgs e)
        {
            Window window = Window.GetWindow(this);
            window.Content = new ArmyView();
        }

    }


}
