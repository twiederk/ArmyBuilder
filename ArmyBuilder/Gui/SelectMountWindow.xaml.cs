using ArmyBuilder.Domain;
using ArmyBuilder.ViewModels;
using System.Windows;

namespace ArmyBuilder
{
    public partial class SelectMountWindow : Window
    {
        public SingleModel SelectedMount { get; private set; }

        public SelectMountWindow(List<SingleModel> singleModels)
        {
            InitializeComponent();
            List<MountViewModel> mountViewModels = convertToMountViewModels(singleModels);
            MountListBox.ItemsSource = mountViewModels;
        }

        private List<MountViewModel> convertToMountViewModels(List<SingleModel> singleModels)
        {
            List<MountViewModel> mountViewModels = new List<MountViewModel>();
            foreach (var singleModel in singleModels)
            {
                mountViewModels.Add(new MountViewModel(singleModel));
            }
            return mountViewModels;
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
