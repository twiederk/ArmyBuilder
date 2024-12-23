using System.Collections.ObjectModel;

namespace ArmyBuilder.ViewModels
{
    public class ArmyTreeViewModel
    {
        public ObservableCollection<ArmyTreeNodeViewModel> RootItems { get; set; }

        public ArmyTreeViewModel()
        {
            RootItems = new ObservableCollection<ArmyTreeNodeViewModel>
            {
                new ArmyTreeNodeViewModel
                {
                    Name = "Army List",
                    Value = 0,
                    Children = new ObservableCollection<UnitTreeNodeViewModel>
                    {
                        new UnitTreeNodeViewModel
                        {
                            Name = "Infantry",
                            Value = 0,
                            Children = new ObservableCollection<MainModelTreeNodeViewModel>
                            {
                                new MainModelTreeNodeViewModel { Name = "Spearmen", Value = 10 },
                                new MainModelTreeNodeViewModel { Name = "Archers", Value = 15 }
                            }
                        },
                        new UnitTreeNodeViewModel
                        {
                            Name = "Cavalry",
                            Value = 0,
                            Children = new ObservableCollection<MainModelTreeNodeViewModel>
                            {
                                new MainModelTreeNodeViewModel { Name = "Knights", Value = 20 },
                                new MainModelTreeNodeViewModel { Name = "Light Horsemen", Value = 25 }
                            }
                        }
                    }
                }
            };
        }
    }
}




