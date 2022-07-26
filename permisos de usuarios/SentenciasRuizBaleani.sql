use Mysql;

-- EL PRIMER USUARIO TIENE PERMISOS SOLAMENTE DE CONSULTAR TODAS LAS TABLAS --

create user 'user1@localhost';

GRANT SELECT ON *.* TO 'user1@localhost';

SHOW GRANTS FOR 'user1@localhost';

-- ESTE USUARIO TIENE EL PERMISO DE LECTURA, MODIFICACION E INSERCIÓN DE DATOS --

create user 'user2@localhost';

GRANT SELECT, UPDATE, INSERT ON *.* TO 'user2@localhost';

SHOW GRANTS FOR 'user2@localhost';
