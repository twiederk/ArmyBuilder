using FluentAssertions;
using ArmyBuilder.Domain;

namespace ArmyBuilder.Test.Domain
{
    public class SlotTest
    {
        [Fact]
        public void should_return_true_when_selectable_items_is_empty()
        {
            // arrange
            Slot slot = new Slot();

            // act
            var result = slot.IsAllItems();

            // assert
            result.Should().BeTrue();
        }

        [Fact]
        public void should_return_false_when_selectable_items_is_not_empty()
        {
            // arrange
            Slot slot = new Slot();
            slot.Selection = new List<Item>() { new Item() };

            // act
            var result = slot.IsAllItems();

            // assert
            result.Should().BeFalse();
        }
    }    
}