using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using ArmyBuilder.ViewModels;
using ArmyBuilder.Domain;

namespace ArmyBuilder
{
    public partial class ArmyView : UserControl
    {
        public ArmyView(ArmyViewModel armyViewModel)
        {
            InitializeComponent();
            DataContext = armyViewModel;
        }

        private void lstCharacters_MouseMove(object sender, MouseEventArgs e)
        {
            ListBox_MouseMove(sender, e);
        }

        private void lstTroopers_MouseMove(object sender, MouseEventArgs e)
        {
            ListBox_MouseMove(sender, e);
        }

        private void lstWarMachines_MouseMove(object sender, MouseEventArgs e)
        {
            ListBox_MouseMove(sender, e);
        }

        private void lstMonsters_MouseMove(object sender, MouseEventArgs e)
        {
            ListBox_MouseMove(sender, e);
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

        private void mainModelTreeNode_IncreaseCount(object sender, RoutedEventArgs e)
        {
            if (sender is Button button && button.Tag is MainModelTreeNode mainModelTreeNode)
            {
                var mainModel = mainModelTreeNode.MainModel;
                mainModel.IncreaseCount();
                var armyViewModel = DataContext as ArmyViewModel;
                armyViewModel.UpdateMainModelCount(mainModelTreeNode.Unit.Id, mainModel.Id, mainModel.Count);
                mainModelTreeNode.IncreaseCount();
            }

        }

    }
}