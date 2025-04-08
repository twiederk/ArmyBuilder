using System.ComponentModel;
using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{
    public class MountViewModel
    {
        public string Name => SingleModel.DisplayName;
        public string Movement => SingleModel.Movement;
        public string WeaponSkill => SingleModel.WeaponSkill;
        public string BallisticSkill => SingleModel.BallisticSkill;
        public string Strength => SingleModel.Strength;
        public string Toughness => SingleModel.Toughness;
        public string Wounds => SingleModel.Wounds;
        public string Initiative => SingleModel.Initiative;
        public string Attacks => SingleModel.Attacks;
        public string Moral => SingleModel.Moral;
        public string Save => SingleModel.Save;

        public SingleModel SingleModel { get; set;}

        public MountViewModel(SingleModel singleModel)
        {
            SingleModel = singleModel;
        }        

    }

}
