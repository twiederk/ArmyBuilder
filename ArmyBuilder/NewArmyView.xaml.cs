using System.Windows;
using System.Windows.Controls;

namespace ArmyBuilder
{
    public partial class NewArmyView : UserControl
    {
        public NewArmyView()
        {
            InitializeComponent();
            ArmyListBox.Items.Add("Hochelfen");
            ArmyListBox.Items.Add("Zwerge");
        }

        private void Ok_Click(object sender, RoutedEventArgs e)
        {
            Window window = Window.GetWindow(this);
            window.Content = new ArmyView();
        }

    }


}
