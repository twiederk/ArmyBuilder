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
            DataContext = selectMountViewModel;
        }



        private void OkButton_Click(object sender, RoutedEventArgs e)
        {
            if (MountListBox.SelectedItem != null) {
                var selectMountViewModel = DataContext as SelectMountViewModel;
                SelectedMount = selectMountViewModel.SelectedMount.SingleModel;
            }
            DialogResult = true;
            Close();
        }

    }
}
