using System.Collections.ObjectModel;

namespace ArmyBuilder.ViewModels
{
    public class ArmyTreeViewModel
    {
        public ObservableCollection<NodeTreeViewModel> RootItems { get; set; }

        public ArmyTreeViewModel()
        {
            RootItems = new ObservableCollection<NodeTreeViewModel>
            {
                new NodeTreeViewModel
                {
                    Name = "Army List",
                    Value = 0,
                    Children = new ObservableCollection<NodeTreeViewModel>
                    {
                        new NodeTreeViewModel
                        {
                            Name = "Infantry",
                            Value = 0,
                            Children = new ObservableCollection<NodeTreeViewModel>
                            {
                                new NodeTreeViewModel { Name = "Spearmen", Value = 10 },
                                new NodeTreeViewModel { Name = "Archers", Value = 15 }
                            }
                        },
                        new NodeTreeViewModel
                        {
                            Name = "Cavalry",
                            Value = 0,
                            Children = new ObservableCollection<NodeTreeViewModel>
                            {
                                new NodeTreeViewModel { Name = "Knights", Value = 20 },
                                new NodeTreeViewModel { Name = "Light Horsemen", Value = 25 }
                            }
                        }
                    }
                }
            };
        }
    }
}




