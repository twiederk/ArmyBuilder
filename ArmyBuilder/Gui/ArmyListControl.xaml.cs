using ArmyBuilder.Domain;
using ArmyBuilder.ViewModels;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace ArmyBuilder
{
    public partial class ArmyTabControl : UserControl
    {
        public ArmyTabControl()
        {
            InitializeComponent();
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

    }
}
