using System.ComponentModel;
using ArmyBuilder.Domain;

namespace ArmyBuilder.ViewModels
{
    public class MountViewModel
    {
        public string Name => SingleModel.DisplayName;
        public SingleModel SingleModel { get; set;}

        public MountViewModel(SingleModel singleModel)
        {
            SingleModel = singleModel;
        }        

    }

}
