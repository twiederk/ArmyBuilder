namespace ArmyBuilder.Domain
{
    public class ArmyExample1: Army
    {
        public ArmyExample1() : base("Armee der Hochelfen von Tyr")
        {
            Armor noneArmor = new Armor
            {
                Id = 1,
                Name = "keine",
                Points = 0
            };
            Armor lightArmor = new Armor
            {
                Id = 2,
                Name = "Leichte Rüstung",
                Points = 2
            };
            Armor heavyArmor = new Armor
            {
                Id = 3,
                Name = "Schwere Rüstung",
                Points = 3
            };

            MeleeWeapon noneMeleeWeapon = new MeleeWeapon
            {
                Id = 1,
                Name = "Handwaffe",
                Points = 0,
                Damage = 1
            };
            MeleeWeapon helberd = new MeleeWeapon
            {
                Id = 2,
                Name = "Hellebarde",
                Points = 2,
                Damage = 1
            };
            MeleeWeapon spear = new MeleeWeapon
            {
                Id = 3,
                Name = "Speer",
                Points = 1,
                Damage = 1
            };
            MeleeWeapon scytheWheels = new MeleeWeapon
            {
                Id = 4,
                Name = "Sensenräder",
                Points = 20,
                Damage = 1
            };
            MeleeWeapon normalWheels = new MeleeWeapon
            {
                Id = 5,
                Name = "Wagenräder",
                Points = 1,
                Damage = 1
            };

            RangedWeapon noneRangedWeapon = new RangedWeapon
            {
                Id = 1,
                Name = "keine",
                Points = 0,
                Damage = 1
            };
            RangedWeapon bow = new RangedWeapon
            {
                Id = 2,
                Name = "Bogen",
                Points = 2,
                Damage = 1
            };
            RangedWeapon javelin = new RangedWeapon
            {
                Id = 3,
                Name = "Wurfspies",
                Points = 1,
                Damage = 1
            };
            RangedWeapon longBow = new RangedWeapon
            {
                Id = 4,
                Name = "Langbogen",
                Points = 3,
                Damage = 1
            };     

            Shield noneShield = new Shield
            {
                Id = 1,
                Name = "keines",
                Points = 0,
                Save = 0
            };
            Shield shield = new Shield
            {
                Id = 2,
                Name = "Schild",
                Points = 1,
                Save = 1
            };

            Units = new List<Unit>()
            {
                new Unit("Generalseinheit")
                {
                    MainModels = new List<MainModel>
                    {
                        new MainModel()
                        {
                            Name = "General",
                            ArmyCategory = ArmyCategory.Character,
                            Points = 160,
                            SingleModels = new List<SingleModel>
                            {
                                new SingleModel()
                                {
                                    Name = "General",
                                    Profile = new Profile
                                    {
                                        Movement = 5,
                                        WeaponSkill = 7,
                                        BallisticSkill = 7,
                                        Strength = 4,
                                        Toughness = 4,
                                        Wounds = 3,
                                        Initiative = 9,
                                        Attacks = 4,
                                        Moral = 10
                                    },
                                    Equipment = new Equipment
                                    {
                                        Slots = new List<Slot>
                                        {
                                            new Slot
                                            {
                                                Id = 1,
                                                Item = noneMeleeWeapon,
                                                Editable = true,
                                                AllItems = true,
                                            },
                                            new Slot
                                            {
                                                Id = 2,
                                                Item = noneRangedWeapon,
                                                Editable = true,
                                                AllItems = true,
                                            },
                                            new Slot
                                            {
                                                Id = 3,
                                                Item = noneArmor,
                                                Editable = true,
                                                AllItems = true,
                                            },
                                            new Slot
                                            {
                                                Id = 3,
                                                Item = noneShield,
                                                Editable = true,
                                                AllItems = true,
                                            }
                                        }
                                    }
                                }
                            }
                        },
                        new MainModel()
                        {
                            Name = "Speerträger",
                            ArmyCategory = ArmyCategory.Trooper,
                            Points = 12,
                            Count = 20,
                            SingleModels = new List<SingleModel>
                            {
                                new SingleModel()
                                {
                                    Name = "Speerträger",
                                    Profile = new Profile
                                    {
                                        Movement = 5,
                                        WeaponSkill = 4,
                                        BallisticSkill = 4,
                                        Strength = 3,
                                        Toughness = 3,
                                        Wounds = 1,
                                        Initiative = 6,
                                        Attacks = 1,
                                        Moral = 8
                                    },
                                    Equipment = new Equipment
                                    {
                                        Slots = new List<Slot>
                                        {
                                            new Slot
                                            {
                                                Id = 4,
                                                Item = spear,
                                                Editable = false,
                                                AllItems = false,
                                            },
                                            new Slot
                                            {
                                                Id = 2,
                                                Item = noneRangedWeapon,
                                                Editable = false,
                                                AllItems = false,
                                            },
                                            new Slot
                                            {
                                                Id = 3,
                                                Item = lightArmor,
                                                Editable = true,
                                                AllItems = false,
                                                SelectableItems = new List<Item> { lightArmor, heavyArmor }
                                            },
                                            new Slot
                                            {
                                                Id = 3,
                                                Item = shield,
                                                Editable = false,
                                                AllItems = false,
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                },
                new Unit("Streitwagen")
                {
                    MainModels = new List<MainModel>
                    {
                        new MainModel()
                        {
                            Name = "Streitwagen",
                            ArmyCategory = ArmyCategory.WarMachine,
                            Points = 72,
                            SingleModels = new List<SingleModel>
                            {
                                new SingleModel()
                                {
                                    Name = "Streitwagen",
                                    Profile = new Profile
                                    {
                                        Movement = 0,
                                        WeaponSkill = 0,
                                        BallisticSkill = 0,
                                        Strength = 0,
                                        Toughness = 7,
                                        Wounds = 3,
                                        Initiative = 0,
                                        Attacks = 0,
                                        Moral = 0
                                    },
                                    Equipment = new Equipment
                                    {
                                        Slots = new List<Slot>
                                        {
                                            new Slot
                                            {
                                                Id = 1,
                                                Item = normalWheels,
                                                Editable = true,
                                                AllItems = false,
                                                SelectableItems = new List<Item> { normalWheels, scytheWheels }
                                            },
                                        }
                                    }
                                    
                                },
                                new SingleModel()
                                {
                                    Name = "Streitwagenlenker",
                                    Profile = new Profile
                                    {
                                        Movement = 5,
                                        WeaponSkill = 5,
                                        BallisticSkill = 4,
                                        Strength = 4,
                                        Toughness = 3,
                                        Wounds = 1,
                                        Initiative = 7,
                                        Attacks = 1,
                                        Moral = 8
                                    },
                                    Equipment = new Equipment
                                    {
                                        Slots = new List<Slot>
                                        {
                                            new Slot
                                            {
                                                Id = 1,
                                                Item = helberd,
                                                Editable = true,
                                                AllItems = false,
                                                SelectableItems = new List<Item> { helberd, spear }
                                            },
                                            new Slot
                                            {
                                                Id = 2,
                                                Item = bow,
                                                Editable = true,
                                                AllItems = false,
                                                SelectableItems = new List<Item> { bow, javelin, longBow }
                                            },
                                            new Slot
                                            {
                                                Id = 3,
                                                Item = lightArmor,
                                                Editable = false,
                                                AllItems = false,
                                            },
                                            new Slot
                                            {
                                                Id = 4,
                                                Item = noneShield,
                                                Editable = true,
                                                AllItems = false,
                                                SelectableItems = new List<Item> { noneShield, shield }
                                            }
                                        }
                                    }
                                },
                                new SingleModel()
                                {
                                    Name = "Elfenroß",
                                    Profile = new Profile
                                    {
                                        Movement = 9,
                                        WeaponSkill = 3,
                                        BallisticSkill = 0,
                                        Strength = 3,
                                        Toughness = 3,
                                        Wounds = 1,
                                        Initiative = 4,
                                        Attacks = 1,
                                        Moral = 5
                                    }
                                }
                            }
                        }
                    }
                }
            };

        }
    }
}
