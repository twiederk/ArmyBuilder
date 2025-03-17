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

        private void ListBox_MouseLeftButtonUpClick(object sender, MouseButtonEventArgs e)
        {
            ListBox listBox = sender as ListBox;
            if (listBox != null)
            {
                var selectedMainModel = listBox.SelectedItem as MainModel;
                if (selectedMainModel != null)
                {
                    // Find the parent ArmyView
                    var parent = FindParent<ArmyView>(this);
                    if (parent != null)
                    {
                        // Find the ImageControl in the parent ArmyView
                        var imageControl = parent.FindName("imageControl") as Image;
                        if (imageControl != null)
                        {
                            // Update the ImageControl source
                            //imageControl.Source = new BitmapImage(new Uri(selectedMainModel.ImagePath));
                            //imageControl.Source = new BitmapImage(new Uri(new Uri(AppDomain.CurrentDomain.BaseDirectory), selectedMainModel.ImagePath));

                            //string relativePath = @"images\HighElves\HighElf_Dragon.jpg"; // Replace with your relative image path
                            string relativePath = selectedMainModel.ImagePath; // Replace with your relative image path
                            string filePath = System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, relativePath);
                            //BitmapImage bitmap = new BitmapImage();
                            //bitmap.BeginInit();
                            //bitmap.UriSource = new Uri(filePath, UriKind.Absolute);
                            //bitmap.EndInit();

                            //imageControl.Source = bitmap; // Assign the BitmapImage to the Image control
                            imageControl.Source = new BitmapImage(new Uri(filePath, UriKind.Absolute));
                        }
                    }
                }
            }
        }

        private T FindParent<T>(DependencyObject child) where T : DependencyObject
        {
            DependencyObject parentObject = VisualTreeHelper.GetParent(child);
            if (parentObject == null) return null;

            T parent = parentObject as T;
            if (parent != null)
            {
                return parent;
            }
            else
            {
                return FindParent<T>(parentObject);
            }
        }
    }
}
