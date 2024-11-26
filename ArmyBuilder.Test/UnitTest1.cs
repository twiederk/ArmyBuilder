using FluentAssertions;

namespace ArmyBuilder.Test
{
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            bool isTrue = true;
            isTrue.Should().BeTrue();
        }
    }
}