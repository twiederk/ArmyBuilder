using System.Collections.ObjectModel;
using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{
    public class MainModelTreeNode
    {
        public string Name => $"{_mainModel.Name} ({_mainModel.Points})";
        public String Count => $"{_mainModel.Count}x";
        public float TotalPoints => _mainModel.TotalPoints();

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




