using ArmyBuilder.Dao;
using ArmyBuilder.Domain;
using ArmyBuilder.ViewModels;
using FluentAssertions;
using Moq;
using System.Collections.Generic;
using Xunit;

namespace ArmyBuilder.Test.ViewModels
{
    public class ArmyViewModelTest
    {
        [Fact]
        public void should_assign_equipment_to_single_model()
        {
            // arrange
            var mainModels = new List<MainModel>
            {
                new MainModel
                {
                    Id = 1,
                    Name = "Main Model 1",
                    SingleModels = new List<SingleModel>
                    {
                        new SingleModel { Id = 101, Name = "Single Model 1" },
                        new SingleModel { Id = 102, Name = "Single Model 2" }
                    }
                }
            };
            var equipment = new List<Equipment>
            {
                new Equipment { Id = 101, Slots = new List<Slot> { new Slot { Id = 1, Item = new Item { Id = 1, Name = "Item 1" } } } },
                new Equipment { Id = 102, Slots = new List<Slot> { new Slot { Id = 2, Item = new Item { Id = 2, Name = "Item 2" } } } }
            };
            var mockRepository = new Mock<IArmyBuilderRepository>();
            var armyViewModel = new ArmyViewModel(mockRepository.Object);

            // act
            armyViewModel.assignEquipment(mainModels, equipment);

            // assert
            mainModels[0].SingleModels[0].Equipment.Should().NotBeNull();
            mainModels[0].SingleModels[0].Equipment.Slots.Should().HaveCount(1);
            mainModels[0].SingleModels[0].Equipment.Slots[0].Item.Name.Should().Be("Item 1");

            mainModels[0].SingleModels[1].Equipment.Should().NotBeNull();
            mainModels[0].SingleModels[1].Equipment.Slots.Should().HaveCount(1);
            mainModels[0].SingleModels[1].Equipment.Slots[0].Item.Name.Should().Be("Item 2");
        }
    }
}
