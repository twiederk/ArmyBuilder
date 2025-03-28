using System;
using Dapper.Contrib.Extensions;


namespace ArmyBuilder.Domain
{
    [Table("figure")]
    public class Figure
    {
        public int Id { get; set; }
        public int NumberOfFigures { get; set;}
        public string ImagePath { get; set; }

        public override bool Equals(object obj)
        {
            if (obj is Figure other)
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
