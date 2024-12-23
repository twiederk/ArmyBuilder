using System.Collections.ObjectModel;
using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{
    public class MainModelTreeNode
    {
        public string Name => _mainModel.Name;
        public float Points => _mainModel.Points;
        public int Count { get; set; }

        private MainModel _mainModel;

        public ObservableCollection<SingleModelTreeNode> Children { get; set; } = new ObservableCollection<SingleModelTreeNode>();

        public MainModelTreeNode(MainModel mainModel)
        {
            _mainModel = mainModel;
            SetChildren();
        }

        private void SetChildren()
        {
            foreach (var singleModel in _mainModel.SingleModels)
            {
                Children.Add(new SingleModelTreeNode(singleModel));
            }
        }
    }
}




