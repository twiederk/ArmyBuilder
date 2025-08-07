using ArmyBuilder.Domain;
using FluentAssertions;

namespace ArmyBuilder.Test.Domain
{
    public class MountModelTest
    {
        [Fact]
        public void should_create_single_model_with_mount_save_zero()
        {
            // arrange
            var mountModel = new MountModel { 
                Id = 1,
                Name = "Mount",
                Profile = new Profile {
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
                },
                MountSave = 2
            };

            // act
            SingleModel singleModel = mountModel.ToSingleModel();

            // assert
            singleModel.Name.Should().Be("Mount");
            singleModel.Profile.Id.Should().Be(1);
            singleModel.Profile.Movement.Should().Be(2);
            singleModel.Profile.WeaponSkill.Should().Be(3);
            singleModel.Profile.BallisticSkill.Should().Be(4);
            singleModel.Profile.Strength.Should().Be(5);
            singleModel.Profile.Toughness.Should().Be(6);
            singleModel.Profile.Wounds.Should().Be(7);
            singleModel.Profile.Initiative.Should().Be(8);
            singleModel.Profile.Attacks.Should().Be(9);
            singleModel.Profile.Moral.Should().Be(10);
            singleModel.Profile.Save.Should().Be(11);
            singleModel.Profile.Points.Should().Be(12);
            singleModel.MountSave.Should().Be(0);
        }
    }

}
