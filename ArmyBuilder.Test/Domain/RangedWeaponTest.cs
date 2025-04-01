using ArmyBuilder.Domain;
using FluentAssertions;

namespace ArmyBuilder.Test.Domain
{
    public class RangedWeaponTest
    {

        [Fact]
        public void should_return_second_attack_when_pistol_is_used()
        {
            // arrange
            RangedWeapon pistol = new RangedWeapon() { Id = Item.ID_PISTOL };

            // act
            string displayAttacks = pistol.DisplayAttacks(1);

            // assert
            displayAttacks.Should().Be("1+1");
        }


    }
}