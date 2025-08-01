using ArmyBuilder.Domain;
using FluentAssertions;

namespace ArmyBuilder.Test.Domain
{
    public class MeleeWeaponTest
    {

        [Fact]
        public void should_return_display_strength_when_two_handed_weapon_is_used()
        {
            // arrange
            MeleeWeapon twoHandedweapon = new MeleeWeapon() { Id = Item.ID_TWO_HANDED_WEAPON, Strength = 2 };

            // act
            string displayStrength = twoHandedweapon.DisplayStrength(3);

            // assert
            displayStrength.Should().Be("5");
        }

        [Fact]
        public void should_return_display_initiative_when_two_handed_weapon_is_used()
        {
            // arrange
            MeleeWeapon twoHandedweapon = new MeleeWeapon() { Id = Item.ID_TWO_HANDED_WEAPON, Strength = 2 };

            // act
            string displayStrength = twoHandedweapon.DisplayInitiative(3);

            // assert
            displayStrength.Should().Be("*3*");
        }

        [Fact]
        public void should_return_display_strength_when_lance_is_used_on_mount()
        {
            // arrange
            MeleeWeapon lance = new MeleeWeapon() { Id = Item.ID_LANCE, Strength = 2 };

            // act
            string displayStrength = lance.DisplayStrength(3, true);

            // assert
            displayStrength.Should().Be("5/3");
        }

        [Fact]
        public void should_return_display_strength_when_lance_is_used_on_foot()
        {
            // arrange
            MeleeWeapon lance = new MeleeWeapon() { Id = Item.ID_LANCE, Strength = 2 };

            // act
            string displayStrength = lance.DisplayStrength(3, false);

            // assert
            displayStrength.Should().Be("3");
        }

        [Fact]
        public void should_return_second_attack_when_second_weapon_is_used()
        {
            // arrange
            MeleeWeapon secondHandWeapon = new MeleeWeapon() { Id = Item.ID_SECOND_HAND_WEAPON };

            // act
            string displayAttacks = secondHandWeapon.DisplayAttacks(1);

            // assert
            displayAttacks.Should().Be("1+1");
        }

        [Fact]
        public void should_return_attack_when_no_second_weapon_is_used()
        {
            // arrange
            MeleeWeapon secondHandWeapon = new MeleeWeapon() { Id = Item.ID_HAND_WEAPON };

            // act
            string displayAttacks = secondHandWeapon.DisplayAttacks(1);

            // assert
            displayAttacks.Should().Be("1");
        }

    }
}
