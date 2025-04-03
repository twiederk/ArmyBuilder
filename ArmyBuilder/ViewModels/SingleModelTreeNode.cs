using ArmyBuilder.Domain;
using System.ComponentModel;
using System.Windows;

namespace ArmyBuilder.ViewModels
{
    public class SingleModelTreeNode : INotifyPropertyChanged
    {
        public string Name => _singleModel.DisplayName;
        public string Movement => _singleModel.Movement;
        public string WeaponSkill => _singleModel.WeaponSkill;
        public string BallisticSkill => _singleModel.BallisticSkill;
        public string Strength => _singleModel.Strength;
        public string Toughness => _singleModel.Toughness;
        public string Wounds => _singleModel.Wounds;
        public string Initiative => _singleModel.Initiative;
        public string Attacks => _singleModel.Attacks;
        public string Moral => _singleModel.Moral;
        public string Save => _singleModel.Save;
        public Visibility HeadingVisibility => headingVisibility();


        public List<EquipmentTreeNode> Equipment { get; set; } = new List<EquipmentTreeNode>();
        private SingleModel _singleModel;
        private MainModelTreeNode _parent;



        public SingleModelTreeNode(SingleModel singleModel, MainModelTreeNode parent)
        {
            _parent = parent;
            _singleModel = singleModel;
            if (!singleModel.Equipment.IsEmpty())
            {
                EquipmentTreeNode equipmentTreeNode = new EquipmentTreeNode(singleModel.Equipment, this);
                Equipment.Add(equipmentTreeNode);
            }
        }

        public void UpdateEquipment()
        {
            _parent.UpdateTotalPoints();
            OnPropertyChanged("Strength");
            OnPropertyChanged("Attacks");
            OnPropertyChanged("Initiative");
            OnPropertyChanged("Save");
        }

        private Visibility headingVisibility()
        {
            int index = _parent.SingleModels.IndexOf(this);
            return index == 0 ? Visibility.Visible : Visibility.Collapsed;
        }


        public event PropertyChangedEventHandler PropertyChanged;

        public void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

    }
}




