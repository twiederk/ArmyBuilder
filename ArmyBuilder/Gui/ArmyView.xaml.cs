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

        private void listCharacters_MouseMove(object sender, MouseEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
            {
                // Get the selected item from listAnimals
                var selectedItem = listCharacters.SelectedItem;

                if (selectedItem != null)
                {
                    // Create a DataObject containing the selected item
                    DataObject dataObject = new DataObject(selectedItem);

                    // Initialize the drag & drop operation
                    DragDrop.DoDragDrop(listCharacters, dataObject, DragDropEffects.Move);
                }
            }
        }

        private void listTroopers_MouseMove(object sender, MouseEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
            {
                // Get the selected item from listAnimals
                var selectedItem = listTroopers.SelectedItem;

                if (selectedItem != null)
                {
                    // Create a DataObject containing the selected item
                    DataObject dataObject = new DataObject(selectedItem);

                    // Initialize the drag & drop operation
                    DragDrop.DoDragDrop(listTroopers, dataObject, DragDropEffects.Move);
                }
            }
        }

        private void listWarMachines_MouseMove(object sender, MouseEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
            {
                // Get the selected item from listAnimals
                var selectedItem = listWarMachines.SelectedItem;

                if (selectedItem != null)
                {
                    // Create a DataObject containing the selected item
                    DataObject dataObject = new DataObject(selectedItem);

                    // Initialize the drag & drop operation
                    DragDrop.DoDragDrop(listWarMachines, dataObject, DragDropEffects.Move);
                }
            }
        }

        private void listMonsters_MouseMove(object sender, MouseEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
            {
                // Get the selected item from listAnimals
                var selectedItem = listMonsters.SelectedItem;

                if (selectedItem != null)
                {
                    // Create a DataObject containing the selected item
                    DataObject dataObject = new DataObject(selectedItem);

                    // Initialize the drag & drop operation
                    DragDrop.DoDragDrop(listMonsters, dataObject, DragDropEffects.Move);
                }
            }
        }

        private void armyTreeNode_Drop(object sender, DragEventArgs dragEvent)
        {
            if (dragEvent.Data.GetDataPresent(typeof(MainModel)))
            {
                // Get the dropped data
                MainModel droppedMainModel = dragEvent.Data.GetData(typeof(MainModel)) as MainModel;

                if (droppedMainModel != null)
                {
                    var armyTreeNode = ((FrameworkElement)sender).DataContext as ArmyTreeNode;
                    if (armyTreeNode != null)
                    {
                        armyTreeNode.AddUnit(droppedMainModel);
                    }
                }
            }
        }

        private void unitTreeNode_Drop(object sender, DragEventArgs dragEvent)
        {
            if (dragEvent.Data.GetDataPresent(typeof(MainModel)))
            {
                // Get the dropped data
                MainModel droppedMainModel = dragEvent.Data.GetData(typeof(MainModel)) as MainModel;

                if (droppedMainModel != null)
                {
                    var unitTreeNode = ((FrameworkElement)sender).DataContext as UnitTreeNode;
                    if (unitTreeNode != null)
                    {
                        unitTreeNode.AddMainModel(droppedMainModel);
                    }
                }
            }
        }
    }
}