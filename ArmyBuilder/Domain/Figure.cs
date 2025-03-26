using System;
using Dapper.Contrib.Extensions;


namespace ArmyBuilder.Domain
{
    [Table("figure")]
    public class Figure
    {
        public int Id { get; set; }
        public int NumberOfFigures { get; set;} = new Random().Next(0, 21);
        public string ImagePath { get; set; } = new Random().Next(0, 2) == 0 ? @"images\Dwarves\Dwarf_JosefBugman.jpg" : @"images\Dwarves\Dwarf_Runenamboss.jpg"; 
    }
}
