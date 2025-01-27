using ArmyBuilder.Domain;
using FluentAssertions;
using Xunit;

namespace ArmyBuilder.Test.Domain
{
    public class EquipmentTest
    {
        [Fact]
        public void should_return_name_of_items_when_points_are_greater_than_zero()
        {
            // arrange
            Slot slot1 = new Slot() { Id = 1, Item = new Item { Id = 1, Name = "Sword", Points = 10 } };
            Slot slot2 = new Slot() { Id = 2, Item = new Item { Id = 2, Name = "Shield", Points = 0 } };
            Slot slot3 = new Slot() { Id = 3, Item = new Item { Id = 3, Name = "Armor", Points = 5 } };
            Equipment equipment = new Equipment();
            equipment.Slots.Add(slot1);
            equipment.Slots.Add(slot2);
            equipment.Slots.Add(slot3);

            // act
            var result = equipment.ItemNames();

            // assert
            result.Should().Contain(new List<string> { "Sword (10)", "Armor (5)" });
            result.Should().NotContain("Shield");
        }
    }
}


