﻿using Dapper.Contrib.Extensions;

namespace ArmyBuilder.Domain
{
    [Table("army")]
    public class Army
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Author { get; set; }
        public ArmyListDigest ArmyList { get; set; }
        public float Points { get; set; }
        public List<Unit> Units { get; set; } = new List<Unit>();

        public Army()
        {
        }

        public Army(string name)
        {
            this.Name = name;
        }

        public float TotalPoints()
        {
            return Units.Sum(unit => unit.TotalPoints());
        }

        public Unit CreateUnit(MainModel mainModel)
        {
            Unit unit = new Unit(mainModel.Name);
            unit.MainModels.Add(mainModel);
            Units.Add(unit);
            return unit;

        }

        public void RemoveUnit(Unit unit)
        {
            Units.Remove(unit);
        }

        public ArmyCategoryPoints ArmyCategoryPoints()
        {
            var categoryPoints = new ArmyCategoryPoints();

            foreach (var unit in Units)
            {
                foreach (var mainModel in unit.MainModels)
                {
                    float pointsToAdd = mainModel.TotalPoints();
                    switch (mainModel.ArmyCategory)
                    {
                        case ArmyCategory.Character:
                            categoryPoints.Character += pointsToAdd;
                            break;
                        case ArmyCategory.Trooper:
                            categoryPoints.Trooper += pointsToAdd;
                            break;
                        case ArmyCategory.WarMachine:
                            categoryPoints.WarMachine += pointsToAdd;
                            break;
                        case ArmyCategory.Monster:
                            categoryPoints.Monster += pointsToAdd;
                            break;
                    }
                }
            }

            return categoryPoints;
        }

        public List<MainModel> MainModels()
        {
            return Units.SelectMany(unit => unit.MainModels).ToList();
        }

        public override bool Equals(object obj)
        {
            if (obj is Army other)
            {
                return Id == other.Id;
            }
            return false;
        }

        public override int GetHashCode()
        {
            return Id.GetHashCode();
        }

        public List<Item> AllMagicItems()
        {
            var magicItems = new List<Item>();

            foreach (var unit in Units)
            {
                foreach (var mainModel in unit.MainModels)
                {
                    foreach (var singleModel in mainModel.SingleModels)
                    {
                        magicItems.AddRange(singleModel.Equipment.MagicItems());
                    }
                }
            }
            return magicItems;
        }

    }
}