PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;


INSERT INTO army (id, name, author, army_list_id, points) VALUES(1, 'Armee der Hochelfen von Tyr', 'Torsten', 7, 472);


INSERT INTO army_unit VALUES(1, 1, 'Generalseinheit');
INSERT INTO army_unit VALUES(2, 1, 'Streitwagen');


INSERT INTO army_main_model (id, army_unit_id, army_category_id, name, description, points, count) VALUES (1, 1, 0, 'General', '', 160, 1);
INSERT INTO army_main_model (id, army_unit_id, army_category_id, name, description, points, count) VALUES (2, 1, 1, 'Speerträger', '', 12, 20);
INSERT INTO army_main_model (id, army_unit_id, army_category_id, name, description, points, count) VALUES (3, 2, 2, 'Trianoc Streitwagen mit einem Elfen', '', 72, 1);

INSERT INTO army_single_model (id, profile_id, name, army_main_model_id, description, mount_status, standard_bearer, musician, movement_type, mount) VALUES (1, 11506, 'General', 1, '', 0, 0, 0, 0, 0);
INSERT INTO army_single_model (id, profile_id, name, army_main_model_id, description, mount_status, standard_bearer, musician, movement_type, mount) VALUES (2, 11906, 'Speerträger', 2, '', 0, 0, 0, 0, 0);
INSERT INTO army_single_model (id, profile_id, name, army_main_model_id, description, mount_status, standard_bearer, musician, movement_type, mount) VALUES (3, 12159, 'Streitwagen', 3, '', 0, 0, 0, 0, 0);
INSERT INTO army_single_model (id, profile_id, name, army_main_model_id, description, mount_status, standard_bearer, musician, movement_type, mount) VALUES (4, 11906, 'Streitwagenlenker', 3, '', 0, 0, 0, 0, 0);
INSERT INTO army_single_model (id, profile_id, name, army_main_model_id, description, mount_status, standard_bearer, musician, movement_type, mount) VALUES (5, 12034, 'Elfenroß', 3, '', 2, 0, 0, 0, 0);


INSERT INTO army_slot (id, army_single_model_id, item_id, editable, magic, item_class_id) VALUES (1, 1, 5, 1, 1, 0);
INSERT INTO army_slot (id, army_single_model_id, item_id, editable, magic, item_class_id) VALUES (2, 1, 10, 1, 1, 2);
INSERT INTO army_slot (id, army_single_model_id, item_id, editable, magic, item_class_id) VALUES (3, 1, 30, 1, 1, 1);
INSERT INTO army_slot (id, army_single_model_id, item_id, editable, magic, item_class_id) VALUES (4, 1, 5782, 1, 1, 3);
INSERT INTO army_slot (id, army_single_model_id, item_id, editable, magic, item_class_id) VALUES (5, 1, 60, 1, 1, 4);
INSERT INTO army_slot (id, army_single_model_id, item_id, editable, magic, item_class_id) VALUES (6, 1, 60, 1, 1, 4);
INSERT INTO army_slot (id, army_single_model_id, item_id, editable, magic, item_class_id) VALUES (7, 1, 60, 1, 1, 4);


INSERT INTO army_slot (id, army_single_model_id, item_id, editable, magic, item_class_id) VALUES (8, 2, 5, 0, 0, 0);
INSERT INTO army_slot (id, army_single_model_id, item_id, editable, magic, item_class_id) VALUES (9, 2, 31, 0, 0, 1);
INSERT INTO army_slot (id, army_single_model_id, item_id, editable, magic, item_class_id) VALUES (10, 2, 41, 0, 0, 3);

INSERT INTO army_slot (id, army_single_model_id, item_id, editable, magic, item_class_id) VALUES (11, 4, 1, 0, 0, 0);
INSERT INTO army_slot (id, army_single_model_id, item_id, editable, magic, item_class_id) VALUES (12, 4, 41, 0, 0, 3);
INSERT INTO army_slot (id, army_single_model_id, item_id, editable, magic, item_class_id) VALUES (13, 4, 11, 0, 0, 2);


COMMIT;