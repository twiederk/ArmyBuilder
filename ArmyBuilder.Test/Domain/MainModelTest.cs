using FluentAssertions;
using ArmyBuilder.Domain;
using System.Data.Entity.ModelConfiguration.Configuration;

namespace ArmyBuilder.Test.Domain
{
    public class MainModelTest
    {

        /*
        [Fact]
        public void should_calculate_points_when_main_model_has_one_single_model()
        {
            // arrange
            SingleModel singleModel = new SingleModel { Profile = new Profile { Points = 10 } };
            singleModel.Equipment.Slots.Add(new Slot { Item = new Armor { Points = 20 } });
            singleModel.Equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 30 } });

            var model = new MainModel();
            model.AddSingleModel(singleModel);

            // act
            float totalPoints = model.Points();

            // assert
            totalPoints.Should().Be(60);
        }

        [Fact]
        public void should_calculate_points_when_main_model_has_two_single_model()
        {
            // arrange
            SingleModel singleModel1 = new SingleModel { Profile = new Profile { Points = 10 } };
            singleModel1.Equipment.Slots.Add(new Slot { Item = new Armor { Points = 20 } });
            singleModel1.Equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 30 } });
            SingleModel singleModel2 = new SingleModel { Profile = new Profile { Points = 40 } };

            var model = new MainModel();
            model.AddSingleModel(singleModel1);
            model.AddSingleModel(singleModel2);

            // act
            float totalPoints = model.Points();

            // assert
            totalPoints.Should().Be(100);
        }

        [Fact]
        public void should_calculate_total_points_when_main_model_has_count_1()
        {
            // arrange
            SingleModel singleModel = new SingleModel { Profile = new Profile { Points = 10 } };
            singleModel.Equipment.Slots.Add(new Slot { Item = new Armor { Points = 20 } });
            singleModel.Equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 30 } });

            var model = new MainModel() { Count = 1 };
            model.AddSingleModel(singleModel);

            // act
            float totalPoints = model.TotalPoints();

            // assert
            totalPoints.Should().Be(60);
        }

        [Fact]
        public void should_calculate_total_points_when_main_model_has_count_2()
        {
            // arrange
            SingleModel singleModel = new SingleModel { Profile = new Profile { Points = 10 } };
            singleModel.Equipment.Slots.Add(new Slot { Item = new Armor { Points = 20 } });
            singleModel.Equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 30 } });

            var model = new MainModel() { Count = 2 };
            model.AddSingleModel(singleModel);

            // act
            float totalPoints = model.TotalPoints();

            // assert
            totalPoints.Should().Be(120);
        }

        [Fact]
        public void should_calculate_points_when_main_model_has_standard_bearer()
        {
            // arrange
            SingleModel singleModel = new SingleModel { Profile = new Profile { Points = 10 } };

            var mainModel = new MainModel() { Count = 10, StandardBearer = true };
            mainModel.AddSingleModel(singleModel);

            // act
            float totalPoints = mainModel.TotalPoints();

            // assert
            totalPoints.Should().Be(120);
        }

        [Fact]
        public void should_calculate_points_when_main_model_has_musician()
        {
            // arrange
            SingleModel singleModel = new SingleModel { Profile = new Profile { Points = 10 } };

            var mainModel = new MainModel() { Count = 10, Musician = true };
            mainModel.AddSingleModel(singleModel);

            // act
            float totalPoints = mainModel.TotalPoints();

            // assert
            totalPoints.Should().Be(120);
        }

        [Fact]
        public void should_calculate_points_when_main_model_has_standard_bearer_and_musician()
        {
            // arrange
            SingleModel singleModel = new SingleModel { Profile = new Profile { Points = 10 } };

            var mainModel = new MainModel() { Count = 10, StandardBearer = true, Musician = true };
            mainModel.AddSingleModel(singleModel);

            // act
            float totalPoints = mainModel.TotalPoints();

            // assert
            totalPoints.Should().Be(140);
        }

        [Fact]
        public void should_calculate_points_when_main_model_has_standard_bearer_with_magic_banner()
        {
            // arrange
            SingleModel singleModel = new SingleModel { Profile = new Profile { Points = 10 } };
            Slot slot = new Slot { Magic = true, Item = new MeleeWeapon { Points = 50, Magic = true } }; 
            singleModel.Equipment = new Equipment { Slots = { slot } };

            var mainModel = new MainModel() { Count = 10, StandardBearer = true, ArmyCategory = ArmyCategory.Trooper };
            mainModel.AddSingleModel(singleModel);

            // act
            float totalPoints = mainModel.TotalPoints();

            // assert
            totalPoints.Should().Be(170);
        }
        */

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
            var model = new MainModel { Uniquely = true };
            model.AddSingleModel(new SingleModel { Profile = new Profile { Id = 1, Points = 10 } });
            model.AddSingleModel(new SingleModel
            {
                Profile = new Profile { Id = 2, Points = 20 },
                StandardBearer = true,
                Musician = true,
                MovementType = MovementType.OnMount,
                Mount = true
            });

            // act
            var clone = model.Clone();

            // assert
            clone.Uniquely.Should().Be(true);

            clone.SingleModels.Should().HaveCount(2);
            clone.SingleModels[0].MainModel.Should().BeSameAs(clone);
            clone.SingleModels[0].Profile.Points.Should().Be(10);

            clone.SingleModels[1].MainModel.Should().BeSameAs(clone);
            clone.SingleModels[1].Profile.Id.Should().Be(2);
            clone.SingleModels[1].Profile.Points.Should().Be(20);
            clone.SingleModels[1].StandardBearer.Should().BeTrue();
            clone.SingleModels[1].Musician.Should().BeTrue();
            clone.SingleModels[1].MovementType.Should().Be(MovementType.OnMount);
            clone.SingleModels[1].Mount.Should().BeTrue();
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
            mainModel.AddMount(singleModel);

            // assert
            mainModel.SingleModels.Should().HaveCount(2);
            mainModel.SingleModels.Should().ContainSingle(sm => sm.Id == singleModel.Id && sm.Name == singleModel.Name);
        }

        [Fact]
        public void should_set_movement_type_to_on_mount_when_adding_mount_to_main_model()
        {
            // arrange
            var mainModel = new MainModel { SingleModels = { new SingleModel { Id = 1, Name = "Existing Single Model" } } };
            var singleModel = new SingleModel { Id = 2, Name = "Additional Single Model", Mount = true };

            // act
            mainModel.AddMount(singleModel);

            // assert
            mainModel.SingleModels.Should().HaveCount(2);
            mainModel.SingleModels.Should().ContainSingle(sm => sm.Id == singleModel.Id && sm.Name == singleModel.Name);
            mainModel.SingleModels[0].MovementType.Should().Be(MovementType.OnMount);
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
                        MovementType = MovementType.OnFoot,
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
                        MovementType = MovementType.OnMount,
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
                        MovementType = MovementType.OnFoot,
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
                        MovementType = MovementType.OnFoot,
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

    }
}
