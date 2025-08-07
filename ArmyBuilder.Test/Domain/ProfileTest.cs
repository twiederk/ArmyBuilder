using FluentAssertions;
using ArmyBuilder.Domain;

namespace ArmyBuilder.Test.Domain
{
    public class ProfileTest
    {

        [Fact]
        public void should_clone_profile()
        {
            // arrange
            Profile profile = new Profile
            {
                Id = 1,
                Movement = 2,
                WeaponSkill = 3,
                BallisticSkill = 4,
                Strength = 5,
                Toughness = 6,
                Wounds = 7,
                Initiative = 8,
                Attacks = 9,
                Moral = 10,
                Save = 11,
                Points = 12,
            };

            // act
            Profile clonedProfile = profile.Clone();

            // assert
            clonedProfile.Id.Should().Be(1);
            clonedProfile.Movement.Should().Be(2);
            clonedProfile.WeaponSkill.Should().Be(3);
            clonedProfile.BallisticSkill.Should().Be(4);
            clonedProfile.Strength.Should().Be(5);
            clonedProfile.Toughness.Should().Be(6);
            clonedProfile.Wounds.Should().Be(7);
            clonedProfile.Initiative.Should().Be(8);
            clonedProfile.Attacks.Should().Be(9);
            clonedProfile.Moral.Should().Be(10);
            clonedProfile.Save.Should().Be(11);
            clonedProfile.Points.Should().Be(12);
        }
    }
}

