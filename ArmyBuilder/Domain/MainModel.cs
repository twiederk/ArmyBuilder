namespace ArmyBuilder.Domain
{
    public class MainModel
    {
        public int Id { get; set; }
        public ArmyCategory ArmyCategory { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public float Points { get; set; }
        public int Count { get; set; } = 1;
        public List<SingleModel> SingleModels { get; set; } = new List<SingleModel>();

        public float TotalPoints()
        {
            return Points * Count;
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


        public MainModel Clone()
        {
            return new MainModel
            {
                Id = this.Id,
                ArmyCategory = this.ArmyCategory,
                Name = this.Name,
                Description = this.Description,
                Points = this.Points,
                SingleModels = this.SingleModels.Select(sm => new SingleModel
                {
                    Id = sm.Id,
                    Name = sm.Name,
                    Description = sm.Description,
                    Profile = new Profile
                    {
                        Movement = sm.Profile.Movement,
                        WeaponSkill = sm.Profile.WeaponSkill,
                        BallisticSkill = sm.Profile.BallisticSkill,
                        Strength = sm.Profile.Strength,
                        Toughness = sm.Profile.Toughness,
                        Wounds = sm.Profile.Wounds,
                        Initiative = sm.Profile.Initiative,
                        Attacks = sm.Profile.Attacks,
                        Moral = sm.Profile.Moral
                    }
                }).ToList()
            };
        }
    }
}
