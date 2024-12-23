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
            unit1.MainModels.Add(new MainModelCount(3, new MainModel() { Points = 75 }));
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
            unit1.MainModels.Add(new MainModelCount(3, new MainModel() { Points = 75 }));
            Unit unit2 = new Unit("Unit2");
            unit1.MainModels.Add(new MainModelCount(4, new MainModel() { Points = 10 }));
            Army army = new Army("Army1");
            army.Units.Add(unit1);


            // act
            var points = army.Points();

            // assert
            points.Should().Be(265);
        }

    }
}
