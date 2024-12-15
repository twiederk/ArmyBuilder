using System.Windows.Controls;
using ArmyBuilder.ViewModels;

namespace ArmyBuilder
{
    public partial class ArmyView : UserControl
    {
        public ArmyView(ArmyViewModel armyViewModel)
        {
            InitializeComponent();
            DataContext = armyViewModel;
        }
    }
}