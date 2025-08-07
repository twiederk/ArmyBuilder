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

        [Fact]
        public void should_return_true_when_slots_are_empty()
        {
            // arrange
            Equipment equipment = new Equipment();

            // act
            var result = equipment.IsEmpty();

            // assert
            result.Should().BeTrue();
        }

        [Fact]
        public void should_return_false_when_slots_are_not_empty()
        {
            // arrange
            Equipment equipment = new Equipment();
            Slot slot = new Slot() { Id = 1, Item = new Item { Id = 1, Name = "Sword", Points = 10 } };
            equipment.Slots.Add(slot);

            // act
            var result = equipment.IsEmpty();

            // assert
            result.Should().BeFalse();
        }

        [Fact]
        public void should_return_armor_items()
        {
            // arrange
            Slot slot1 = new Slot() { Id = 1, Item = new Armor { Id = 1, Name = "Plate Armor" } };
            Slot slot2 = new Slot() { Id = 2, Item = new Item { Id = 2, Name = "Sword" } };
            Slot slot3 = new Slot() { Id = 3, Item = new Armor { Id = 3, Name = "Chainmail" } };
            Equipment equipment = new Equipment();
            equipment.Slots.Add(slot1);
            equipment.Slots.Add(slot2);
            equipment.Slots.Add(slot3);

            // act
            var result = equipment.Armor();

            // assert
            result.Should().HaveCount(2);
            result.Should().Contain(a => a.Name == "Plate Armor");
            result.Should().Contain(a => a.Name == "Chainmail");
        }

        [Fact]
        public void should_return_empty_list_when_equipent_contains_no_armor()
        {
            // arrange
            Slot slot = new Slot() { Id = 1, Item = new Item { Id = 1, Name = "Sword" } };
            Equipment equipment = new Equipment();
            equipment.Slots.Add(slot);

            // act
            var result = equipment.Armor();

            // assert
            result.Should().BeEmpty();
        }

        [Fact]
        public void should_return_shield_items()
        {
            // arrange
            Slot slot1 = new Slot() { Id = 1, Item = new Armor { Id = 1, Name = "Plate Armor" } };
            Slot slot2 = new Slot() { Id = 2, Item = new Shield { Id = 2, Name = "Shield" } };
            Slot slot3 = new Slot() { Id = 3, Item = new Item { Id = 3, Name = "Sword" } };
            Equipment equipment = new Equipment();
            equipment.Slots.Add(slot1);
            equipment.Slots.Add(slot2);
            equipment.Slots.Add(slot3);

            // act
            var result = equipment.Shield();

            // assert
            result.Should().HaveCount(1);
            result.Should().Contain(i => i.Name == "Shield");
        }

        [Fact]
        public void should_sum_points_of_all_items()
        {
            // arrange
            Slot slot1 = new Slot() { Id = 1, Item = new Item { Id = 1, Name = "Sword", Points = 10, Magic = false } };
            Slot slot2 = new Slot() { Id = 2, Item = new Item { Id = 2, Name = "Shield", Points = 50, Magic = true } };
            Slot slot3 = new Slot() { Id = 3, Item = new Item { Id = 3, Name = "Armor", Points = 15, Magic = false } };
            Equipment equipment = new Equipment();
            equipment.Slots.Add(slot1);
            equipment.Slots.Add(slot2);
            equipment.Slots.Add(slot3);

            // act
            var result = equipment.ItemsPoints();

            // assert
            result.Should().Be(75);
        }



        [Fact]
        public void should_sum_points_of_non_magic_items()
        {
            // arrange
            Slot slot1 = new Slot() { Id = 1, Item = new Item { Id = 1, Name = "Sword", Points = 10, Magic = false } };
            Slot slot2 = new Slot() { Id = 2, Item = new Item { Id = 2, Name = "Shield", Points = 50, Magic = true } };
            Slot slot3 = new Slot() { Id = 3, Item = new Item { Id = 3, Name = "Armor", Points = 15, Magic = false } };
            Equipment equipment = new Equipment();
            equipment.Slots.Add(slot1);
            equipment.Slots.Add(slot2);
            equipment.Slots.Add(slot3);

            // act
            var result = equipment.NonMagicItemsPoints();

            // assert
            result.Should().Be(25);
        }

        [Fact]
        public void should_sum_points_of_magic_items()
        {
            // arrange
            Slot slot1 = new Slot() { Id = 1, Item = new Item { Id = 1, Name = "Sword", Points = 10, Magic = false } };
            Slot slot2 = new Slot() { Id = 2, Item = new Item { Id = 2, Name = "Shield", Points = 50, Magic = true } };
            Slot slot3 = new Slot() { Id = 3, Item = new Item { Id = 3, Name = "Armor", Points = 15, Magic = false } };
            Equipment equipment = new Equipment();
            equipment.Slots.Add(slot1);
            equipment.Slots.Add(slot2);
            equipment.Slots.Add(slot3);

            // act
            var result = equipment.MagicItemsPoints();

            // assert
            result.Should().Be(50);
        }

        [Fact]
        public void should_return_melee_weapon_when_equipment_contains_melee_weapon()
        {
            // arrange
            Slot slot1 = new Slot() { Id = 1, Item = new RangedWeapon { Id = 1, Name = "Bow", Points = 10, Magic = false } };
            Slot slot2 = new Slot() { Id = 2, Item = new MeleeWeapon { Id = 2, Name = "Lance", Points = 50, Magic = true } };
            Slot slot3 = new Slot() { Id = 3, Item = new Armor { Id = 3, Name = "Armor", Points = 15, Magic = false } };

            Equipment equipment = new Equipment();
            equipment.Slots.Add(slot1);
            equipment.Slots.Add(slot2);
            equipment.Slots.Add(slot3);

            // act
            MeleeWeapon? result = equipment.MeleeWeapon();

            // assert
            result.Should().NotBeNull();
            result?.Name.Should().Be("Lance");
        }

        [Fact]
        public void should_return_null_when_equipment_does_not_contains_melee_weapon()
        {
            // act
            MeleeWeapon? result = new Equipment().MeleeWeapon();

            // assert
            result.Should().BeNull();
        }

        [Fact]
        public void should_clone_equipment_with_slots()
        {
            // arrange
            var slot = new Slot { Id = 1, Item = new Item { Id = 2, Name = "Sword" } };
            var equipment = new Equipment { Id = 3, Slots = new List<Slot> { slot } };

            // act
            var clone = equipment.Clone();

            // assert
            clone.Id.Should().Be(3);
            clone.Slots.Should().HaveCount(1);
            clone.Slots[0].Id.Should().Be(1);
            clone.Slots[0].Item.Should().Be(slot.Item);
            clone.Slots[0].Should().NotBeSameAs(slot);
        }        


    }
}


