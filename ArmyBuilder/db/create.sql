PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;


CREATE TABLE IF NOT EXISTS "army_category"
("id"         INTEGER,
 "category"   VARCHAR(50),
 PRIMARY KEY(id) 
);


CREATE TABLE IF NOT EXISTS "item_class"
("id"                INTEGER,
 "name"         VARCHAR(50),
 PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS "mount_status"
("id"             INTEGER,
 "mount_status"   VARCHAR(50),
 PRIMARY KEY(id) 
);


CREATE TABLE IF NOT EXISTS "profile"
("id"              INTEGER,
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
 "save"            SMALLINT,
 PRIMARY KEY(id)
 );


CREATE TABLE IF NOT EXISTS "army_list"
("id"           INTEGER,
 "name"    		VARCHAR(50),
 PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS "main_model"
("id"                INTEGER,
 "army_list_id"      INTEGER,
 "army_category_id"  INTEGER,
 "name"              VARCHAR(60),
 "description"       VARCHAR(110),
 "points"            FLOAT,
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
 "mount_status"      INTEGER,
 "standard_bearer"   BIT,
 "musician"          BIT,
 "movement_type"     INTEGER,
 "mount"             BIT,
 PRIMARY KEY(id)
 FOREIGN KEY (main_model_id) REFERENCES main_model(id) ON DELETE CASCADE 
 FOREIGN KEY (profile_id) REFERENCES profile(id) ON DELETE CASCADE 
);


CREATE TABLE IF NOT EXISTS "slot"
("id"                INTEGER,
 "single_model_id"   INTEGER,
 "item_id"           INTEGER,
 "editable"          BIT,
 "magic"             BIT,
 "item_class_id"     INTEGER,
 PRIMARY KEY(id)
 FOREIGN KEY (single_model_id) REFERENCES single_model(id) ON DELETE CASCADE 
 FOREIGN KEY (item_class_id) REFERENCES item_class(id) ON DELETE CASCADE 
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


CREATE TABLE IF NOT EXISTS "army_unit"
("id"                INTEGER,
 "army_id"           INTEGER,
 "name"              VARCHAR(256),
 PRIMARY KEY(id)
 FOREIGN KEY (army_id) REFERENCES army(id) ON DELETE CASCADE 
);


CREATE TABLE IF NOT EXISTS "army_main_model"
("id"                INTEGER,
 "army_unit_id"		 INTEGER,
 "army_category_id"  INTEGER,
 "name"              VARCHAR(60),
 "description"       VARCHAR(110),
 "points"            FLOAT,
 "count"             INTEGER,
 PRIMARY KEY (id)
 FOREIGN KEY (army_unit_id) REFERENCES army_unit(id) ON DELETE CASCADE
 FOREIGN KEY (army_category_id) REFERENCES army_category(id) ON DELETE CASCADE 
);


CREATE TABLE IF NOT EXISTS "army_single_model"
("id"                   INTEGER,
 "profile_id"           INTEGER,
 "name"                 VARCHAR(60),
 "army_main_model_id"   INTEGER,
 "description"          VARCHAR(110),
 "mount_status"         INTEGER,
 "standard_bearer"      BIT,
 "musician"             BIT,
 "movement_type"        INTEGER,
 "mount"                BIT,
 PRIMARY KEY (id)
 FOREIGN KEY (army_main_model_id) REFERENCES army_main_model(id) ON DELETE CASCADE 
 FOREIGN KEY (profile_id) REFERENCES profile(id) ON DELETE CASCADE 
);


CREATE TABLE IF NOT EXISTS "army_slot"
("id"                     INTEGER,
 "army_single_model_id"   INTEGER,
 "item_id"                INTEGER,
 "editable"               BIT,
 "magic"                  BIT,
 "item_class_id"          INTEGER,
 PRIMARY KEY(id)
 FOREIGN KEY (army_single_model_id) REFERENCES army_single_model(id) ON DELETE CASCADE 
 FOREIGN KEY (item_class_id) REFERENCES item_class(id) ON DELETE CASCADE 
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


CREATE VIEW army_list_profile AS
SELECT mm.army_list_id, mm.id AS main_model_id, mm.name AS main_model_name, sm.id AS single_model_id, sm.name AS single_model_name, p.id AS profile_id, p.name AS profile_name
FROM single_model sm 
INNER JOIN main_model mm ON sm.main_model_id = mm.id
INNER JOIN profile p ON sm.profile_id = p.id;


COMMIT;

