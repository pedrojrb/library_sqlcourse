/* Trigger utilizado para registrar cada vez que se elimine un libro de la tabla libro */

 CREATE TRIGGER `bef_del_libro`
 BEFORE DELETE ON libro
 FOR EACH ROW
 INSERT INTO log_tabla_libro
 VALUES (current_timestamp(),user(),database(),version());
 
 /* Trigger utilizado para registrar cada vez que se actualice un libro de la tabla libro
 Tendremos un chequeo de que libro fue actualizado, hora de ejecucion, usuario de ejecucion, base de datos y version en la cual se llevo a cabo dicha accion
 */ 
 
 CREATE TRIGGER `aft_updt_libro`
 AFTER UPDATE ON libro
 FOR EACH ROW
 INSERT INTO log_libros_actualizados
 VALUES (new.id_libro,current_timestamp(),user(),database(),version());
 
 SET sql_safe_updates=0;