using System.Data;
using System.Data.SQLite;
using System.Windows;
using System.Windows.Controls;
using ArmyBuilder.Dao;
using ArmyBuilder.Domain;

namespace ArmyBuilder
{
    public partial class NewArmyView : UserControl
    {
        public NewArmyView()
        {
            InitializeComponent();

            string connectionString = "Data Source=db/ArmyBuilder.db";
            IDbConnection dbConnection = new SQLiteConnection(connectionString);
            IArmyBuilderRepository repository = new ArmyBuilderRepositorySqlite(dbConnection);

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
