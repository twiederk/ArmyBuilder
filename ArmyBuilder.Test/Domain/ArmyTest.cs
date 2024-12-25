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

        [Fact]
        public void should_calculate_points_of_when_army_has_0_units()
        {
            // arrange
            var army = new Army("Test Army");

            // act
            var points = army.Points();

            // assert
            points.Should().Be(0);
        }

        [Fact]
        public void should_calculate_points_of_when_army_has_1_unit()
        {
            // arrange
            Unit unit1 = new Unit("Unit1");
            unit1.MainModels.Add(new MainModel() { Points = 75, Count = 3 });
            Army army = new Army("Army1");
            army.Units.Add(unit1);


            // act
            var points = army.Points();

            // assert
            points.Should().Be(225);
        }

        [Fact]
        public void should_calculate_points_of_when_army_has_2_units()
        {
            // arrange
            Unit unit1 = new Unit("Unit1");
            unit1.MainModels.Add(new MainModel() { Points = 75, Count = 3 });
            Unit unit2 = new Unit("Unit2");
            unit1.MainModels.Add(new MainModel() { Points = 10, Count = 4 });
            Army army = new Army("Army1");
            army.Units.Add(unit1);


            // act
            var points = army.Points();

            // assert
            points.Should().Be(265);
        }

        [Fact]
        public void should_create_unit_to_army_when_unit_is_given()
        {
            // arrange
            var army = new Army("Test Army");
            var mainModel = new MainModel() { Name = "Test MainModel" };

            // act
            army.CreateUnit(mainModel);

            // assert
            army.Units.Count.Should().Be(1);
            army.Units[0].MainModels.Count.Should().Be(1);
            army.Units[0].MainModels[0].Name.Should().Be("Test MainModel");
        }

    }
}
