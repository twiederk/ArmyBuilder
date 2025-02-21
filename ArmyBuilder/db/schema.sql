PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;


CREATE TABLE IF NOT EXISTS "army_category"
("id"         INTEGER PRIMARY KEY AUTOINCREMENT,
 "category"   VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS "item_class"
("id"            INTEGER PRIMARY KEY AUTOINCREMENT,
 "name"          VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS "movement_type"
("id"     INTEGER PRIMARY KEY AUTOINCREMENT,
 "name"   VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS "melee_weapon"
("id"           INTEGER PRIMARY KEY AUTOINCREMENT,
 "name"         VARCHAR(50),
 "points"       INTEGER,
 "description"  VARCHAR(100),
 "army_list_id" INTEGER,
 "uniquely"     BIT,
 "magic"        BIT
);


CREATE TABLE IF NOT EXISTS "ranged_weapon"
("id"           INTEGER PRIMARY KEY AUTOINCREMENT,
 "name"         VARCHAR(50),
 "points"       INTEGER,
 "description"  VARCHAR(100),
 "army_list_id" INTEGER,
 "uniquely"     BIT,
 "magic"        BIT,
 "strength"     INTEGER,
 "range"        INTEGER
);


CREATE TABLE IF NOT EXISTS "armor"
("id"           INTEGER  PRIMARY KEY AUTOINCREMENT,
 "name"         VARCHAR(50),
 "points"       INTEGER,
 "description"  VARCHAR(100),
 "army_list_id" INTEGER,
 "uniquely"     BIT,
 "magic"        BIT,
 "save"         INTEGER
);


CREATE TABLE IF NOT EXISTS "shield"
("id"           INTEGER PRIMARY KEY AUTOINCREMENT,
 "name"         VARCHAR(50),
 "points"       INTEGER,
 "description"  VARCHAR(100),
 "army_list_id" INTEGER,
 "uniquely"     BIT,
 "magic"        BIT,
 "save"         INTEGER
);


CREATE TABLE IF NOT EXISTS "standard"
("id"           INTEGER PRIMARY KEY AUTOINCREMENT,
 "name"         VARCHAR(50),
 "points"       INTEGER,
 "description"  VARCHAR(100),
 "army_list_id" INTEGER,
 "uniquely"     BIT,
 "magic"        BIT
);


CREATE TABLE IF NOT EXISTS "instrument"
("id"           INTEGER PRIMARY KEY AUTOINCREMENT,
 "name"         VARCHAR(50),
 "points"       INTEGER,
 "description"  VARCHAR(100),
 "army_list_id" INTEGER,
 "uniquely"     BIT,
 "magic"        BIT
);


CREATE TABLE IF NOT EXISTS "misc"
("id"           INTEGER PRIMARY KEY AUTOINCREMENT,
 "name"         VARCHAR(50),
 "points"       INTEGER,
 "description"  VARCHAR(100),
 "army_list_id" INTEGER,
 "uniquely"     BIT,
 "magic"        BIT
);


CREATE VIEW "item" AS
SELECT id, name, points, description, army_list_id, uniquely, magic FROM melee_weapon
UNION ALL                                           
SELECT id, name, points, description, army_list_id, uniquely, magic FROM ranged_weapon
UNION ALL                                           
SELECT id, name, points, description, army_list_id, uniquely, magic FROM armor
UNION ALL                                           
SELECT id, name, points, description, army_list_id, uniquely, magic FROM shield
UNION ALL                                           
SELECT id, name, points, description, army_list_id, uniquely, magic FROM standard
UNION ALL                                           
SELECT id, name, points, description, army_list_id, uniquely, magic FROM instrument
UNION ALL                                           
SELECT id, name, points, description, army_list_id, uniquely, magic FROM misc;


CREATE TABLE IF NOT EXISTS "profile"
("id"              INTEGER PRIMARY KEY AUTOINCREMENT,
 "name"            VARCHAR(50),
 "movement"        SMALLINT,
 "weapon_skill"    SMALLINT,
 "ballistic_skill" SMALLINT,
 "strength"        SMALLINT,
 "toughness"       SMALLINT,
 "wounds"          SMALLINT,
 "initiative"      SMALLINT,
 "attacks"         SMALLINT,
 "moral"           SMALLINT,
 "points"          FLOAT,
 "save"            SMALLINT
 );


CREATE TABLE IF NOT EXISTS "army_list"
("id"           INTEGER PRIMARY KEY AUTOINCREMENT,
 "name"    		VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS "main_model"
("id"                INTEGER PRIMARY KEY AUTOINCREMENT,
 "army_list_id"      INTEGER,
 "army_category_id"  INTEGER,
 "name"              VARCHAR(60),
 "description"       VARCHAR(110),
 "uniquely"            BIT,
 "points"            FLOAT,
 FOREIGN KEY (army_list_id) REFERENCES army_list(id) ON DELETE CASCADE 
 FOREIGN KEY (army_category_id) REFERENCES army_category(id) ON DELETE CASCADE 
);


CREATE TABLE IF NOT EXISTS "single_model"
("id"                INTEGER PRIMARY KEY AUTOINCREMENT,
 "profile_id"        INTEGER,
 "name"              VARCHAR(60),
 "main_model_id"     INTEGER,
 "description"       VARCHAR(110),
 "standard_bearer"   BIT,
 "musician"          BIT,
 "movement_type_id"  INTEGER,
 "mount"             BIT,
 "mountable"         BIT,
 FOREIGN KEY (main_model_id) REFERENCES main_model(id) ON DELETE CASCADE 
 FOREIGN KEY (profile_id) REFERENCES profile(id) ON DELETE CASCADE 
 FOREIGN KEY (movement_type_id) REFERENCES movement_type(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS "slot"
("id"                INTEGER PRIMARY KEY AUTOINCREMENT,
 "single_model_id"   INTEGER,
 "item_id"           INTEGER,
 "editable"          BIT,
 "magic"             BIT,
 "item_class_id"     INTEGER,
 FOREIGN KEY (single_model_id) REFERENCES single_model(id) ON DELETE CASCADE 
 FOREIGN KEY (item_class_id) REFERENCES item_class(id) ON DELETE CASCADE 
);


CREATE TABLE IF NOT EXISTS "slot_selection"
("id"         INTEGER PRIMARY KEY AUTOINCREMENT,
 "slot_id"    INTEGER,
 "item_id"    INTEGER,
 FOREIGN KEY(slot_id) REFERENCES slot(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS "army"
("id"                INTEGER PRIMARY KEY AUTOINCREMENT,
 "name"              VARCHAR(256),
 "author"            VARCHAR(128),
 "army_list_id"      INTEGER,
 "points"            INTEGER,
 FOREIGN KEY (army_list_id) REFERENCES army_list(id) ON DELETE CASCADE 
);


CREATE TABLE IF NOT EXISTS "army_unit"
("id"                INTEGER PRIMARY KEY AUTOINCREMENT,
 "army_id"           INTEGER,
 "name"              VARCHAR(256),
 FOREIGN KEY (army_id) REFERENCES army(id) ON DELETE CASCADE 
);


CREATE TABLE IF NOT EXISTS "army_main_model"
("id"                INTEGER PRIMARY KEY AUTOINCREMENT,
 "army_unit_id"		 INTEGER,
 "army_category_id"  INTEGER,
 "name"              VARCHAR(60),
 "description"       VARCHAR(110),
 "uniquely"          BIT,
 "points"            FLOAT,
 "count"             INTEGER,
 FOREIGN KEY (army_unit_id) REFERENCES army_unit(id) ON DELETE CASCADE
 FOREIGN KEY (army_category_id) REFERENCES army_category(id) ON DELETE CASCADE 
);


CREATE TABLE IF NOT EXISTS "army_single_model"
("id"                   INTEGER PRIMARY KEY AUTOINCREMENT,
 "profile_id"           INTEGER,
 "name"                 VARCHAR(60),
 "army_main_model_id"   INTEGER,
 "description"          VARCHAR(110),
 "standard_bearer"      BIT,
 "musician"             BIT,
 "movement_type_id"     INTEGER,
 "mount"                BIT,
 "mountable"            BIT,
 FOREIGN KEY (army_main_model_id) REFERENCES army_main_model(id) ON DELETE CASCADE 
 FOREIGN KEY (profile_id) REFERENCES profile(id) ON DELETE CASCADE 
 FOREIGN KEY (movement_type_id) REFERENCES movement_type(id) ON DELETE CASCADE 
);


CREATE TABLE IF NOT EXISTS "army_slot"
("id"                     INTEGER PRIMARY KEY AUTOINCREMENT,
 "army_single_model_id"   INTEGER,
 "item_id"                INTEGER,
 "editable"               BIT,
 "magic"                  BIT,
 "item_class_id"          INTEGER,
 FOREIGN KEY (army_single_model_id) REFERENCES army_single_model(id) ON DELETE CASCADE 
 FOREIGN KEY (item_class_id) REFERENCES item_class(id) ON DELETE CASCADE 
);


CREATE TABLE IF NOT EXISTS "army_slot_selection"
("id"              INTEGER PRIMARY KEY AUTOINCREMENT,
 "army_slot_id"    INTEGER,
 "item_id"         INTEGER,
 FOREIGN KEY(army_slot_id) REFERENCES army_slot(id) ON DELETE CASCADE
 FOREIGN KEY(item_id) REFERENCES item(id) ON DELETE CASCADE
);


CREATE VIEW "army_list_profile" AS
SELECT mm.army_list_id, mm.id AS main_model_id, mm.name AS main_model_name, sm.id AS single_model_id, sm.name AS single_model_name, p.id AS profile_id, p.name AS profile_name, p.points AS profile_points
FROM single_model sm 
INNER JOIN main_model mm ON sm.main_model_id = mm.id
INNER JOIN profile p ON sm.profile_id = p.id;


COMMIT;

