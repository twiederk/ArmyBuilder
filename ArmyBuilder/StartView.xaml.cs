using Microsoft.Extensions.DependencyInjection;
using System.Windows;
using System.Windows.Controls;

namespace ArmyBuilder
{
    public partial class StartView : UserControl
    {
        private IServiceProvider _serviceProvider;

        public StartView(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
            InitializeComponent();
        }

        private void NewMenuItem_Click(object sender, RoutedEventArgs e)
        {
            Window window = Window.GetWindow(this);
            window.Content = _serviceProvider.GetRequiredService<NewArmyView>(); ;
        }

    }


}
