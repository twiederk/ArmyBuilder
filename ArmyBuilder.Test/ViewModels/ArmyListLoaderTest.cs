using ArmyBuilder.Dao;
using ArmyBuilder.Domain;
using ArmyBuilder.ViewModels;
using FluentAssertions;
using Moq;
using System.Collections.Generic;
using Xunit;

namespace ArmyBuilder.Test.ViewModels
{
    public class ArmyListLoaderTest
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
            var armyListLoader = new ArmyListLoader(mockRepository.Object);

            // act
            armyListLoader.assignEquipment(mainModels, equipment);

            // assert
            mainModels[0].SingleModels[0].Equipment.Should().NotBeNull();
            mainModels[0].SingleModels[0].Equipment.Slots.Should().HaveCount(1);
            mainModels[0].SingleModels[0].Equipment.Slots[0].Item.Name.Should().Be("Item 1");

            mainModels[0].SingleModels[1].Equipment.Should().NotBeNull();
            mainModels[0].SingleModels[1].Equipment.Slots.Should().HaveCount(1);
            mainModels[0].SingleModels[1].Equipment.Slots[0].Item.Name.Should().Be("Item 2");
        }

        [Fact]
        public void should_assign_selectable_items_to_slots()
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
                        new SingleModel
                        {
                            Id = 101,
                            Name = "Single Model 1",
                            Equipment = new Equipment
                            {
                                Slots = new List<Slot>
                                {
                                    new Slot { Id = 1, ItemClass = ItemClass.MeleeWeapon, Editable = true, AllItems = true },
                                    new Slot { Id = 2, ItemClass = ItemClass.RangedWeapon, Editable = true, AllItems = true },
                                    new Slot { Id = 3, ItemClass = ItemClass.Shield, Editable = true, AllItems = true }
                                }
                            }
                        }
                    }
                }
            }; 

            var meleeWeapons = new List<MeleeWeapon> { new MeleeWeapon { Id = 1, Name = "Sword" } };
            var rangedWeapons = new List<RangedWeapon> { new RangedWeapon { Id = 2, Name = "Bow" } };
            var shields = new List<Shield> { new Shield { Id = 3, Name = "Shield" } };

            var mockRepository = new Mock<IArmyBuilderRepository>();
            mockRepository.Setup(repo => repo.AllMeleeWeapon()).Returns(meleeWeapons);
            mockRepository.Setup(repo => repo.AllRangedWeapon()).Returns(rangedWeapons);
            mockRepository.Setup(repo => repo.AllShield()).Returns(shields);

            var armyListLoader = new ArmyListLoader(mockRepository.Object);

            // act
            armyListLoader.assignSelection(mainModels, new ArmyList() { Id = 7 }); 

            // assert
            var singleModel = mainModels[0].SingleModels[0];
            singleModel.Equipment.Slots[0].Selection.Should().BeEquivalentTo(meleeWeapons);
            singleModel.Equipment.Slots[1].Selection.Should().BeEquivalentTo(rangedWeapons);
            singleModel.Equipment.Slots[2].Selection.Should().BeEquivalentTo(shields);
        }

        [Fact]
        public void should_return_magical_and_non_magical_items_when_the_slot_allows_magic_items()
        {
            // arrange
            var slot = new Slot { ItemClass = ItemClass.MeleeWeapon, Editable = true, Magic = true };
            var highElfArmyList = new ArmyList { Id = 7, Name = "High Elf" };
            var dwarfArmyList = new ArmyList { Id = 14, Name = "Dwarf" };
            var meleeWeapons = new List<MeleeWeapon>
            {
                new MeleeWeapon { Id = 1, Name = "Magic Sword", ArmyList = highElfArmyList, Magic = true },
                new MeleeWeapon { Id = 2, Name = "Axe", ArmyList = null , Magic = false },
                new MeleeWeapon { Id = 3, Name = "Dwarven Hammer", ArmyList = dwarfArmyList, Magic = false },
            };

            var mockRepository = new Mock<IArmyBuilderRepository>();
            mockRepository.Setup(repo => repo.AllMeleeWeapon()).Returns(meleeWeapons);

            var armyListLoader = new ArmyListLoader(mockRepository.Object);

            // act
            var result = armyListLoader.selection(slot, new ArmyList { Id = 7 });

            // assert
            result.Should().HaveCount(2);
            result.Should().Contain(i => i.Name == "Magic Sword");
            result.Should().Contain(i => i.Name == "Axe");
        }
        
        [Fact]
        public void should_return_non_magical_items_when_the_slot_permits_magic_items()
        {
            // arrange
            var slot = new Slot { ItemClass = ItemClass.MeleeWeapon, Editable = true, Magic = false };
            var highElfArmyList = new ArmyList { Id = 7, Name = "High Elf" };
            var dwarfArmyList = new ArmyList { Id = 14, Name = "Dwarf" };
            var meleeWeapons = new List<MeleeWeapon>
            {
                new MeleeWeapon { Id = 1, Name = "Magic Sword", ArmyList = highElfArmyList, Magic = true },
                new MeleeWeapon { Id = 2, Name = "Axe", ArmyList = null , Magic = false },
                new MeleeWeapon { Id = 3, Name = "Dwarven Hammer", ArmyList = dwarfArmyList, Magic = false },
            };

            var mockRepository = new Mock<IArmyBuilderRepository>();
            mockRepository.Setup(repo => repo.AllMeleeWeapon()).Returns(meleeWeapons);

            var armyListLoader = new ArmyListLoader(mockRepository.Object);

            // act
            var result = armyListLoader.selection(slot, new ArmyList { Id = 7 });

            // assert
            result.Should().HaveCount(1);
            result.Should().Contain(i => i.Name == "Axe");
        }

        [Fact]
        public void should_return_items_in_alphabetically_order()
        {
            // arrange
            var slot = new Slot { ItemClass = ItemClass.MeleeWeapon, Editable = true, Magic = false };
            var highElfArmyList = new ArmyList { Id = 7, Name = "High Elf" };
            var dwarfArmyList = new ArmyList { Id = 14, Name = "Dwarf" };
            var meleeWeapons = new List<MeleeWeapon>
            {
                new MeleeWeapon { Id = 1, Name = "Magic Sword", ArmyList = highElfArmyList, Magic = true },
                new MeleeWeapon { Id = 2, Name = "Hammer", ArmyList = null , Magic = false },
                new MeleeWeapon { Id = 3, Name = "Battle Axe", ArmyList = null , Magic = false },
                new MeleeWeapon { Id = 4, Name = "Axe", ArmyList = null , Magic = false },
                new MeleeWeapon { Id = 5, Name = "Dwarven Hammer", ArmyList = dwarfArmyList, Magic = false },
            };

            var mockRepository = new Mock<IArmyBuilderRepository>();
            mockRepository.Setup(repo => repo.AllMeleeWeapon()).Returns(meleeWeapons);

            var armyListLoader = new ArmyListLoader(mockRepository.Object);

            // act
            List<Item> selection = armyListLoader.selection(slot, new ArmyList { Id = 7 });

            // assert
            var resultNames = selection.Select(i => i.Name).ToList();
            resultNames.Should().ContainInOrder(new List<string> { "Axe", "Battle Axe", "Hammer" });
        }

        [Fact]
        public void should_return_non_unique_items()
        {
            // arrange
            var slot = new Slot { ItemClass = ItemClass.MeleeWeapon, Editable = true, Magic = false };
            var meleeWeapons = new List<MeleeWeapon>
            {
                new MeleeWeapon { Id = 1, Name = "Sword", Magic = false },
                new MeleeWeapon { Id = 2, Name = "Axe", Magic = false },
                new MeleeWeapon { Id = 3, Name = "Ulriks Hammer", Uniquely = true, Magic = false },
            };

            var mockRepository = new Mock<IArmyBuilderRepository>();
            mockRepository.Setup(repo => repo.AllMeleeWeapon()).Returns(meleeWeapons);

            var armyListLoader = new ArmyListLoader(mockRepository.Object);

            // act
            var result = armyListLoader.selection(slot, new ArmyList { Id = 7 });

            // assert
            result.Should().HaveCount(2);
            result.Should().Contain(i => i.Name == "Sword" && i.Id == 1);
            result.Should().Contain(i => i.Name == "Axe");
        }
    }
}
