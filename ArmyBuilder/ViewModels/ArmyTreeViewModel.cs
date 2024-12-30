using System.Collections.ObjectModel;
using ArmyBuilder.Domain;


namespace ArmyBuilder.ViewModels
{
    public class ArmyTreeViewModel
    {
        public ObservableCollection<ArmyTreeNode> Root { get; set; }

        public ArmyTreeViewModel(Army army)
        {
            Root = new ObservableCollection<ArmyTreeNode>
            {
                new ArmyTreeNode(army)
            };
        }
    }
}




