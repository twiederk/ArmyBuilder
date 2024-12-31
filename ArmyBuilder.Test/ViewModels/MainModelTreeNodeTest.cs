using ArmyBuilder.Domain;
using ArmyBuilder.ViewModels;
using FluentAssertions;

namespace ArmyBuilder.Test.ViewModels
{
    public class MainModelTreeNodeTest
    {
        [Fact]
        public void should_display_translation_of_army_category_when_ArmyCategory_WarMachine_is_given()
        {
            // arrange
            MainModel mainModel = new MainModel() { ArmyCategory = ArmyCategory.WarMachine };

            // act
            string armyCategory = new MainModelTreeNode(mainModel, null).DisplayArmyCategory;

            // assert
            armyCategory.Should().Be("Kriegsgerät");

        }
    }
}
