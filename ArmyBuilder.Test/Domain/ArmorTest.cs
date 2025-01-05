using ArmyBuilder.Domain;
using FluentAssertions;

namespace ArmyBuilder.Test.Domain
{
    public class ArmorTest
    {

        [Fact]
        public void should_create_armor_with_name()
        {
            // act
            Armor armor = new Armor() { Id = 1, Name = "Test Armor" };

            // assert
            armor.Id.Should().Be(1);
            armor.Name.Should().Be("Test Army");
        }

    }
}
