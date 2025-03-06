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
            displayStrength.Should().Be("*5*");
        }

        [Fact]
        public void should_return_display_strength_when_lance_is_used_on_mount()
        {
            // arrange
            MeleeWeapon lance = new MeleeWeapon() { Id = Item.ID_LANCE, Strength = 2 };

            // act
            string displayStrength = lance.DisplayStrength(3, MovementType.OnMount);

            // assert
            displayStrength.Should().Be("5/3");
        }

        [Fact]
        public void should_return_display_strength_when_lance_is_used_on_foot()
        {
            // arrange
            MeleeWeapon lance = new MeleeWeapon() { Id = Item.ID_LANCE, Strength = 2 };

            // act
            string displayStrength = lance.DisplayStrength(3, MovementType.OnFoot);

            // assert
            displayStrength.Should().Be("3");
        }

    }
}
