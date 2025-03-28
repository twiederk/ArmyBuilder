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
    }
}
