using FluentAssertions;
using ArmyBuilder.Domain;

namespace ArmyBuilder.Test.Domain
{
    public class UnitTest
    {
        [Fact]
        public void should_create_unit_with_name()
        {
            // act
            var unit = new Unit("Test Unit");

            // assert
            unit.Name.Should().Be("Test Unit");

        }

        [Fact]
        public void should_calculate_points_of_unit()
        {
            // arrange
            var unit = new Unit("Test Unit");

            // act
            var points = unit.Points();

            // assert
            points.Should().Be(75);
        }
    }
}
