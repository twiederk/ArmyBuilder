PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;


INSERT INTO army (id, name, author, army_list_id, points) VALUES(1, 'Armee der Hochelfen von Tyr', 'Torsten', 7, 472);


INSERT INTO army_unit VALUES(1, 1, 'Generalseinheit');
INSERT INTO army_unit VALUES(2, 1, 'Streitwagen');


INSERT INTO army_main_model (id, army_unit_id, army_category_id, name, description, points, count) VALUES (1, 1, 0, 'General', '', 160, 1);
INSERT INTO army_main_model (id, army_unit_id, army_category_id, name, description, points, count) VALUES (2, 1, 1, 'Speerträger', '', 12, 20);
INSERT INTO army_main_model (id, army_unit_id, army_category_id, name, description, points, count) VALUES (3, 2, 2, 'Trianoc Streitwagen mit einem Elfen', '', 72, 1);

INSERT INTO army_single_model (id, profile_id, name, army_main_model_id, description, mount_status) VALUES (1, 11506, 'General', 1, '', 0);
INSERT INTO army_single_model (id, profile_id, name, army_main_model_id, description, mount_status) VALUES (2, 11904, 'Speerträger', 2, '', 0);
INSERT INTO army_single_model (id, profile_id, name, army_main_model_id, description, mount_status) VALUES (3, 12159, 'Streitwagen', 3, '', 0);
INSERT INTO army_single_model (id, profile_id, name, army_main_model_id, description, mount_status) VALUES (4, 12113, 'Streitwagenlenker', 3, '', 0);
INSERT INTO army_single_model (id, profile_id, name, army_main_model_id, description, mount_status) VALUES (5, 12034, 'Elfenroß', 3, '', 2);



COMMIT;