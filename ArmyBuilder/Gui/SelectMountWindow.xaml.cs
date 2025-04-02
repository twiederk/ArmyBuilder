using ArmyBuilder.Domain;
using ArmyBuilder.ViewModels;
using System.Windows;

namespace ArmyBuilder
{
    public partial class SelectMountWindow : Window
    {
        public MountViewModel? SelectedMount { get; private set; }

        public SelectMountWindow(List<SingleModel> singleModels)
        {
            InitializeComponent();
            List<MountViewModel> mountViewModels = convertToMountViewModels(singleModels);
            MountListBox.ItemsSource = mountViewModels;
        }

        private List<MountViewModel> convertToMountViewModels(List<SingleModel> singleModels)
        {

        }

        private void OkButton_Click(object sender, RoutedEventArgs e)
        {
            SelectedMount = MountListBox.SelectedItem.SingleModel as SingleModel;
            DialogResult = true;
            Close();
        }
    }
}
