using ArmyBuilder.Domain;
using FluentAssertions;
using Xunit;

namespace ArmyBuilder.Test.Domain
{
    public class SingleModelTest
    {
        [Fact]
        public void should_return_hyphen_when_save_is_higher_than_six()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Save = 7 }  };

            // act
            string save = singleModel.Save;

            // assert
            save.Should().Be("-");
        }

        [Fact]
        public void should_return_6_when_save_is_six()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Save = 6 }  };

            // act
            string save = singleModel.Save;

            // assert
            save.Should().Be("6");
        }

        [Fact]
        public void should_return_save_with_plus_when_save_is_lower_than_six()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Save = 5 }  };

            // act
            string save = singleModel.Save;

            // assert
            save.Should().Be("5+");
        }

    }
}




