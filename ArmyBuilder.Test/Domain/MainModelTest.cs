using FluentAssertions;
using ArmyBuilder.Domain;

namespace ArmyBuilder.Test.Domain
{
    public class MainModelTest
    {

        [Fact]
        public void should_calculate_points_when_main_model_has_one_single_model()
        {
            // arrange
            SingleModel singleModel = new SingleModel { Profile = new Profile { Points = 10 } };
            singleModel.Equipment.Slots.Add(new Slot { Item = new Armor { Points = 20 } });
            singleModel.Equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 30 } });

            var model = new MainModel();
            model.SingleModels.Add(singleModel);

            // act
            float totalPoints = model.Points();

            // assert
            totalPoints.Should().Be(60);
        }

        [Fact]
        public void should_calculate_points_when_main_model_has_two_single_model()
        {
            // arrange
            SingleModel singleModel1 = new SingleModel { Profile = new Profile { Points = 10 } };
            singleModel1.Equipment.Slots.Add(new Slot { Item = new Armor { Points = 20 } });
            singleModel1.Equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 30 } });
            SingleModel singleModel2 = new SingleModel { Profile = new Profile { Points = 40 } };

            var model = new MainModel();
            model.SingleModels.Add(singleModel1);
            model.SingleModels.Add(singleModel2);

            // act
            float totalPoints = model.Points();

            // assert
            totalPoints.Should().Be(100);
        }

        [Fact]
        public void should_calculate_total_points_when_main_model_has_count_1()
        {
            // arrange
            SingleModel singleModel = new SingleModel{ Profile = new Profile { Points = 10 } };
            singleModel.Equipment.Slots.Add(new Slot { Item = new Armor { Points = 20 } });
            singleModel.Equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 30 } });

            var model = new MainModel() { Count = 1};
            model.SingleModels.Add(singleModel);

            // act
            float totalPoints = model.TotalPoints();

            // assert
            totalPoints.Should().Be(60);
        }

        [Fact]
        public void should_calculate_total_points_when_main_model_has_count_2()
        {
            // arrange
            SingleModel singleModel = new SingleModel { Profile = new Profile { Points = 10 } };
            singleModel.Equipment.Slots.Add(new Slot { Item = new Armor { Points = 20 } });
            singleModel.Equipment.Slots.Add(new Slot { Item = new MeleeWeapon { Points = 30 } });

            var model = new MainModel() { Count = 2 };
            model.SingleModels.Add(singleModel);

            // act
            float totalPoints = model.TotalPoints();

            // assert
            totalPoints.Should().Be(120);
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
