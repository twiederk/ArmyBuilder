using ArmyBuilder.Domain;
using QuestPDF.Infrastructure;
using QuestPDF.Fluent;

namespace ArmyBuilder.Print
{
    public class SingleModelPrintComponent : IComponent
    {
        private SingleModel _singleModel { get; }

        public SingleModelPrintComponent(SingleModel singleModel)
        {
            _singleModel = singleModel;
        }

        public void Compose(IContainer container)
        {
            container.PaddingLeft(10).Row(row =>
            {
                row.ConstantItem(150).Text(_singleModel.Name);
                row.ConstantItem(20).Text(_singleModel.Profile.Movement.ToString());
                row.ConstantItem(20).Text(_singleModel.Profile.WeaponSkill.ToString());
                row.ConstantItem(20).Text(_singleModel.Profile.BallisticSkill.ToString());
                row.ConstantItem(20).Text(_singleModel.Profile.Strength.ToString());
                row.ConstantItem(20).Text(_singleModel.Profile.Toughness.ToString());
                row.ConstantItem(20).Text(_singleModel.Profile.Wounds.ToString());
                row.ConstantItem(20).Text(_singleModel.Profile.Initiative.ToString());
                row.ConstantItem(20).Text(_singleModel.Profile.Attacks.ToString());
                row.ConstantItem(20).Text(_singleModel.Profile.Moral.ToString());
            });
        }
    }
}
