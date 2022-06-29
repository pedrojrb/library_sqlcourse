
/* INSERT DATA IN CIUDAD TABLE */
 
INSERT INTO ciudad (nombre,id_pais) VALUES
('Rosario',1),
 ('Rafaela',1),
 ('Ciudad Autonoma de Buenos Aires',1),
 ('Montevideo',2),
 ("Salto",2),
 ('Ciudad de la Costa',2);
 
 INSERT INTO usuario (id_direccion,nombre,apellido,email,username, password) VALUES
(1,"Pedro","Ruiz Baleani","ruizbaleanipedro@gmail.com","pruiz","123"),
(2,"Yair","Amero","yairamero@gmail.com","yamero","123"),
(3,"Jose","Esquivel","joseesquivel@gmail.com","jesquivel", "123");

INSERT INTO AUTOR (nombre,apellido,id_pais) VALUES
("Jorge Luis", "Borges",1),
("Pablo", "Neruda",4),
("Maria Rosa", "Lojo",1);

INSERT INTO CATEGORIA (nombre) VALUES
("Cientificos"),
("Literatura y linguisticos"),
("Biografias");

INSERT INTO GENERO (nombre) VALUES
("Narrativo"),
("Dramatico"),
("Didactico");

INSERT INTO EDITORIAL (nombre,id_pais) VALUES
("Atlantida Editorial",1),
("Ampersand Editorial",1),
("Acantilado Editorial",5),
("Aguilar Editorial",5);

INSERT INTO LIBRO (id_autor,id_categoria,id_genero,id_editorial,titulo,paginas,fecha,precio) VALUES
(1,2,1,1,"Libro sobre las rosas",250,"2015-02-12",500),
(3,1,1,4,"Ciencia es pasion",567,"2011-08-11", 800),
(2,3,3,3,"Historia de una velada",182,"2010-12-12", 600);

 INSERT INTO FACTURA(fecha,id_usuario) VALUES 
 ('2022-10-10 08:48:54',2),
 ('2022-07-07 14:18:01',3),
 ('2022-02-02 10:28:21',1),
 ('2022-02-02 11:45:51',2),
 ('2022-05-21 09:28:11',2),
 ('2022-03-22 15:18:45',1);
 
 INSERT INTO FACTURA_DETALLE (id_libro,id_factura,cantidad) VALUES
 (1,1,3),
 (2,1,1),
 (2,2,2),
 (1,2,5),
 (3,3,1),
 (1,3,1),
 (2,5,3);

 /* Test about data saved after insert it */
 
 SELECT * FROM PAIS;
 SELECT * FROM CIUDAD;
 SELECT * FROM DOMICILIO;
 SELECT * FROM USUARIO;
 SELECT * FROM AUTOR;
 SELECT * FROM CATEGORIA;
 SELECT * FROM GENERO;
 SELECT * FROM EDITORIAL;
 SELECT * FROM LIBRO;
 SELECT * FROM FACTURA;
 