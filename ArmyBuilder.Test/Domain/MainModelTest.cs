using FluentAssertions;
using ArmyBuilder.Domain;

namespace ArmyBuilder.Test.Domain
{
    public class MainModelTest
    {

        [Fact]
        public void should_increase_count_by_1_when_called()
        {
            // arrange
            var model = new MainModel() { Count = 1 };

            // act
            model.IncreaseCount();

            // assert
            model.Count.Should().Be(2);
        }

        [Fact]
        public void should_decrease_count_by_1_when_called()
        {
            // arrange
            var model = new MainModel() { Count = 5 };

            // act
            model.DecreaseCount();

            // assert
            model.Count.Should().Be(4);
        }

        [Fact]
        public void should_stay_at_count_1_when_count_is_already_1()
        {
            // arrange
            var model = new MainModel() { Count = 1 };

            // act
            model.DecreaseCount();

            // assert
            model.Count.Should().Be(1);
        }

        [Fact]
        public void should_clone_main_model()
        {
            // arrange
            var model = new MainModel { 
                Uniquely = true,
                StandardBearer = true,
                Musician = true,
                SingleModels =
                {
                    new SingleModel
                    {
                        Count = 2,
                        Profile = new Profile { Id = 1, Points = 10 }
                    },
                    new SingleModel
                    {
                        Profile = new Profile { Id = 2, Points = 20 },
                        MountSave = 1
                    }
                }
            };

            // act
            var clone = model.Clone();

            // assert
            clone.Uniquely.Should().Be(true);
            clone.StandardBearer.Should().BeTrue();
            clone.Musician.Should().BeTrue();
            clone.SingleModels.Should().HaveCount(2);

            clone.SingleModels[0].Count.Should().Be(2);
            clone.SingleModels[0].Profile.Points.Should().Be(10);

            clone.SingleModels[1].Profile.Id.Should().Be(2);
            clone.SingleModels[1].Profile.Points.Should().Be(20);
            clone.SingleModels[1].MountSave.Should().Be(1);
        }

        [Fact]
        public void should_be_customizable_when_army_category_is_character_and_not_unique()
        {
            // arrange
            MainModel mainModel = new MainModel { ArmyCategory = ArmyCategory.Character, Uniquely = false };

            // act
            bool customizable = mainModel.isCustomizable();

            // assert
            customizable.Should().BeTrue();
        }

        [Fact]
        public void should_not_be_customizable_when_army_category_is_character_and_unique()
        {
            // arrange
            MainModel mainModel = new MainModel { ArmyCategory = ArmyCategory.Character, Uniquely = true };

            // act
            bool customizable = mainModel.isCustomizable();

            // assert
            customizable.Should().BeFalse();
        }

        [Fact]
        public void should_add_single_model_to_main_model()
        {
            // arrange
            var mainModel = new MainModel { SingleModels = { new SingleModel { Id = 1, Name = "Existing Single Model" } } };
            var singleModel = new SingleModel { Id = 2, Name = "Additional Single Model" };

            // act
            mainModel.AddSingleModel(singleModel);

            // assert
            mainModel.SingleModels.Should().HaveCount(2);
            mainModel.SingleModels.Should().ContainSingle(sm => sm.Id == singleModel.Id && sm.Name == singleModel.Name);
        }

        [Fact]
        public void should_set_mount_save_to_on_mount_when_adding_mount_to_main_model()
        {
            // arrange
            var mainModel = new MainModel { SingleModels = { new SingleModel { Id = 1, Name = "Existing Single Model" } } };
            var mountModel = new MountModel { Id = 2, Name = "Additional Single Model", Profile = new Profile(), MountSave = 1 };

            // act
            mainModel.AddMount(mountModel);

            // assert
            mainModel.SingleModels.Should().HaveCount(2);
            mainModel.SingleModels[0].MountSave.Should().Be(1);
            mainModel.SingleModels[1].MountSave.Should().Be(0);
        }

        [Fact]
        public void should_calculate_points_of_character_with_magic_item()
        {
            // arrange
            var mainModel = new MainModel
            { 
                SingleModels =
                { 
                    new SingleModel
                    {
                        Profile = new Profile { Points = 160 },
                        MountSave = 0,
                        Equipment = new Equipment
                        {
                            Slots =
                            {
                                new Slot { Item = new Shield { Name = "Shield", Points = 1 } },
                                new Slot { Item = new Armor { Name = "light Armor", Points = 2 } },
                                new Slot { Item = new MeleeWeapon { Name = "Magic Sword", Points = 50, Magic = true } },
                            }
                        }
                    } 
                }
            };
            
            // act
            float points = mainModel.TotalPoints();

            // assert
            points.Should().Be(213);
        }

        [Fact]
        public void should_calculate_points_of_character_on_mount_with_magic_item()
        {
            // arrange
            var mainModel = new MainModel
            { 
                ArmyCategory = ArmyCategory.Character,
                SingleModels =
                { 
                    new SingleModel
                    {
                        Name = "General",
                        Profile = new Profile { Points = 160 },
                        MountSave = 1,
                        Equipment = new Equipment
                        {
                            Slots =
                            {
                                new Slot { Item = new Shield { Name = "Shield", Points = 1 } },
                                new Slot { Item = new Armor { Name = "light Armor", Points = 2 } },
                                new Slot { Item = new MeleeWeapon { Name = "Magic Sword", Points = 50, Magic = true } },
                            }
                        }
                    },
                    new SingleModel {
                        Name = "Horse",
                        Profile = new Profile { Points = 3}
                    }
                }
            };
            
            // act
            float points = mainModel.TotalPoints();

            // assert
            points.Should().Be(216);
        }

        [Fact]
        public void should_calculate_points_of_trooper()
        {
            // arrange
            var mainModel = new MainModel
            { 
                ArmyCategory = ArmyCategory.Character,
                Count = 10,
                SingleModels =
                { 
                    new SingleModel
                    {
                        Name = "Spearman",
                        Profile = new Profile { Points = 10 },
                        MountSave = 0,
                        Equipment = new Equipment
                        {
                            Slots =
                            {
                                new Slot { Item = new MeleeWeapon { Name = "Spear", Points = 1 } },
                                new Slot { Item = new Armor { Name = "light Armor", Points = 2 } },
                            }
                        }
                    }
                }
            };
            
            // act
            float points = mainModel.TotalPoints();

            // assert
            points.Should().Be(130);
        }

        [Fact]
        public void should_calculate_points_of_trooper_with_musician()
        {
            // arrange
            var mainModel = new MainModel
            { 
                ArmyCategory = ArmyCategory.Trooper,
                Count = 10,
                Musician = true,
                SingleModels =
                { 
                    new SingleModel
                    {
                        Name = "Spearman",
                        Profile = new Profile { Points = 10 },
                        MountSave = 0,
                        Equipment = new Equipment
                        {
                            Slots =
                            {
                                new Slot { Item = new MeleeWeapon { Name = "Spear", Points = 1 } },
                                new Slot { Item = new Armor { Name = "light Armor", Points = 2 } },
                            }
                        }
                    }
                }
            };
            
            // act
            float points = mainModel.TotalPoints();

            // assert
            points.Should().Be(156);
        }

        [Fact]
        public void should_calculate_points_of_trooper_with_musician_and_magic_item()
        {
            // arrange
            var mainModel = new MainModel
            { 
                ArmyCategory = ArmyCategory.Trooper,
                Count = 10,
                Musician = true,
                SingleModels =
                { 
                    new SingleModel
                    {
                        Name = "Spearman",
                        Profile = new Profile { Points = 10 },
                        MountSave = 0,
                        Equipment = new Equipment
                        {
                            Slots =
                            {
                                new Slot { Item = new MeleeWeapon { Name = "Spear", Points = 1 } },
                                new Slot { Item = new Armor { Name = "light Armor", Points = 2 } },
                                new Slot { Item = new Instrument { Name = "Magic Horn", Points = 50, Magic = true} }
                            }
                        }
                    }
                }
            };
            
            // act
            float points = mainModel.TotalPoints();

            // assert
            points.Should().Be(206);
        }

        [Fact]
        public void should_calculate_points_of_trooper_on_mount()
        {
            // arrange
            var mainModel = new MainModel
            { 
                ArmyCategory = ArmyCategory.Trooper,
                Count = 10,
                SingleModels =
                { 
                    new SingleModel
                    {
                        Name = "Knight",
                        Profile = new Profile { Points = 10 },
                        MountSave = 1,
                        Equipment = new Equipment
                        {
                            Slots =
                            {
                                new Slot { Item = new MeleeWeapon { Name = "Lance", Points = 2 } },
                                new Slot { Item = new Armor { Name = "heavy Armor", Points = 3 } },
                                new Slot { Item = new Shield { Name = "Shield", Points = 1 } },
                            }
                        }
                    },
                    new SingleModel {
                        Name = "Horse",
                        Profile = new Profile { Points = 3}
                    }
                }
            };
            
            // act
            float points = mainModel.TotalPoints();

            // assert
            points.Should().Be(350);
        }

        [Fact]
        public void should_calculate_points_of_trooper_on_mount_with_musician()
        {
            // arrange
            var mainModel = new MainModel
            { 
                ArmyCategory = ArmyCategory.Trooper,
                Count = 10,
                Musician = true,
                SingleModels =
                { 
                    new SingleModel
                    {
                        Name = "Knight",
                        Profile = new Profile { Points = 10 },
                        MountSave = 1,
                        Equipment = new Equipment
                        {
                            Slots =
                            {
                                new Slot { Item = new MeleeWeapon { Name = "Lance", Points = 2 } },
                                new Slot { Item = new Armor { Name = "heavy Armor", Points = 3 } },
                                new Slot { Item = new Shield { Name = "Shield", Points = 1 } },
                            }
                        }
                    },
                    new SingleModel {
                        Name = "Horse",
                        Profile = new Profile { Points = 3}
                    }
                }
            };
            
            // act
            float points = mainModel.TotalPoints();

            // assert
            points.Should().Be(420);
        }

        [Fact]
        public void should_calculate_points_of_trooper_on_mount_with_musician_and_magic_item()
        {
            // arrange
            var mainModel = new MainModel
            { 
                ArmyCategory = ArmyCategory.Trooper,
                Count = 10,
                Musician = true,
                SingleModels =
                { 
                    new SingleModel
                    {
                        Name = "Knight",
                        Profile = new Profile { Points = 10 },
                        MountSave = 1,
                        Equipment = new Equipment
                        {
                            Slots =
                            {
                                new Slot { Item = new MeleeWeapon { Name = "Lance", Points = 2 } },
                                new Slot { Item = new Armor { Name = "heavy Armor", Points = 3 } },
                                new Slot { Item = new Shield { Name = "Shield", Points = 1 } },
                                new Slot { Item = new Instrument { Name = "Magic Horn", Points = 50, Magic = true} }
                            }
                        }
                    },
                    new SingleModel {
                        Name = "Horse",
                        Profile = new Profile { Points = 3}
                    }
                }
            };
            
            // act
            float points = mainModel.TotalPoints();

            // assert
            points.Should().Be(470);
        }

        [Fact]
        public void should_calculate_points_of_organ_cannon()
        {
            // arrange
            var mainModel = new MainModel
            { 
                ArmyCategory = ArmyCategory.WarMachine,
                SingleModels =
                { 
                    new SingleModel
                    {
                        Name = "Crew",
                        Count = 3,
                        Profile = new Profile { Points = 8 },
                        Equipment = new Equipment
                        {
                            Slots = { new Slot { Item = new Armor { Name = "light Armor", Points = 2 } },                           }
                        }
                    },
                    new SingleModel {
                        Name = "Cannon",
                        Profile = new Profile { Points = 40}
                    }
                }
            };
            
            // act
            float points = mainModel.TotalPoints();

            // assert
            points.Should().Be(70);
        }

        [Fact]
        public void should_calculate_points_of_repeating_bolt_thrower()
        {
            // arrange
            var mainModel = new MainModel
            { 
                ArmyCategory = ArmyCategory.WarMachine,
                SingleModels =
                { 
                    new SingleModel
                    {
                        Name = "Crew",
                        Count = 2,
                        Profile = new Profile { Points = 8 },
                        Equipment = new Equipment
                        {
                            Slots = { new Slot { Item = new Armor { Name = "light Armor", Points = 2 } },                           }
                        }
                    },
                    new SingleModel {
                        Name = "Bolt Thrower",
                        Profile = new Profile { Points = 80}
                    }
                }
            };
            
            // act
            float points = mainModel.TotalPoints();

            // assert
            points.Should().Be(100);
        }

        [Fact]
        public void should_calculate_points_of_tiranoc_chariot_with_two_elves()
        {
            // arrange
            var mainModel = new MainModel
            { 
                ArmyCategory = ArmyCategory.WarMachine,
                SingleModels =
                { 
                    new SingleModel
                    {
                        Name = "Crew",
                        Count = 2,
                        Profile = new Profile { Points = 10 },
                        Equipment = new Equipment
                        {
                            Slots =
                            { 
                                new Slot { Item = new RangedWeapon { Name = "Bow", Points = 2 } },          
                                new Slot { Item = new Armor { Name = "light Armor", Points = 2 } }
                            }
                        }
                    },
                    new SingleModel {
                        Name = "Chariot",
                        Profile = new Profile { Points = 50}
                    },
                    new SingleModel {
                        Name = "Horse",
                        Count = 2,
                        Profile = new Profile { Points = 3}
                    }
                }
            };
            
            // act
            float points = mainModel.TotalPoints();

            // assert
            points.Should().Be(84);
        }

        [Fact]
        public void should_calculate_points_of_monster_with_count_5()
        {
            // arrange
            var mainModel = new MainModel
            { 
                Count = 5,
                ArmyCategory = ArmyCategory.Monster,
                SingleModels =
                { 
                    new SingleModel
                    {
                        Name = "Harpy",
                        Profile = new Profile { Points = 25 },
                    }
                }
            };
            
            // act
            float points = mainModel.TotalPoints();

            // assert
            points.Should().Be(125);
        }

    }
}
