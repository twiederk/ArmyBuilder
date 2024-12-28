PRAGMA foreign_keys=ON;
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
 "army_list_id"      INTEGER,
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


COMMIT;

