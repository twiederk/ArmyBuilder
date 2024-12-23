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
                    Name = "Armee der Hochelfen von Tyr",
                    Value = 0,
                    Children = new ObservableCollection<UnitTreeNodeViewModel>
                    {
                        new UnitTreeNodeViewModel
                        {
                            Name = "Generalseinheit",
                            Value = 0,
                            Children = new ObservableCollection<MainModelTreeNodeViewModel>
                            {
                                new MainModelTreeNodeViewModel { 
                                    Name = "General",
                                    Value = 100,
                                    Children = new ObservableCollection<SingleModelTreeNodeViewModel>
                                    {
                                        new SingleModelTreeNodeViewModel { Name = "General", Value = 100 },
                                    }
                                },
                                new MainModelTreeNodeViewModel {
                                    Name = "Spearmen",
                                    Value = 10,
                                    Children = new ObservableCollection<SingleModelTreeNodeViewModel>
                                    {
                                        new SingleModelTreeNodeViewModel { Name = "Spearmen", Value = 10 },
                                    }
                                },
                            }
                        },
                        new UnitTreeNodeViewModel
                        {
                            Name = "Streitwagen",
                            Value = 70,
                            Children = new ObservableCollection<MainModelTreeNodeViewModel>
                            {
                                new MainModelTreeNodeViewModel {
                                    Name = "Streitwagen",
                                    Value = 70,
                                    Children = new ObservableCollection<SingleModelTreeNodeViewModel>
                                    {
                                        new SingleModelTreeNodeViewModel { Name = "Streitwagen", Value = 40 },
                                        new SingleModelTreeNodeViewModel { Name = "Streitwagenlenker", Value = 20 },
                                        new SingleModelTreeNodeViewModel { Name = "Streitwagenzugtier", Value = 10 },
                                    }
                                },
                            }
                        }
                    }
                }
            };
        }
    }
}




