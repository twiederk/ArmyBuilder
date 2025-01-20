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
    }
}
