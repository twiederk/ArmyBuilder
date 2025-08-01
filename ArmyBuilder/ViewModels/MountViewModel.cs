using System.ComponentModel;
using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{
    public class MountViewModel
    {
        public string Name => MountModel.DisplayName;
        public string Movement => MountModel.Movement;
        public string WeaponSkill => MountModel.WeaponSkill;
        public string BallisticSkill => MountModel.BallisticSkill;
        public string Strength => MountModel.Strength;
        public string Toughness => MountModel.Toughness;
        public string Wounds => MountModel.Wounds;
        public string Initiative => MountModel.Initiative;
        public string Attacks => MountModel.Attacks;
        public string Moral => MountModel.Moral;
        public string Save => MountModel.Save;

        public MountModel MountModel { get; set;}

        public MountViewModel(MountModel moundModel)
        {
            MountModel = moundModel;
        }        

    }

}
