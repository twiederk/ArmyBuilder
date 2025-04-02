using Dapper.Contrib.Extensions;

namespace ArmyBuilder.Domain
{
    [Table("unit")]
    public class Unit
    {
        public int Id { get; set; }
        public string Name;
        public List<MainModel> MainModels { get; set; } = new List<MainModel>();

        public Unit()
        {
        }

        public Unit(string name)
        {
            this.Name = name;
        }

        public float TotalPoints()
        {
            return MainModels.Sum(mainModel => mainModel.TotalPoints());
        }

        public void AddMainModel(MainModel mainModel)
        {
            MainModels.Add(mainModel);
            SortMainModels();
        }

        private void SortMainModels()
        {
            MainModels = MainModels
                .OrderBy(mm => mm.ArmyCategory != ArmyCategory.Character)
                .ThenByDescending(mm => mm.ModelPoints())
                .ToList();
        }

        public void RemoveMainModel(MainModel mainModel)
        {
            MainModels.Remove(mainModel);
        }

        public override bool Equals(object obj)
        {
            if (obj is Unit other)
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