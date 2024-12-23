using ArmyBuilder.Domain;
using System.Windows.Controls;

namespace ArmyBuilder.ViewModels
{
    public class SingleModelTreeNode(SingleModel singleModel)
    {
        public string Name => singleModel.Name;
        public int Movement => singleModel.Profile.Movement;
        public int WeaponSkill=> singleModel.Profile.WeaponSkill;
        public int BallisticSkill=> singleModel.Profile.BallisticSkill;
        public int Strength => singleModel.Profile.Strength;
        public int Toughness => singleModel.Profile.Toughness;
        public int Wounds => singleModel.Profile.Wounds;
        public int Initiative  => singleModel.Profile.Initiative;
        public int Attacks => singleModel.Profile.Attacks;
        public int Moral => singleModel.Profile.Moral;

    }
}




