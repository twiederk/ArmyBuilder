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
    public class ArmyListLoaderIntegrationTest : IClassFixture<DatabaseFixture>
    {
        private readonly IDbConnection _dbConnection;
        private readonly ArmyBuilderRepositorySqlite _repository;
        private readonly ArmyListLoader _armyListLoader;

        public ArmyListLoaderIntegrationTest(DatabaseFixture fixture)
        {
            _dbConnection = fixture.DbConnection;
            _repository = fixture.Repository;
            _armyListLoader = new ArmyListLoader(_repository);
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
            var result = _armyListLoader.selectableItems(slot, highElfArmyList);

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
            var result = _armyListLoader.selectableItems(slot, highElfArmyList);

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
            var result = _armyListLoader.selectableItems(slot, highElfArmyList);

            // assert
            result.Should().HaveCount(65);
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
            var result = _armyListLoader.selectableItems(slot, highElfArmyList);

            // assert
            result.Should().HaveCount(8);
        }
    }
}
