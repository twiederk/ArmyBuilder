using System.Collections.ObjectModel;

namespace ArmyBuilder.ViewModels
{
    public class TreeViewViewModel
    {
        public ObservableCollection<TreeViewItemViewModel> RootItems { get; set; }

        public TreeViewViewModel()
        {
            RootItems = new ObservableCollection<TreeViewItemViewModel>
            {
                new TreeViewItemViewModel
                {
                    Name = "Army List",
                    Value = 0,
                    Children = new ObservableCollection<TreeViewItemViewModel>
                    {
                        new TreeViewItemViewModel
                        {
                            Name = "Infantry",
                            Value = 0,
                            Children = new ObservableCollection<TreeViewItemViewModel>
                            {
                                new TreeViewItemViewModel { Name = "Spearmen", Value = 10 },
                                new TreeViewItemViewModel { Name = "Archers", Value = 15 }
                            }
                        },
                        new TreeViewItemViewModel
                        {
                            Name = "Cavalry",
                            Value = 0,
                            Children = new ObservableCollection<TreeViewItemViewModel>
                            {
                                new TreeViewItemViewModel { Name = "Knights", Value = 20 },
                                new TreeViewItemViewModel { Name = "Light Horsemen", Value = 25 }
                            }
                        }
                    }
                }
            };
        }
    }
}




