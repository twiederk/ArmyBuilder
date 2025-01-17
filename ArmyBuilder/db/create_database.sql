﻿PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;


CREATE TABLE IF NOT EXISTS "army_list"
("id"           INTEGER,
 "name"    		VARCHAR(50),
 PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS "army_category"
("id"         INTEGER,
 "category"   VARCHAR(50),
 PRIMARY KEY(id) 
);


CREATE TABLE IF NOT EXISTS "profile"
("id"              INTEGER,
 "movement"        SMALLINT,
 "weapon_skill"    SMALLINT,
 "ballistic_skill" SMALLINT,
 "strength"        SMALLINT,
 "toughness"       SMALLINT,
 "wounds"          SMALLINT,
 "initiative"      SMALLINT,
 "attacks"         SMALLINT,
 "moral"           SMALLINT,
 "base_width"      SMALLINT,
 "base_height"     SMALLINT,
 "points"          FLOAT,
 PRIMARY KEY(id)
 );


CREATE TABLE IF NOT EXISTS "main_model"
("id"                INTEGER,
 "army_list_id"      INTEGER,
 "army_category_id"  INTEGER,
 "name"              VARCHAR(60),
 "description"       VARCHAR(110),
 "points"            FLOAT,
 "base_width"        SMALLINT,
 "base_height"       SMALLINT,
 PRIMARY KEY(id)
 FOREIGN KEY (army_list_id) REFERENCES army_list(id) ON DELETE CASCADE 
 FOREIGN KEY (army_category_id) REFERENCES army_category(id) ON DELETE CASCADE 
);


CREATE TABLE IF NOT EXISTS "single_model"
("id"                INTEGER,
 "profile_id"        INTEGER,
 "name"              VARCHAR(60),
 "main_model_id"     INTEGER,
 "description"       VARCHAR(110),
 "slot_profile_id"   SMALLINT,
 PRIMARY KEY(id)
 FOREIGN KEY (main_model_id) REFERENCES main_model(id) ON DELETE CASCADE 
 FOREIGN KEY (profile_id) REFERENCES profile(id) ON DELETE CASCADE 
);


CREATE TABLE IF NOT EXISTS "army"
("id"                INTEGER,
 "name"              VARCHAR(256),
 "author"            VARCHAR(128),
 "army_list_id"      INTEGER,
 "points"            INTEGER,
 PRIMARY KEY(id)
 FOREIGN KEY (army_list_id) REFERENCES army_list(id) ON DELETE CASCADE 
);


CREATE TABLE IF NOT EXISTS "unit"
("id"                INTEGER,
 "army_id"           INTEGER,
 "name"              VARCHAR(256),
 PRIMARY KEY(id)
 FOREIGN KEY (army_id) REFERENCES army(id) ON DELETE CASCADE 
);


CREATE TABLE IF NOT EXISTS "unit_main_model"
("id"                INTEGER,
 "unit_id"           INTEGER,
 "main_model_id"     INTEGER,
 "count"             INTEGER,
 PRIMARY KEY(id)
 FOREIGN KEY (unit_id) REFERENCES unit(id) ON DELETE CASCADE 
 FOREIGN KEY (main_model_id) REFERENCES main_model(id) ON DELETE CASCADE 
);


CREATE TABLE IF NOT EXISTS "melee_weapon"
("id"           INTEGER,
 "name"         VARCHAR(50),
 "points"       INTEGER,
 "description"  VARCHAR(100),
 "army_list_id" INTEGER,
 "unique"       BIT,
 "magic"        BIT,
 PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS "ranged_weapon"
("id"           INTEGER,
 "name"         VARCHAR(50),
 "points"       INTEGER,
 "description"  VARCHAR(100),
 "army_list_id" INTEGER,
 "unique"       BIT,
 "magic"        BIT,
 "strength"     INTEGER,
 "range"        INTEGER,
 PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS "armor"
("id"           INTEGER,
 "name"         VARCHAR(50),
 "points"       INTEGER,
 "description"  VARCHAR(100),
 "army_list_id" INTEGER,
 "unique"       BIT,
 "magic"        BIT,
 "save"         INTEGER,
 PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS "shield"
("id"           INTEGER,
 "name"         VARCHAR(50),
 "points"       INTEGER,
 "description"  VARCHAR(100),
 "army_list_id" INTEGER,
 "unique"       BIT,
 "magic"        BIT,
 "save"         INTEGER,
 PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS "standard"
("id"           INTEGER,
 "name"         VARCHAR(50),
 "points"       INTEGER,
 "description"  VARCHAR(100),
 "army_list_id" INTEGER,
 "unique"       BIT,
 "magic"        BIT,
 PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS "instrument"
("id"           INTEGER,
 "name"         VARCHAR(50),
 "points"       INTEGER,
 "description"  VARCHAR(100),
 "army_list_id" INTEGER,
 "unique"       BIT,
 "magic"        BIT,
 PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS "misc"
("id"           INTEGER,
 "name"         VARCHAR(50),
 "points"       INTEGER,
 "description"  VARCHAR(100),
 "army_list_id" INTEGER,
 "unique"       BIT,
 "magic"        BIT,
 PRIMARY KEY(id)
);



CREATE TABLE IF NOT EXISTS "standard"
("id"           INTEGER,
 "name"         VARCHAR(50),
 "points"       INTEGER,
 "description"  VARCHAR(100),
 "army_list_id" INTEGER,
 "unique"       BIT,
 "magic"        BIT,
 PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS "misc"
("id"           INTEGER,
 "name"         VARCHAR(50),
 "points"       INTEGER,
 "description"  VARCHAR(100),
 "army_list_id" INTEGER,
 "unique"       BIT,
 "magic"        BIT,
 PRIMARY KEY(id)
);


CREATE VIEW item AS
SELECT id, name, points, description, army_list_id, "unique", magic FROM melee_weapon
UNION ALL
SELECT id, name, points, description, army_list_id, "unique", magic FROM ranged_weapon
UNION ALL
SELECT id, name, points, description, army_list_id, "unique", magic FROM armor
UNION ALL
SELECT id, name, points, description, army_list_id, "unique", magic FROM shield
UNION ALL
SELECT id, name, points, description, army_list_id, "unique", magic FROM standard
UNION ALL
SELECT id, name, points, description, army_list_id, "unique", magic FROM instrument
UNION ALL
SELECT id, name, points, description, army_list_id, "unique", magic FROM misc;


CREATE TABLE IF NOT EXISTS "slot"
("id"                INTEGER,
 "single_model_id"   INTEGER,
 "item_id"           INTEGER,
 "editable"          BIT,
 "magic"             BIT,
 "all_items"         BIT,
 "item_class"        INTEGER,
 PRIMARY KEY(id)
 FOREIGN KEY (single_model_id) REFERENCES single_model(id) ON DELETE CASCADE 
);


COMMIT;

