using ArmyBuilder.Domain;
using System.Windows;

namespace ArmyBuilder
{
    public partial class EditUnitWindow : Window
    {
        public Unit Unit { get; private set; }

        public EditUnitWindow(Unit unit)
        {
            InitializeComponent();
            Unit = unit;
            txtName.Text = Unit.Name;
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            Unit.Name = txtName.Text;
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
