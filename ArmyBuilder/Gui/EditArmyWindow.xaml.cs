using ArmyBuilder.Domain;
using System.Windows;

namespace ArmyBuilder
{
    public partial class EditArmyWindow : Window
    {
        private Army _army;

        public EditArmyWindow(Army army)
        {
            InitializeComponent();
            _army = army;
            ArmyNameTextBox.Text = _army.Name;
            ArmyAuthorTextBox.Text = _army.Author;
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            _army.Name = ArmyNameTextBox.Text;
            _army.Author = ArmyAuthorTextBox.Text;
            // Save changes to the army (e.g., update the database or in-memory collection)
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