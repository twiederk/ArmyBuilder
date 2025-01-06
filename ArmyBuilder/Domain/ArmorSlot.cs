namespace ArmyBuilder.Domain
{
    public class ArmorSlot: Slot
    {
        public string Name => "Rüstung";
        public Armor Item { get; set; }
    }
}