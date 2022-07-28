SELECT * FROM autor ORDER BY id_autor desc;

SET AUTOCOMMIT = 0;
SELECT @@AUTOCOMMIT;

-- Elimina registros desde el autor con id 90 al 103--

START TRANSACTION;
	DELETE FROM
    autor
    WHERE
    id_autor >= 90;
    
ROLLBACK;
COMMIT;

-- Inserta registros en la tabla país --

SELECT * FROM PAIS;

START TRANSACTION;
	INSERT INTO pais (nombre) VALUES ("Canada");
    INSERT INTO pais (nombre) VALUES ("Portugal");
    INSERT INTO pais (nombre) VALUES ("Polonia");
    INSERT INTO pais (nombre) VALUES ("Ucrania");
    savepoint first_backup;
    INSERT INTO pais (nombre) VALUES ("Rusia");
    INSERT INTO pais (nombre) VALUES ("Francia");
    INSERT INTO pais (nombre) VALUES ("Italia");
    INSERT INTO pais (nombre) VALUES ("Escocia");
    savepoint second_backup;
    
    -- RELEASE first_backup; --
