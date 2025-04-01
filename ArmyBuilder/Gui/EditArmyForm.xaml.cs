using ArmyBuilder.Domain;
using System.Windows;

namespace ArmyBuilder
{
    public partial class EditArmyForm : Window
    {
        private Army _army;

        public EditArmyForm(Army army)
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
            this.DialogResult = true;
            this.Close();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = false;
            this.Close();
        }
    }
}