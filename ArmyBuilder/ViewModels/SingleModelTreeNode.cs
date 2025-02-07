using ArmyBuilder.Domain;
using System.ComponentModel;
using System.Windows.Controls;

namespace ArmyBuilder.ViewModels
{
    public class SingleModelTreeNode : INotifyPropertyChanged
    {
        public string Name => _singleModel.Name;
        public int Movement => _singleModel.Profile.Movement;
        public int WeaponSkill => _singleModel.Profile.WeaponSkill;
        public int BallisticSkill => _singleModel.Profile.BallisticSkill;
        public int Strength => _singleModel.Profile.Strength;
        public int Toughness => _singleModel.Profile.Toughness;
        public int Wounds => _singleModel.Profile.Wounds;
        public int Initiative => _singleModel.Profile.Initiative;
        public int Attacks => _singleModel.Profile.Attacks;
        public int Moral => _singleModel.Profile.Moral;
        public String Save => _singleModel.Save;

        private SingleModel _singleModel;
        public List<EquipmentTreeNode> Equipment { get; set; } = new List<EquipmentTreeNode>();

        public SingleModelTreeNode(SingleModel singleModel)
        {
            _singleModel = singleModel;
            if (!singleModel.Equipment.IsEmpty())
            {
                EquipmentTreeNode equipmentTreeNode = new EquipmentTreeNode(singleModel.Equipment, this);
                Equipment.Add(equipmentTreeNode);
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        public void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public void UpdateEquipment()
        {
            OnPropertyChanged("Save");
        }

    }
}




