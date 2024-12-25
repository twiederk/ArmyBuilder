using FluentAssertions;
using ArmyBuilder.Domain;
using System.Xaml.Schema;

namespace ArmyBuilder.Test.Domain
{
    public class MainModelTest
    {
        [Fact]
        public void should_calculate_total_points_when_main_model_has_count_1()
        {
            // arrange
            var model = new MainModel() { Points = 30, Count = 1};

            // act
            float totalPoints = model.TotalPoints();

            // assert
            totalPoints.Should().Be(30);
        }

        [Fact]
        public void should_calculate_total_points_when_main_model_has_count_2()
        {
            // arrange
            var model = new MainModel() { Points = 30, Count = 2};

            // act
            float totalPoints = model.TotalPoints();

            // assert
            totalPoints.Should().Be(60);
        }
    }
}
