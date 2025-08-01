using System.Windows.Documents.DocumentStructures;

namespace ArmyBuilder.Domain
{
    public class MainModel
    {
        public int Id { get; set; }
        public ArmyCategory ArmyCategory { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public float OldPoints { get; set; }
        public float NewPoints => TotalPoints();
        public int Count { get; set; } = 1;
        public bool Uniquely { get; set; }
        public bool Musician { get; set; }
        public bool StandardBearer { get; set; }
        public List<Figure> Figures { get; set; } = new List<Figure>();
        public List<SingleModel> SingleModels { get; set; } = new List<SingleModel>();

        public float TotalPoints()
        {
            if (ArmyCategory == ArmyCategory.Trooper) {
                return TotalPointsTrooper();
            }
            float mainModelPoints = SingleModels.Sum(sm => sm.BasePoints() + sm.MagicPoints());
            return mainModelPoints * Count;
        }

        public float TotalPointsTrooper()
        {
            float mainModelPoints = ModelPoints();
            float magicPoints = SingleModels.Sum(sm => sm.MagicPoints());
            int count = modelCount();
            return mainModelPoints * count + magicPoints;
        }

        public float ModelPoints() {
            float modelPoints = 0;
            foreach (var singleModel in SingleModels)
            {
                if (singleModel.IsMounted())
                {
                    modelPoints += singleModel.BasePoints() * 2;
                }
                else
                {
                    modelPoints += singleModel.BasePoints();
                }
            }
            return modelPoints;
        }

        private int modelCount() {
            int count = Count;
            if (StandardBearer) {
                count += 2;
            }
            if (Musician) {
                count += 2;
            }
            return count;
        }

        public float Points() {
            if (ArmyCategory == ArmyCategory.Trooper) {
                return ModelPoints();
            }
            return SingleModels.Sum(sm => sm.BasePoints() + sm.MagicPoints());
        }

        public int IncreaseCount()
        {
            return ++Count;
        }

        public int DecreaseCount()
        {
            if (Count > 1)
            {
                Count--;
            }
            return Count;
        }

        public void AddSingleModel(SingleModel singleModel)
        {
            SingleModels.Add(singleModel);
        }

        public SingleModel AddMount(MountModel mountModel)
        {
            SingleModels[0].MountSave = mountModel.MountSave;
            SingleModel singleModel = mountModel.ToSingleModel();
            AddSingleModel(singleModel);
            return singleModel;
        }

        public MainModel Clone()
        {
            MainModel clone = new MainModel
            {
                Id = this.Id,
                ArmyCategory = this.ArmyCategory,
                Name = this.Name,
                Description = this.Description,
                OldPoints = this.OldPoints,
                Uniquely = this.Uniquely,
                StandardBearer = this.StandardBearer,
                Musician = this.Musician,
                SingleModels = this.SingleModels.Select(sm => new SingleModel
                {
                    Id = sm.Id,
                    Name = sm.Name,
                    Mount = sm.Mount,
                    Count = sm.Count,
                    MountSave = sm.MountSave,
                    Profile = sm.Profile.Clone(),
                    Equipment = new Equipment
                    {
                        Id = sm.Equipment.Id,
                        Slots = sm.Equipment.Slots.Select(slot => new Slot
                        {
                            Id = slot.Id,
                            Item = slot.Item,
                            ItemClass = slot.ItemClass,
                            Editable = slot.Editable,
                            AllItems = slot.AllItems,
                            Magic = slot.Magic,
                            Selection = slot.Selection.ToList()
                        }).ToList()
                    }
                }).ToList()
            };
            return clone;
        }

        public bool isCustomizable()
        {
            return ArmyCategory == ArmyCategory.Character && !Uniquely;
        }

        public override bool Equals(object obj)
        {
            if (obj is MainModel other)
            {
                return Id == other.Id;
            }
            return false;
        }

        public override int GetHashCode()
        {
            return Id.GetHashCode();
        }

    }
}
