﻿using ArmyBuilder.Domain;
using Dapper.Contrib.Extensions;

namespace ArmyBuilder.Dao
{

    [Table("Slot")]
    public class SlotRdo
    {
        public int Id { get; set; }
        public int ItemId { get; set; }
        public bool Editable { get; set; }
        public bool AllItems { get; set; }
        public ItemClass ItemClass { get; set; }
        public int SingleModelId { get; set; }
        public Slot toSlot()
        {
            Slot slot = new Slot();
            slot.Id = Id;
            slot.Editable = Editable;
            slot.AllItems = AllItems;
            return slot;
        }
    }

}
