using ArmyBuilder.Domain;
using FluentAssertions;
using Xunit;

namespace ArmyBuilder.Test.Domain
{
    public class SingleModelTest
    {
        [Fact]
        public void should_save_single_model()
        {
            // arrange
            var singleModel = new SingleModel { Profile = new Profile { Save = 7 }  };

            // act
            string save = singleModel.Save;

            // assert
            save.Should().Be("7");
        }

    }
}




