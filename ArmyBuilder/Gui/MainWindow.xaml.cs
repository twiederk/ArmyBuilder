using System.Windows;

namespace ArmyBuilder
{
    public partial class MainWindow : Window
    {
        public MainWindow(StartView startView)
        {
            InitializeComponent();
            MainContent.Content = startView;
        }
    }
}