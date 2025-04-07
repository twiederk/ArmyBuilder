using ArmyBuilder.Domain;
using System.Windows;

namespace ArmyBuilder
{
    public partial class EditMainModelWindow : Window
    {
        public MainModel MainModel { get; private set; }

        public EditMainModelWindow(MainModel mainModel)
        {
            InitializeComponent();
            MainModel = mainModel;
            txtName.Text = MainModel.Name;
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            MainModel.Name = txtName.Text;
            DialogResult = true;
            Close();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
            Close();
        }
    }
}
