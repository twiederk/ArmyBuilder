using System.Collections.ObjectModel;

namespace ArmyBuilder.ViewModels
{
    public class ArmyTreeViewModel
    {
        public ObservableCollection<ArmyTreeNode> RootItems { get; set; }

        public ArmyTreeViewModel()
        {
            RootItems = new ObservableCollection<ArmyTreeNode>
            {
                new ArmyTreeNode
                {
                    Name = "Armee der Hochelfen von Tyr",
                    Value = 0,
                    Children = new ObservableCollection<UnitTreeNode>
                    {
                        new UnitTreeNode
                        {
                            Name = "Generalseinheit",
                            Value = 0,
                            Children = new ObservableCollection<MainModelTreeNode>
                            {
                                new MainModelTreeNode { 
                                    Name = "General",
                                    Value = 100,
                                    Count = 1,
                                    Children = new ObservableCollection<SingleModelTreeNode>
                                    {
                                        new SingleModelTreeNode { Name = "General", Value = 100 },
                                    }
                                },
                                new MainModelTreeNode {
                                    Name = "Spearmen",
                                    Value = 10,
                                    Count = 20,
                                    Children = new ObservableCollection<SingleModelTreeNode>
                                    {
                                        new SingleModelTreeNode { Name = "Spearmen", Value = 10 },
                                    }
                                },
                            }
                        },
                        new UnitTreeNode
                        {
                            Name = "Streitwagen",
                            Value = 70,
                            Children = new ObservableCollection<MainModelTreeNode>
                            {
                                new MainModelTreeNode {
                                    Name = "Streitwagen",
                                    Value = 70,
                                    Count = 1,
                                    Children = new ObservableCollection<SingleModelTreeNode>
                                    {
                                        new SingleModelTreeNode { Name = "Streitwagen", Value = 40 },
                                        new SingleModelTreeNode { Name = "Streitwagenlenker", Value = 20 },
                                        new SingleModelTreeNode { Name = "Streitwagenzugtier", Value = 10 },
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




