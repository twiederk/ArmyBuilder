using ArmyBuilder.Dao;
using ArmyBuilder.Domain;
using ArmyBuilder.Test.Dao;
using ArmyBuilder.ViewModels;
using FluentAssertions;
using System.Collections.Generic;
using System.Data;
using System.Data.SQLite;
using Xunit;

namespace ArmyBuilder.Test.ViewModels
{
    public class ArmyViewModelIntegrationTest : IClassFixture<DatabaseFixture>
    {
        private readonly IDbConnection _dbConnection;
        private readonly ArmyBuilderRepositorySqlite _repository;
        private readonly ArmyViewModel _armyViewModel;

        public ArmyViewModelIntegrationTest(DatabaseFixture fixture)
        {
            _dbConnection = fixture.DbConnection;
            _repository = fixture.Repository;
            _armyViewModel = new ArmyViewModel(_repository);
        }

        [Fact]
        public void should_return_empty_list_when_slot_is_not_editable()
        {
            // arrange
            var slot = new Slot
            { 
                ItemClass = ItemClass.MeleeWeapon,
                Editable = false,
            };
            var highElfArmyList = new ArmyList { Id = 7, Name = "High Elf" };

            // act
            var result = _armyViewModel.selectableItems(slot, highElfArmyList);

            // assert
            result.Should().BeEmpty();
        }

        [Fact]
        public void should_return_empty_list_when_property_selectable_items_contains_data()
        {
            // arrange
            var slot = new Slot
            {
                ItemClass = ItemClass.MeleeWeapon,
                Editable = true,
                SelectableItems = new List<Item>() { new MeleeWeapon() }
            };
            var highElfArmyList = new ArmyList { Id = 7, Name = "High Elf" };

            // act
            var result = _armyViewModel.selectableItems(slot, highElfArmyList);

            // assert
            result.Should().BeEmpty();
        }

        [Fact]
        public void should_return_magic_and_non_magic_melee_weapons_of_high_elf_army_list()
        {
            // arrange
            var slot = new Slot
            {
                ItemClass = ItemClass.MeleeWeapon,
                Editable = true,
                Magic = true
            };
            var highElfArmyList = new ArmyList { Id = 7, Name = "High Elf" };

            // act
            var result = _armyViewModel.selectableItems(slot, highElfArmyList);

            // assert
            var expectedIds = new List<int>
            {
                1, 2, 3, 4, 5, 6, 5638, 5639, 5640, 5641, 5643, 5644, 5645, 5649, 5650, 5652, 5653, 5657, 5658, 5660, 5661, 5662, 5663, 5666, 5667, 5669, 5670, 5671, 5672, 5673, 5674, 5675, 5676, 5677, 5678, 5679, 5680, 5681, 5682, 5683, 5684, 5685, 5686, 5687, 5688, 5689, 5691, 5694, 5695, 5696, 5703, 5708, 5712, 5717, 5733, 5738, 5869, 5899, 5904, 5925, 5932, 5940, 5989, 6056
            };
            var resultIds = result.Select(i => i.Id).ToList();
            var missingIds = expectedIds.Except(resultIds).ToList();
            result.Should().HaveCount(64);
        }

        [Fact]
        public void should_return_non_magic_melee_weapons_of_high_elf_army_list()
        {
            // arrange
            var slot = new Slot
            {
                ItemClass = ItemClass.MeleeWeapon,
                Editable = true,
                Magic = false
            };
            var highElfArmyList = new ArmyList { Id = 7, Name = "High Elf" };

            // act
            var result = _armyViewModel.selectableItems(slot, highElfArmyList);

            // assert
            result.Should().HaveCount(6);
        }
    }
}
