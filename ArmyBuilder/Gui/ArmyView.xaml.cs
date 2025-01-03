using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
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

        private void Print_Click(object sender, RoutedEventArgs e)
        {
            var armyViewModel = DataContext as ArmyViewModel;
            var army = armyViewModel.ArmyTreeViewModel.Army;
            var armyPrint = new ArmyPrinter();
            armyPrint.PrintArmy(army);
        }
        private void QuitEdition_Click(object sender, RoutedEventArgs e)
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

        private void ListBox_MouseMove(object sender, MouseEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
            {
                ListBox listBox = sender as ListBox;
                if (listBox != null)
                {
                    var selectedItem = listBox.SelectedItem;

                    if (selectedItem != null)
                    {
                        DataObject dataObject = new DataObject(selectedItem);
                        DragDrop.DoDragDrop(listBox, dataObject, DragDropEffects.Move);
                    }
                }
            }
        }

        private void ListBox_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            ListBox listBox = sender as ListBox;
            if (listBox != null)
            {
                var selectedMainModel = listBox.SelectedItem as MainModel;
                if (selectedMainModel != null)
                {
                    MainModel clonedMainModel = selectedMainModel.Clone();
                    ArmyViewModel armyViewModel = DataContext as ArmyViewModel;
                    ArmyTreeViewModel armyTreeViewModel = armyViewModel.ArmyTreeViewModel;
                    Army army = armyTreeViewModel.Army;
                    Unit unit = armyViewModel.CreateUnit(army, clonedMainModel);
                    ArmyTreeNode armyTreeNode = armyTreeViewModel.Root[0];
                    armyTreeNode.AddUnit(unit);
                }
            }
        }


        private void armyTreeNode_Drop(object sender, DragEventArgs dragEvent)
        {
            if (dragEvent.Data.GetDataPresent(typeof(MainModel)))
            {
                MainModel droppedMainModel = dragEvent.Data.GetData(typeof(MainModel)) as MainModel;

                if (droppedMainModel != null)
                {
                    var armyTreeNode = ((FrameworkElement)sender).DataContext as ArmyTreeNode;
                    if (armyTreeNode != null)
                    {
                        MainModel clonedMainModel = droppedMainModel.Clone();
                        Army army = armyTreeNode.Army;
                        var armyViewModel = DataContext as ArmyViewModel;
                        Unit unit = armyViewModel.CreateUnit(army, clonedMainModel);
                        armyTreeNode.AddUnit(unit);
                    }
                }
            }
        }

        private void unitTreeNode_Drop(object sender, DragEventArgs dragEvent)
        {
            if (dragEvent.Data.GetDataPresent(typeof(MainModel)))
            {
                MainModel droppedMainModel = dragEvent.Data.GetData(typeof(MainModel)) as MainModel;

                if (droppedMainModel != null)
                {
                    var unitTreeNode = ((FrameworkElement)sender).DataContext as UnitTreeNode;
                    if (unitTreeNode != null)
                    {
                        MainModel clonedMainModel = droppedMainModel.Clone();
                        Unit unit = unitTreeNode.Unit;
                        var armyViewModel = DataContext as ArmyViewModel;
                        armyViewModel.AddMainModel(unit.Id, clonedMainModel);
                        unitTreeNode.AddMainModel(clonedMainModel);
                    }
                }
            }
        }

        private void DeleteUnitButton_Click(object sender, RoutedEventArgs e)
        {
            if (sender is Button button && button.Tag is UnitTreeNode unitTreeNode)
            {
                var result = MessageBox.Show($"Die Einheit '{unitTreeNode.Name}' löschen?", "Löschung bestätigen", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                if (result == MessageBoxResult.Yes)
                {
                    var armyViewModel = DataContext as ArmyViewModel;
                    var unit = unitTreeNode.Unit;
                    armyViewModel.DeleteUnit(unit.Id);
                    unitTreeNode.RemoveUnit();
                    unitTreeNode.UpdateTotalPoints();
                }
            }
        }


        private void DeleteMainModelButton_Click(object sender, RoutedEventArgs e)
        {
            if (sender is Button button && button.Tag is MainModelTreeNode mainModelTreeNode)
            {
                var result = MessageBox.Show($"Das Model '{mainModelTreeNode.Name}' löschen?", "Löschung bestätigen", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                if (result == MessageBoxResult.Yes)
                {
                    var armyViewModel = DataContext as ArmyViewModel;
                    var mainModel = mainModelTreeNode.MainModel;
                    int unitId = mainModelTreeNode.Unit.Id;
                    armyViewModel.DeleteMainModelFromUnit(unitId, mainModel.Id);
                    mainModelTreeNode.RemoveMainModel();
                    mainModelTreeNode.UpdateTotalPoints();
                }
            }
        }

        private void mainModelTreeNode_IncreaseCount(object sender, RoutedEventArgs e)
        {
            if (sender is Button button && button.Tag is MainModelTreeNode mainModelTreeNode)
            {
                var mainModel = mainModelTreeNode.MainModel;
                mainModel.IncreaseCount();
                UpdateMainModelCount(mainModelTreeNode, mainModel);
            }
        }

        private void mainModelTreeNode_DecreaseCount(object sender, RoutedEventArgs e)
        {
            if (sender is Button button && button.Tag is MainModelTreeNode mainModelTreeNode)
            {
                var mainModel = mainModelTreeNode.MainModel;
                mainModel.DecreaseCount();
                UpdateMainModelCount(mainModelTreeNode, mainModel);
            }
        }

        private void UpdateMainModelCount(MainModelTreeNode mainModelTreeNode, MainModel mainModel)
        {
            var armyViewModel = DataContext as ArmyViewModel;
            armyViewModel.UpdateMainModelCount(mainModelTreeNode.Unit.Id, mainModel.Id, mainModel.Count);
            mainModelTreeNode.UpdateCount();
        }

    }
}