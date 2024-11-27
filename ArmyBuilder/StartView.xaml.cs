using System.Windows;
using System.Windows.Controls;

namespace ArmyBuilder
{
    public partial class StartView : UserControl
    {
        public StartView()
        {
            InitializeComponent();
        }

        private void NewMenuItem_Click(object sender, RoutedEventArgs e)
        {
            Window window = Window.GetWindow(this);
            window.Content = new NewArmyView();
        }

    }


}
