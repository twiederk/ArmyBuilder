﻿using FluentAssertions;
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
            var points = army.TotalPoints();

            // assert
            points.Should().Be(0);
        }

        [Fact]
        public void should_calculate_points_of_when_army_has_1_unit()
        {
            // arrange
            Unit unit1 = new Unit("Unit1");
            SingleModel singleModel = new SingleModel { Profile = new Profile { Points = 75 } };
            MainModel mainModel = new MainModel { Count = 3 };
            mainModel.AddSingleModel(singleModel);
            unit1.MainModels.Add(mainModel);
            Army army = new Army("Army1");
            army.Units.Add(unit1);


            // act
            var points = army.TotalPoints();

            // assert
            points.Should().Be(225);
        }

        [Fact]
        public void should_calculate_points_of_when_army_has_2_units()
        {
            // arrange
            SingleModel singleModel1 = new SingleModel { Profile = new Profile { Points = 75 } };
            MainModel mainModel1 = new MainModel { Count = 3 };
            mainModel1.AddSingleModel(singleModel1);

            SingleModel singleModel2 = new SingleModel { Profile = new Profile { Points = 10 } };
            MainModel mainModel2 = new MainModel {  Count = 4 };
            mainModel2.AddSingleModel(singleModel2);

            Unit unit1 = new Unit { Name = "Unit1", MainModels = { mainModel1 } };
            Unit unit2 = new Unit { Name = "Unit2", MainModels = { mainModel2 } };
            Army army = new Army { Name = "Army1", Units = { unit1, unit2 } };

            // act
            var points = army.TotalPoints();

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

        [Fact]
        public void should_create_points_by_army_category()
        {
            // arrange
            var army = new ArmyExample1();

            // act
            ArmyCategoryPoints armyCategoryPoints = army.ArmyCategoryPoints();

            // assert
            armyCategoryPoints.Character.Should().Be(160);
            armyCategoryPoints.Trooper.Should().Be(240);
            armyCategoryPoints.WarMachine.Should().Be(100);
            armyCategoryPoints.Monster.Should().Be(0);
            armyCategoryPoints.Total.Should().Be(500);
        }

    }
}
