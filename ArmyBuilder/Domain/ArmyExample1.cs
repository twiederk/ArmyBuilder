using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArmyBuilder.Domain
{
    public class ArmyExample1: Army
    {
        public ArmyExample1() : base("Armee der Hochelfen von Tyr")
        {
            Units = new List<Unit>()
            {
                new Unit("Generalseinheit")
                {
                    MainModels = new List<MainModel>
                    {
                        new MainModel()
                        {
                            Name = "General",
                            ArmyCategory = ArmyCategory.Character,
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
                        },
                        new MainModel()
                        {
                            Name = "Speerträger",
                            ArmyCategory = ArmyCategory.Trooper,
                            Points = 10,
                            Count = 20,
                            SingleModels = new List<SingleModel>
                            {
                                new SingleModel()
                                {
                                    Name = "Speerträger",
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
                        }
                    }

                },
                new Unit("Streitwagen")
                {
                    MainModels = new List<MainModel>
                    {
                        new MainModel()
                        {
                            Name = "Streitwagen",
                            ArmyCategory = ArmyCategory.WarMachine,
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
                                    Name = "Elfenroß",
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
                            }
                        }
                    }
                }
            };

        }
    }
}
