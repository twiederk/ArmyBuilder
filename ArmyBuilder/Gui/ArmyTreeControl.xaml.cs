﻿using ArmyBuilder.Domain;
using ArmyBuilder.ViewModels;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace ArmyBuilder
{
    public partial class ArmyTreeControl : UserControl
    {
        public ArmyTreeControl()
        {
            InitializeComponent();
        }

        private void CollapseLevel1_Click(object sender, RoutedEventArgs e)
        {
            CollapseTreeViewItems(trvArmy, 1);
        }

        private void CollapseLevel2_Click(object sender, RoutedEventArgs e)
        {
            CollapseTreeViewItems(trvArmy, 2);
        }

        private void CollapseLevel3_Click(object sender, RoutedEventArgs e)
        {
            CollapseTreeViewItems(trvArmy, 3);
        }

        private void CollapseTreeViewItems(ItemsControl parent, int level)
        {
            foreach (var item in parent.Items)
            {
                if (parent.ItemContainerGenerator.ContainerFromItem(item) is TreeViewItem treeViewItem)
                {
                    if (level == 1)
                    {
                        treeViewItem.IsExpanded = false;
                    }
                    else
                    {
                        CollapseTreeViewItems(treeViewItem, level - 1);
                    }
                }
            }
        }

        private void ExpandLevel1_Click(object sender, RoutedEventArgs e)
        {
            ExpandTreeViewItems(trvArmy, 1);
        }

        private void ExpandLevel2_Click(object sender, RoutedEventArgs e)
        {
            ExpandTreeViewItems(trvArmy, 2);
        }

        private void ExpandLevel3_Click(object sender, RoutedEventArgs e)
        {
            ExpandTreeViewItems(trvArmy, 3);
        }

        private void ExpandTreeViewItems(ItemsControl parent, int level)
        {
            foreach (var item in parent.Items)
            {
                if (parent.ItemContainerGenerator.ContainerFromItem(item) is TreeViewItem treeViewItem)
                {
                    if (level == 1)
                    {
                        treeViewItem.IsExpanded = true;
                    }
                    else
                    {
                        treeViewItem.IsExpanded = true;
                        ExpandTreeViewItems(treeViewItem, level - 1);
                    }
                }
            }
        }

        private void ScrollViewer_PreviewMouseWheel(object sender, MouseWheelEventArgs e)
        {
            ScrollViewer scrollViewer = sender as ScrollViewer;
            if (scrollViewer != null)
            {
                if (e.Delta > 0)
                {
                    scrollViewer.LineUp();
                }
                else
                {
                    scrollViewer.LineDown();
                }
                e.Handled = true;
            }
        }

        private void armyTreeNode_Drop(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(typeof(MainModel)))
            {
                MainModel droppedMainModel = e.Data.GetData(typeof(MainModel)) as MainModel;

                if (droppedMainModel != null)
                {
                    var armyTreeNode = ((FrameworkElement)sender).DataContext as ArmyTreeNode;
                    if (armyTreeNode != null)
                    {
                        MainModel clonedMainModel = droppedMainModel.Clone();
                        Army army = armyTreeNode.Army;
                        var armyViewModel = DataContext as ArmyViewModel;
                        ArmyBuilder.Domain.Unit unit = armyViewModel.CreateUnit(army, clonedMainModel);
                        armyTreeNode.AddUnit(unit);
                    }
                }
            }
        }

        private void unitTreeNode_Drop(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(typeof(MainModel)))
            {
                MainModel droppedMainModel = e.Data.GetData(typeof(MainModel)) as MainModel;

                if (droppedMainModel != null)
                {
                    var unitTreeNode = ((FrameworkElement)sender).DataContext as UnitTreeNode;
                    if (unitTreeNode != null)
                    {
                        MainModel clonedMainModel = droppedMainModel.Clone();
                        ArmyBuilder.Domain.Unit unit = unitTreeNode.Unit;
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

        private void AddMountButton_Click(object sender, RoutedEventArgs e)
        {
            if (sender is Button button && button.Tag is MainModelTreeNode mainModelTreeNode)
            {
                ArmyViewModel armyViewModel = DataContext as ArmyViewModel;
                List<SingleModel> mounts = armyViewModel.Mounts;

                var selectMountWindow = new SelectMountWindow(mounts);
                if (selectMountWindow.ShowDialog() == true)
                {
                    var selectedMount = selectMountWindow.SelectedMount;
                    if (selectedMount != null)
                    {
                        mainModelTreeNode.AddSingleModel(selectedMount);
                        armyViewModel.AddSingleModelToMainModel(mainModelTreeNode.MainModel.Id, selectedMount);
                        armyViewModel.UpdateSingleModel(mainModelTreeNode.MainModel.SingleModels[0]);
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
                UpdateMainModel(mainModelTreeNode, mainModel);
            }
        }

        private void mainModelTreeNode_DecreaseCount(object sender, RoutedEventArgs e)
        {
            if (sender is Button button && button.Tag is MainModelTreeNode mainModelTreeNode)
            {
                var mainModel = mainModelTreeNode.MainModel;
                mainModel.DecreaseCount();
                UpdateMainModel(mainModelTreeNode, mainModel);
            }
        }

        private void UpdateMainModel(MainModelTreeNode mainModelTreeNode, MainModel mainModel)
        {
            var armyViewModel = DataContext as ArmyViewModel;
            armyViewModel.UpdateMainModel(mainModelTreeNode.Unit.Id, mainModel);
            mainModelTreeNode.UpdateCount();
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (sender is ComboBox comboBox && comboBox.DataContext is SlotViewModel slotViewModel && comboBox.Tag is ItemsControl itemsControl)
            {
                var armyViewModel = DataContext as ArmyViewModel;
                armyViewModel.UpdateSlotItem(slotViewModel.Slot);
                var equipmentTreeNode = itemsControl.DataContext as EquipmentTreeNode;
                equipmentTreeNode.UpdateEquipment();
            }
        }

        private void TrooperCheckbox_Click(object sender, RoutedEventArgs e)
        {
            if (sender is CheckBox checkbox && checkbox.Tag is MainModelTreeNode mainModelTreeNode)
            {
                var mainModel = mainModelTreeNode.MainModel;
                UpdateMainModel(mainModelTreeNode, mainModel);
            }
        }

    }
}
