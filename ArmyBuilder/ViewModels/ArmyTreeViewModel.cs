using System.Collections.ObjectModel;
using ArmyBuilder.Domain;


namespace ArmyBuilder.ViewModels
{
    public class ArmyTreeViewModel
    {
        public ObservableCollection<ArmyTreeNode> Root { get; set; }

        public ArmyTreeViewModel(string armyListName)
        {
            Army army = new Army($"{armyListName} Armee");
            //army = new ArmyExample1();

            Root = new ObservableCollection<ArmyTreeNode>
            {
                new ArmyTreeNode(army)
            };
        }

        public ArmyTreeViewModel(Army army)
        {
            Root = new ObservableCollection<ArmyTreeNode>
            {
                new ArmyTreeNode(army)
            };
        }
    }
}




