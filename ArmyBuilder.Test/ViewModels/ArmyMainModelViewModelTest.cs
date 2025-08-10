using ArmyBuilder.Domain;
using ArmyBuilder.ViewModels;
using FluentAssertions;

namespace ArmyBuilder.Test.ViewModels
{
    public class ArmyMainModelViewModelTest
    {

        [Fact]
        public void should_return_the_equipment_of_Netzgitz()
        {
            // Arrange
            var equipment = new Equipment();
            equipment.Slots.Add(new Slot { Id = 1, Item = new MeleeWeapon { Id = 1, Name = "Netz", Points = 2 }, ItemClass = ItemClass.MeleeWeapon });

            var singleModel = new SingleModel
            {
                Equipment = equipment
            };

            var mainModel = new MainModel
            {
                Name = "Netzgitz",
                SingleModels = new List<SingleModel> { singleModel }
            };

            var viewModel = new ArmyMainModelViewModel(mainModel);

            // Act
            var result = viewModel.Equipment;

            // Assert
            result.Should().Be("Netz (2)");
        }

        [Fact]
        public void should_return_the_equipment_of_Goblin_Wolfsreiter()
        {
            // Arrange
            var goblin = new SingleModel
            {
                Equipment = new Equipment()
            };

            var riesenwolf = new SingleModel
            {
                Equipment = new Equipment()
            };

            var mainModel = new MainModel
            {
                Name = "Goblin Wolfsreiter",
                SingleModels = new List<SingleModel> { goblin, riesenwolf }
            };

            var viewModel = new ArmyMainModelViewModel(mainModel);

            // Act
            var result = viewModel.Equipment;

            // Assert
            result.Should().Be(", ");
        }

        [Fact]
        public void should_return_the_equipment_of_Goblin_Wolfsstreitwagen()
        {
            // Arrange
            var goblinEquipment = new Equipment();
            goblinEquipment.Slots.Add(new Slot { Id = 1, Item = new Armor { Id = 1, Name = "Leichte Rüstung", Points = 2 }, ItemClass = ItemClass.Armor });

            var wolf = new SingleModel
            {
                Equipment = new Equipment()
            };

            var goblin = new SingleModel
            {
                Equipment = goblinEquipment
            };

            var chariot = new SingleModel
            {
                Equipment = new Equipment()
            };


            var mainModel = new MainModel
            {
                Name = "Goblin Wolfsstreitwagen",
                SingleModels = new List<SingleModel> { wolf, goblin, chariot }
            };

            var viewModel = new ArmyMainModelViewModel(mainModel);

            // Act
            var result = viewModel.Equipment;

            // Assert
            result.Should().Be(", Leichte Rüstung (2), ");
        }
    }
}


