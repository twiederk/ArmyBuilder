using ArmyBuilder.Dao;
using ArmyBuilder.ViewModels;
using Microsoft.Extensions.DependencyInjection;
using System.Data;
using System.Data.SQLite;
using System.Windows;
using DbUp;


namespace ArmyBuilder
{
    public partial class App : Application
    {

        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            var collection = new ServiceCollection();

            string connectionString = "Data Source=db/armybuilder.db";

            var upgrader = DeployChanges.To
                .SqliteDatabase(connectionString)
                .WithScriptsFromFileSystem("db")
                .LogToConsole()
                .Build();

            // upgrader.PerformUpgrade();


            IDbConnection dbConnection = new SQLiteConnection(connectionString);
            collection.AddSingleton(dbConnection);
            collection.AddSingleton<IArmyBuilderRepository,ArmyBuilderRepositorySqlite>();
            collection.AddSingleton<ArmyViewModel>();
            collection.AddSingleton<StartViewModel>();
            collection.AddSingleton<MainWindow>();

            collection.AddTransient<StartView>();
            collection.AddTransient<NewArmyView>();
            collection.AddTransient<ArmyView>();

            var serviceProvider = collection.BuildServiceProvider();
            var mainWindow = serviceProvider.GetRequiredService<MainWindow>();
            mainWindow.Show();
        }
    }

}
