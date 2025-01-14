using ArmyBuilder.Domain;
using ArmyBuilder.ViewModels;
using FluentAssertions;

namespace ArmyBuilder.Test.ViewModels
{
    public class SlotViewModelTest
    {
        [Fact]
        public void should_return_correct_slot_name_for_melee_weapon()
        {
            // arrange
            Slot slot = new Slot() { ItemClass = ItemClass.MeleeWeapon };
            SlotViewModel slotViewModel = new SlotViewModel(slot);

            // act
            string slotName = slotViewModel.SlotName();

            // assert
            slotName.Should().Be("Waffe:");
        }
    }
}
