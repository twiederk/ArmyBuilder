using ArmyBuilder.Domain;
using System.Collections.Generic;
using System.Windows;

namespace ArmyBuilder
{
    public partial class SelectMountWindow : Window
    {
        public SingleModel SelectedMount { get; private set; }

        public SelectMountWindow(List<SingleModel> mounts)
        {
            InitializeComponent();
            MountListBox.ItemsSource = mounts;
        }

        private void OkButton_Click(object sender, RoutedEventArgs e)
        {
            SelectedMount = MountListBox.SelectedItem as SingleModel;
            DialogResult = true;
            Close();
        }
    }
}
