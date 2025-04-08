using ArmyBuilder.Domain;
using ArmyBuilder.ViewModels;
using System.Windows;

namespace ArmyBuilder
{
    public partial class SelectMountWindow : Window
    {
        public SingleModel SelectedMount { get; private set; }

        public SelectMountWindow(SelectMountViewModel selectMountViewModel)
        {
            InitializeComponent();
            MountListBox.ItemsSource = selectMountViewModel.Mounts;
        }


        private void OkButton_Click(object sender, RoutedEventArgs e)
        {
            if (MountListBox.SelectedItem != null) {
                SelectedMount = ((MountViewModel)MountListBox.SelectedItem).SingleModel;
            }
            DialogResult = true;
            Close();
        }

    }
}
