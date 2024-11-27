using Microsoft.Extensions.DependencyInjection;
using System.Windows;

namespace ArmyBuilder
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainContent.Content = new StartView();
        }
    }
}