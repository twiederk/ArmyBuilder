using FluentAssertions;
using ArmyBuilder.Domain;

namespace ArmyBuilder.Test.Domain
{
    public class UnitTest
    {
        [Fact]
        public void should_create_unit_when_name_is_given()
        {
            // act
            var unit = new Unit("Test Unit");

            // assert
            unit.Name.Should().Be("Test Unit");

        }

        [Fact]
        public void should_calculate_points_of_unit_when_one_main_model_with_count_1_is_given()
        {
            // arrange
            var unit = new Unit("Test Unit");
            unit.MainModels.Add(new MainModel() { OldPoints = 75, Count = 1 });

            // act
            var points = unit.TotalPoints();

            // assert
            points.Should().Be(75);
        }

        [Fact]
        public void should_calculate_points_of_unit_when_one_main_model_with_count_2_is_given()
        {
            // arrange
            var unit = new Unit("Test Unit");
            unit.MainModels.Add(new MainModel() { OldPoints = 75, Count = 2 });

            // act
            var points = unit.TotalPoints();

            // assert
            points.Should().Be(150);
        }

        [Fact]
        public void should_calculate_points_of_unit_when_two_main_model_with_count_2_is_given()
        {
            // arrange
            var unit = new Unit("Test Unit");
            unit.MainModels.Add(new MainModel() { OldPoints = 75, Count = 2 });
            unit.MainModels.Add(new MainModel() { OldPoints = 10, Count = 3 });

            // act
            var points = unit.TotalPoints();

            // assert
            points.Should().Be(180);
        }

        [Fact]
        public void should_create_main_model_count_when_main_model_is_given()
        {
            // arrange
            var unit = new Unit("Test Unit");
            var mainModel = new MainModel() { OldPoints = 75 };

            // act
            unit.AddMainModel(mainModel);

            // assert
            unit.MainModels.Should().Contain(mainModel);
        }
    }
}
