using System.Collections.ObjectModel;

namespace ArmyBuilder.ViewModels
{
    public class ArmyTreeViewModel
    {
        public ObservableCollection<UnitTreeNodeViewModel> RootItems { get; set; }

        public ArmyTreeViewModel()
        {
            RootItems = new ObservableCollection<UnitTreeNodeViewModel>
            {
                new UnitTreeNodeViewModel
                {
                    Name = "Army List",
                    Value = 0,
                    Children = new ObservableCollection<UnitTreeNodeViewModel>
                    {
                        new UnitTreeNodeViewModel
                        {
                            Name = "Infantry",
                            Value = 0,
                            Children = new ObservableCollection<UnitTreeNodeViewModel>
                            {
                                new UnitTreeNodeViewModel { Name = "Spearmen", Value = 10 },
                                new UnitTreeNodeViewModel { Name = "Archers", Value = 15 }
                            }
                        },
                        new UnitTreeNodeViewModel
                        {
                            Name = "Cavalry",
                            Value = 0,
                            Children = new ObservableCollection<UnitTreeNodeViewModel>
                            {
                                new UnitTreeNodeViewModel { Name = "Knights", Value = 20 },
                                new UnitTreeNodeViewModel { Name = "Light Horsemen", Value = 25 }
                            }
                        }
                    }
                }
            };
        }
    }
}




