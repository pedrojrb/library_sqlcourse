
/* ORDENA LA TABLA, POR EL CAMPO QUE LE PASEMOS POR PARAMETRO */

CREATE DEFINER=`root`@`localhost` PROCEDURE `ordenar_tabla_por_columna`(IN campo varchar(50), IN tabla varchar(50))
BEGIN
	IF campo <> '' THEN
		SET @orden_de_tabla = concat(' ORDER BY ', campo);
		SET @clausula = concat ('select * from ', tabla, ' ', @orden_de_tabla);
	ELSE
		SET @orden_tabla = '';
		SET @clausula = concat ('select * from ', tabla);
	END IF;
    
    PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    deallocate prepare runSQL;

END

/* INSERTA UNA NUEVA CATEGORIA */


CREATE DEFINER=`root`@`localhost` PROCEDURE `nueva_categoria`(IN nombre_categoria varchar(50))
BEGIN
	IF (SELECT count(*) FROM categoria WHERE lower(nombre) = lower(nombre_categoria)) = 0 THEN
		SET @insert_categoria = concat('INSERT INTO categoria(nombre_categoria) VALUES(',nombre_categoria, ')');
	END IF;
	PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    deallocate prepare runSQL;
END


CALL ordenar_tabla_por_columna("","ciudad", "");

CALL nueva_categoria('monografia');

/* 
Para ver el resultado del segundo Stored Procedures 

SELECT * FROM categoria 
*/
