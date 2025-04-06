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

        [Fact]
        public void should_sum_points_of_profile_and_non_magic_equipment()
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

        [Fact]
        public void should_return_name_with_profile_points()
        {
            // arrange
            var singleModel = new SingleModel { Name = "Warrior", Profile = new Profile { Points = 10 } };

            // act
            String displayName = singleModel.DisplayName;

            // assert
            displayName.Should().Be("Warrior (10)");
        }

        [Fact]
        public void shoud_return_display_strength_when_carring_two_handed_weapon()
        {
            // arrange
            MeleeWeapon twoHandedWeapon = new MeleeWeapon { Id = Item.ID_TWO_HANDED_WEAPON, Strength = 2 };
            var singleModel = new SingleModel
            {
                Profile = new Profile { Strength = 3 },
                Equipment = new Equipment { Slots = { new Slot { Item = twoHandedWeapon } } },
            };

            // act
            string displayStrength = singleModel.Strength;

            // assert
            displayStrength.Should().Be("5");
        }

        [Fact]
        public void shoud_return_display_initiative_when_carring_two_handed_weapon()
        {
            // arrange
            MeleeWeapon twoHandedWeapon = new MeleeWeapon { Id = Item.ID_TWO_HANDED_WEAPON, Strength = 2 };
            var singleModel = new SingleModel
            {
                Profile = new Profile { Initiative = 4 },
                Equipment = new Equipment { Slots = { new Slot { Item = twoHandedWeapon } } },
            };

            // act
            string displayInitiative = singleModel.Initiative;

            // assert
            displayInitiative.Should().Be("*4*");
        }

        [Fact]
        public void shoud_return_display_strength_when_carring_no_melee_weapon()
        {
            // arrange
            var singleModel = new SingleModel
            {
                Profile = new Profile { Strength = 3 },
            };

            // act
            string displayStrength = singleModel.Strength;

            // assert
            displayStrength.Should().Be("3");
        }

        [Fact]
        public void shoud_return_display_strength_when_carring_lance_on_mount()
        {
            // arrange
            MeleeWeapon lance = new MeleeWeapon { Id = Item.ID_LANCE, Strength = 2 };
            var singleModel = new SingleModel
            {
                Profile = new Profile { Strength = 3 },
                Equipment = new Equipment { Slots = { new Slot { Item = lance } } },
                MovementType = MovementType.OnMount
            };

            // act
            string displayStrength = singleModel.Strength;

            // assert
            displayStrength.Should().Be("5/3");
        }

        [Fact]
        public void should_return_additional_attack_when_carring_second_weapon()
        {
            // arrange
            MeleeWeapon secondHandWeapon = new MeleeWeapon { Id = Item.ID_SECOND_HAND_WEAPON };
            var singleModel = new SingleModel
            {
                Profile = new Profile { Attacks = 1 },
                Equipment = new Equipment { Slots = { new Slot { Item = secondHandWeapon } } },
            };

            // act
            string displayAttacks = singleModel.Attacks;

            // assert
            displayAttacks.Should().Be("1+1");
        }

        [Fact]
        public void shoud_return_dash_when_attack_is_zero_and_melee_weapon_carried()
        {
            // arrange
            MeleeWeapon handWeapon = new MeleeWeapon { Id = Item.ID_HAND_WEAPON };
            var singleModel = new SingleModel
            {
                Profile = new Profile { Attacks = 0 },
            };

            // act
            string displayAttacks = singleModel.Attacks;

            // assert
            displayAttacks.Should().Be("-");
        }

        [Fact]
        public void should_return_additional_attack_when_carring_pistol()
        {
            // arrange
            MeleeWeapon handWeapon = new MeleeWeapon { Id = Item.ID_HAND_WEAPON };
            RangedWeapon pistol = new RangedWeapon { Id = Item.ID_PISTOL };
            var singleModel = new SingleModel
            {
                Profile = new Profile { Attacks = 1 },
                Equipment = new Equipment { Slots = { new Slot { Item = pistol }, new Slot { Item = handWeapon } } },
            };

            // act
            string displayAttacks = singleModel.Attacks;

            // assert
            displayAttacks.Should().Be("1+1");
        }

    }
}




