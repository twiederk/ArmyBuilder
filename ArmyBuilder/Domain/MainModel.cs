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
        public bool Musician { get; set; }
        public bool StandardBearer { get; set; }
        public List<SingleModel> SingleModels { get; set; } = new List<SingleModel>();

        public float TotalPoints()
        {
            switch (ArmyCategory)
            {
                case ArmyCategory.Character:
                    return TotalPointsCharacter();
                case ArmyCategory.Trooper:
                    return TotalPointsTrooper();
                case ArmyCategory.WarMachine:
                    return TotalPointsCharacter();
                case ArmyCategory.Monster:
                    return TotalPointsCharacter();
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }

        public float TotalPointsCharacter()
        {
            float mainModelPoints = 0;
            foreach (var singleModel in SingleModels)
            {
                mainModelPoints += singleModel.BasePoints() + singleModel.MagicPoints();
            }
            return mainModelPoints * Count;
        }

        public float TotalPointsTrooper()
        {
            float mainModelPoints = SingleModels.Sum(sm => sm.BasePoints());
            float magicPoints = SingleModels.Sum(sm => sm.MagicPoints());
            int count = modelCount();
            return mainModelPoints * count + magicPoints;
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
            SingleModels.Add(singleModel);
            singleModel.MainModel = this;
        }

        public void AddMount(SingleModel singleModel)
        {
            if (singleModel.Mount)
            {
                SingleModels[0].MovementType = MovementType.OnMount;
            }
            AddSingleModel(singleModel);
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
                            Selection = slot.Selection.ToList()
                        }).ToList()
                    }
                }).ToList()
            };
            clone.SingleModels.ForEach(sm => sm.MainModel = clone);
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
