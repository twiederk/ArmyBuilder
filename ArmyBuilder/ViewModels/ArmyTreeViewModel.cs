using System.Collections.ObjectModel;
using ArmyBuilder.Domain;


namespace ArmyBuilder.ViewModels
{
    public class ArmyTreeViewModel
    {
        public ObservableCollection<ArmyTreeNode> RootItems { get; set; }

        public ArmyTreeViewModel()
        {
            Army army = new Army("Armee der Hochelfen von Tyr");
            RootItems = new ObservableCollection<ArmyTreeNode>
            {
                new ArmyTreeNode(army)
                {
                    Children = new ObservableCollection<UnitTreeNode>
                    {
                        new UnitTreeNode(
                            new Unit("Generalseinheit")
                            {
                                MainModels = new List<Pair<int, MainModel>>
                                {
                                    new Pair<int, MainModel>(1, new MainModel()
                                    {
                                        Name = "General",
                                        Points = 100,
                                        SingleModels = new List<SingleModel>
                                        {
                                            new SingleModel()
                                            {
                                                Name = "General",
                                                Profile = new Profile
                                                {
                                                    Movement = 5,
                                                    WeaponSkill = 7,
                                                    BallisticSkill = 7,
                                                    Strength = 4,
                                                    Toughness = 4,
                                                    Wounds = 3,
                                                    Initiative = 9,
                                                    Attacks = 4,
                                                    Moral = 10
                                                }
                                            }
                                        }
                                    }),
                                    new Pair<int, MainModel>(20, new MainModel()
                                    {
                                        Name = "Speertr‰ger",
                                        Points = 10,
                                        SingleModels = new List<SingleModel>
                                        {
                                            new SingleModel()
                                            {
                                                Name = "Speertr‰ger",
                                                Profile = new Profile
                                                {
                                                    Movement = 5,
                                                    WeaponSkill = 4,
                                                    BallisticSkill = 4,
                                                    Strength = 3,
                                                    Toughness = 3,
                                                    Wounds = 1,
                                                    Initiative = 6,
                                                    Attacks = 1,
                                                    Moral = 8
                                                }
                                            }
                                        }
                                    })
                                }

                            }
                        ),
                        new UnitTreeNode(
                            new Unit("Streitwagen")
                            )
                        {
                            Children = new ObservableCollection<MainModelTreeNode>
                            {
                                new MainModelTreeNode(
                                    new MainModel()
                                    {
                                        Name = "Streitwagen",
                                        Points = 70,
                                        SingleModels = new List<SingleModel>
                                        {
                                            new SingleModel()
                                            {
                                                Name = "Streitwagen",
                                                Profile = new Profile
                                                {
                                                    Movement = 0,
                                                    WeaponSkill = 0,
                                                    BallisticSkill = 0,
                                                    Strength = 0,
                                                    Toughness = 7,
                                                    Wounds = 3,
                                                    Initiative = 0,
                                                    Attacks = 0,
                                                    Moral = 0
                                                }
                                            },
                                            new SingleModel()
                                            {
                                                Name = "Streitwagenlenker",
                                                Profile = new Profile
                                                {
                                                    Movement = 5,
                                                    WeaponSkill = 5,
                                                    BallisticSkill = 4,
                                                    Strength = 4,
                                                    Toughness = 3,
                                                    Wounds = 1,
                                                    Initiative = 7,
                                                    Attacks = 1,
                                                    Moral = 8
                                                }
                                            },
                                            new SingleModel()
                                            {
                                                Name = "Elfenroﬂ",
                                                Profile = new Profile
                                                {
                                                    Movement = 9,
                                                    WeaponSkill = 3,
                                                    BallisticSkill = 0,
                                                    Strength = 3,
                                                    Toughness = 3,
                                                    Wounds = 1,
                                                    Initiative = 4,
                                                    Attacks = 1,
                                                    Moral = 5
                                                }
                                            }
                                        },
                                    },
                                    1
                                )
                            }
                        }
                    }
                }
            };
        }
    }
}




