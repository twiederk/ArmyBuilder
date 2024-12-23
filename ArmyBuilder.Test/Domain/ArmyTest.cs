using FluentAssertions;
using ArmyBuilder.Domain;

namespace ArmyBuilder.Test.Domain
{
    public class ArmyTest
    {

        [Fact]
        public void should_create_army_with_name()
        {
            // act
            var army = new Army("Test Army");

            // assert
            army.Name.Should().Be("Test Army");

        }
    }
}
