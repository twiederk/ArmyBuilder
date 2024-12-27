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

        [Fact]
        public void should_increase_count_by_1_when_called()
        {
            // arrange
            var model = new MainModel() { Count = 1 };

            // act
            model.IncreaseCount();

            // assert
            model.Count.Should().Be(2);
        }

        [Fact]
        public void should_decrease_count_by_1_when_called()
        {
            // arrange
            var model = new MainModel() { Count = 5 };

            // act
            model.DecreaseCount();

            // assert
            model.Count.Should().Be(4);
        }

        [Fact]
        public void should_stay_at_count_1_when_count_is_already_1()
        {
            // arrange
            var model = new MainModel() { Count = 1 };

            // act
            model.DecreaseCount();

            // assert
            model.Count.Should().Be(1);
        }
    }
}
