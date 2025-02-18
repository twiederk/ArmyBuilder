


namespace ArmyBuilder.Domain
{
    public class MainModel
    {
        public int Id { get; set; }
        public ArmyCategory ArmyCategory { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public float OldPoints { get; set; }
        public float NewPoints => Points();
        public int Count { get; set; } = 1;
        public bool Uniquely { get; set; }
        public List<SingleModel> SingleModels { get; set; } = new List<SingleModel>();

        public float TotalPoints()
        {
            return Points() * Count;
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

        public float Points()
        {
            return SingleModels.Sum(sm => sm.TotalPoints());
        }

        public void AddSingleModel(SingleModel singleModel)
        {
            if (singleModel.Mount)
            {
                SingleModels[0].MovementType = MovementType.OnMount;
            }
            SingleModels.Add(singleModel);
        }

        public MainModel Clone()
        {
            return new MainModel
            {
                Id = this.Id,
                ArmyCategory = this.ArmyCategory,
                Name = this.Name,
                Description = this.Description,
                OldPoints = this.OldPoints,
                Uniquely = this.Uniquely,
                SingleModels = this.SingleModels.Select(sm => new SingleModel
                {
                    Id = sm.Id,
                    Name = sm.Name,
                    Description = sm.Description,
                    StandardBearer = sm.StandardBearer,
                    Musician = sm.Musician,
                    MovementType = sm.MovementType,
                    Mount = sm.Mount,
                    Profile = new Profile
                    {
                        Id = sm.Profile.Id,
                        Movement = sm.Profile.Movement,
                        WeaponSkill = sm.Profile.WeaponSkill,
                        BallisticSkill = sm.Profile.BallisticSkill,
                        Strength = sm.Profile.Strength,
                        Toughness = sm.Profile.Toughness,
                        Wounds = sm.Profile.Wounds,
                        Initiative = sm.Profile.Initiative,
                        Attacks = sm.Profile.Attacks,
                        Moral = sm.Profile.Moral,
                        Points = sm.Profile.Points,
                        Save = sm.Profile.Save
                    },
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
                            SelectableItems = slot.SelectableItems.ToList()
                        }).ToList()
                    }
                }).ToList()
            };
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
