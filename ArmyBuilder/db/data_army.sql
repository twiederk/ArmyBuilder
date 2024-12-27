PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;


INSERT INTO army VALUES(1, 'Armee der Hochelfen von Tyr');


INSERT INTO unit VALUES(1, 1, 'Generalseinheit');
INSERT INTO unit VALUES(2, 1, 'Streitwagen');


INSERT INTO unit_main_model (id, unit_id, main_model_id, count) VALUES(1, 1, 11506, 1);
INSERT INTO unit_main_model (id, unit_id, main_model_id, count) VALUES(2, 1, 11904, 20);
INSERT INTO unit_main_model (id, unit_id, main_model_id, count) VALUES(3, 2, 12113, 1);


COMMIT;