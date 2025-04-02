using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{
    public class MountViewModel
    {
        public SingleModel SingleModel { get; set;}

        public MountViewModel(SingleModel singleModel)
        {
            SingleModel = singleModel;
        }        
    }

}
