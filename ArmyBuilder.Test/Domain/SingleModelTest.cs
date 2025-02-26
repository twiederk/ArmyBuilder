using ArmyBuilder.Domain;
using FluentAssertions;
using Xunit;

namespace ArmyBuilder.Test.Domain
{
    public class SingleModelTest
    {
        [Fact]
        public void should_return_hyphen_when_save_is_higher_than_six()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Save = 7 }  };

            // act
            string save = singleModel.Save;

            // assert
            save.Should().Be("-");
        }

        [Fact]
        public void should_return_6_when_save_is_six()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Save = 6 }  };

            // act
            string save = singleModel.Save;

            // assert
            save.Should().Be("6");
        }

        [Fact]
        public void should_return_save_with_plus_when_save_is_lower_than_six()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Save = 5 }  };

            // act
            string save = singleModel.Save;

            // assert
            save.Should().Be("5+");
        }

        [Fact]
        public void should_return_save_6_when_wearing_light_armor()
        {
            // arrange
            var lightArmor = new Armor { Id = 1, Name = "Light Armor", Save = 1 };
            var slot = new Slot { Id = 1, Item = lightArmor };
            var equipment = new Equipment();
            equipment.Slots.Add(slot);
            var singleModel = new SingleModel { Profile = new Profile { Save = 7 }, Equipment = equipment };

            // act
            string save = singleModel.Save;

            // assert
            save.Should().Be("6");
        }

        [Fact]
        public void should_return_save_5_when_wearing_light_armor_and_shield()
        {
            // arrange
            var lightArmorSlot = new Slot { Item = new Armor { Name = "Light Armor", Save = 1 } };
            var shieldSlot = new Slot {  Item = new Shield { Name = "Shield", Save = 1 } };
            var equipment = new Equipment();
            equipment.Slots.Add(lightArmorSlot);
            equipment.Slots.Add(shieldSlot);
            var singleModel = new SingleModel { Profile = new Profile { Save = 7 }, Equipment = equipment };

            // act
            string save = singleModel.Save;

            // assert
            save.Should().Be("5+");
        }

        [Fact]
        public void should_return_save_5_when_mount_status_is_riding()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Save = 7 }, MovementType = MovementType.OnMount };

            // act
            string save = singleModel.Save;

            // assert
            save.Should().Be("6");
        }

        /*
        [Fact]
        public void should_return_points_of_profile_when_single_model_has_no_equipment()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Points = 100 }, MainModel = new MainModel { ArmyCategory = ArmyCategory.Trooper } };

            // act
            float totalPoints = singleModel.TotalPoints();

            // assert
            totalPoints.Should().Be(100);
        }

        [Fact]
        public void should_return_points_of_profile_when_single_model_has_equipment()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Points = 100 }, MainModel = new MainModel { ArmyCategory = ArmyCategory.Trooper } };
            var equipment = new Equipment();
            equipment.Slots.Add(new Slot { Item = new Armor { Points = 10 } });
            equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 20 } });
            singleModel.Equipment = equipment;

            // act
            float totalPoints = singleModel.TotalPoints();

            // assert
            totalPoints.Should().Be(130);
        }

        [Fact]
        public void should_calculate_points_singel_model_when_single_model_is_rider()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Points = 10 }, MainModel = new MainModel { ArmyCategory = ArmyCategory.Trooper } };
            var equipment = new Equipment();
            equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 1 } });
            equipment.Slots.Add(new Slot { Item = new Armor { Points = 2 } });
            singleModel.Equipment = equipment;
            singleModel.MovementType = MovementType.OnMount;

            // act
            float totalPoints = singleModel.TotalPoints();

            // assert
            totalPoints.Should().Be(26);
        }

        [Fact]
        public void should_calculate_points_singel_model_when_single_model_is_rider_with_magic_item()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Points = 10 }, MainModel = new MainModel { ArmyCategory = ArmyCategory.Trooper } };
            singleModel.MovementType = MovementType.OnMount;

            var equipment = new Equipment();
            equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 1 } });
            equipment.Slots.Add(new Slot { Item = new Misc { Points = 50, Magic = true } });
            equipment.Slots.Add(new Slot { Item = new Armor { Points = 2 } });
            singleModel.Equipment = equipment;

            // act
            float totalPoints = singleModel.TotalPoints();

            // assert
            totalPoints.Should().Be(76);
        }

        [Fact]
        public void should_calculate_points_singel_model_when_single_model_is_standard_bearer()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Points = 10 }, MainModel = new MainModel { ArmyCategory = ArmyCategory.Trooper } };
            singleModel.StandardBearer = true;

            var equipment = new Equipment();
            equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 1 } });
            equipment.Slots.Add(new Slot { Item = new Armor { Points = 2 } });
            singleModel.Equipment = equipment;

            // act
            float totalPoints = singleModel.TotalPoints();

            // assert
            totalPoints.Should().Be(26);
        }

        [Fact]
        public void should_calculate_points_singel_model_when_single_model_is_musician()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Points = 10 }, MainModel = new MainModel { ArmyCategory = ArmyCategory.Trooper } };
            singleModel.Musician = true;

            var equipment = new Equipment();
            equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 1 } });
            equipment.Slots.Add(new Slot { Item = new Armor { Points = 2 } });
            singleModel.Equipment = equipment;

            // act
            float totalPoints = singleModel.TotalPoints();

            // assert
            totalPoints.Should().Be(26);
        }

        [Fact]
        public void should_calculate_points_singel_model_when_single_model_is_musician_with_magic_item()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Points = 10 }, MainModel = new MainModel { ArmyCategory = ArmyCategory.Trooper } };
            singleModel.Musician = true;

            var equipment = new Equipment();
            equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 1 } });
            equipment.Slots.Add(new Slot { Item = new Misc { Points = 50, Magic = true } }); 
            equipment.Slots.Add(new Slot { Item = new Armor { Points = 2 } });
            singleModel.Equipment = equipment;

            // act
            float totalPoints = singleModel.TotalPoints();

            // assert
            totalPoints.Should().Be(76);
        }

        
        [Fact]
        public void should_calculate_points_singel_model_when_single_model_is_rider_and_standard_bearer()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Points = 10 }, MainModel = new MainModel { ArmyCategory = ArmyCategory.Trooper } };
            singleModel.MovementType = MovementType.OnMount;

            var equipment = new Equipment();
            equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 1 } });
            equipment.Slots.Add(new Slot { Item = new Armor { Points = 2 } });
            singleModel.Equipment = equipment;
            singleModel.StandardBearer = true;

            // act
            float totalPoints = singleModel.TotalPoints();

            // assert
            totalPoints.Should().Be(52);
        }
        
        [Fact]
        public void should_calculate_points_singel_model_when_single_model_is_rider_and_standard_bearer_with_magic_item()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Points = 10 }, MainModel = new MainModel { ArmyCategory = ArmyCategory.Trooper } };
            singleModel.MovementType = MovementType.OnMount;

            var equipment = new Equipment();
            equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 1 } });
            equipment.Slots.Add(new Slot { Item = new Misc { Points = 50, Magic = true } });
            equipment.Slots.Add(new Slot { Item = new Armor { Points = 2 } });
            singleModel.Equipment = equipment;
            singleModel.StandardBearer = true;

            // act
            float totalPoints = singleModel.TotalPoints();

            // assert
            totalPoints.Should().Be(102);
        }

        [Fact]
        public void should_calculate_points_single_model_when_main_model_is_character()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Points = 100 }, MainModel = new MainModel { ArmyCategory = ArmyCategory.Character } };
            var equipment = new Equipment();
            equipment.Slots.Add(new Slot { Item = new Armor { Points = 10 } });
            equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 20 } });
            singleModel.Equipment = equipment;

            // act
            float totalPoints = singleModel.TotalPoints();

            // assert
            totalPoints.Should().Be(130);
        }
        */

        [Fact]
        public void should_sum_points_of_profile_and_non_magic_equipment_when_on_foot()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Points = 10 } };
            singleModel.MovementType = MovementType.OnFoot;

            var equipment = new Equipment();
            equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 1 } });
            equipment.Slots.Add(new Slot { Item = new Misc { Points = 50, Magic = true } });
            equipment.Slots.Add(new Slot { Item = new Armor { Points = 2 } });
            singleModel.Equipment = equipment;            

            // act
            float points = singleModel.BasePoints();

            // assert
            points.Should().Be(13);
        }

        [Fact]
        public void should_sum_points_of_profile_and_non_magic_equipment_when_on_mount()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Points = 10 } };
            singleModel.MovementType = MovementType.OnMount;

            var equipment = new Equipment();
            equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 1 } });
            equipment.Slots.Add(new Slot { Item = new Misc { Points = 50, Magic = true } });
            equipment.Slots.Add(new Slot { Item = new Armor { Points = 2 } });
            singleModel.Equipment = equipment;            

            // act
            float points = singleModel.BasePoints();

            // assert
            points.Should().Be(26);
        }

        [Fact]
        public void should_sum_points_of_magic_items()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Points = 10 } };
            singleModel.MovementType = MovementType.OnFoot;

            var equipment = new Equipment();
            equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 1 } });
            equipment.Slots.Add(new Slot { Item = new Misc { Points = 50, Magic = true } });
            equipment.Slots.Add(new Slot { Item = new Armor { Points = 2 } });
            singleModel.Equipment = equipment;            

            // act
            float points = singleModel.MagicPoints();

            // assert
            points.Should().Be(50);
        }
    }
}




