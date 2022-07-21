/* 
---------------------------------
CREACION TANTO DE BASE DE DATOS COMO DE CADA TABLA 

----------------------------------
*/

CREATE DATABASE libraryRuizBaleani;

USE libraryRuizBaleani;

/* CREATE TABLES */

CREATE TABLE PAIS (
id_pais int not null auto_increment,
nombre varchar(40) not null unique,
PRIMARY KEY (id_pais)
);

CREATE TABLE CIUDAD (
id_ciudad int not null auto_increment,
nombre varchar(50) not null,
id_pais int,
PRIMARY KEY (id_ciudad),
FOREIGN KEY (id_pais) REFERENCES PAIS(id_pais)
);

CREATE TABLE DOMICILIO (
id_direccion int not null auto_increment,
calle varchar(50) not null,
numero varchar(50),
piso varchar(20),
apartamento varchar(20),
id_ciudad int,
PRIMARY KEY (id_direccion),
FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
);

CREATE TABLE USUARIO (
id_usuario int not null auto_increment,
id_direccion int,
nombre varchar(40) not null,
apellido varchar(50) not null,
email varchar(50) not null unique,
username varchar(10) not null unique,
password varchar(20) not null,
PRIMARY KEY (id_usuario),
FOREIGN KEY (id_direccion) REFERENCES DOMICILIO(id_direccion)
);

CREATE TABLE DOMICILIO_USUARIO(
id_domicilio_usuario int not null auto_increment,
id_direccion int,
id_usuario int,
PRIMARY KEY (id_domicilio_usuario),
FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
FOREIGN KEY (id_direccion) REFERENCES DOMICILIO(id_direccion)
);



CREATE TABLE AUTOR (
id_autor int not null auto_increment,
nombre varchar(30) not null,
apellido varchar(50) not null,
id_pais int,
PRIMARY KEY (id_autor),
FOREIGN KEY (id_pais) references PAIS(id_pais)
);

CREATE TABLE CATEGORIA (
id_categoria int not null auto_increment,
nombre varchar(40) not null unique,
PRIMARY KEY (id_categoria)
);

CREATE TABLE GENERO (
id_genero int not null auto_increment,
nombre varchar(40) not null unique,
PRIMARY KEY (id_genero)
);

CREATE TABLE EDITORIAL (
id_editorial int not null auto_increment,
nombre varchar(40) not null,
id_pais int,
PRIMARY KEY (id_editorial),
FOREIGN KEY (id_pais) REFERENCES PAIS(id_pais)
);

CREATE TABLE LIBRO (
id_libro int not null auto_increment,
id_autor int,
id_categoria int,
id_genero int,
id_editorial int,
titulo varchar(40) not null,
paginas int not null,
fecha date,
PRIMARY KEY (id_libro),
FOREIGN KEY (id_autor) REFERENCES AUTOR(id_autor),
FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria),
FOREIGN KEY (id_genero) REFERENCES GENERO(id_genero),
FOREIGN KEY (id_editorial) REFERENCES EDITORIAL(id_editorial)
);

-- Add field precio for book table --

ALTER TABLE LIBRO
ADD precio float NOT NULL;


CREATE TABLE LOG_LIBROS_ACTUALIZADOS(
id_libro int not null,
fecha_hora datetime,
usuario varchar(50),
bd varchar(20),
version varchar (20)
);


CREATE TABLE FACTURA (
id_factura int not null auto_increment,
fecha datetime,
id_usuario int,
PRIMARY KEY (id_factura),
FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

CREATE TABLE FACTURA_DETALLE (
id_factura_detalle int not null auto_increment,
id_libro int,
id_factura int,
cantidad int not null,
PRIMARY KEY (id_factura_detalle),
FOREIGN KEY (id_libro) REFERENCES LIBRO(id_libro),
FOREIGN KEY (id_factura) REFERENCES FACTURA (id_factura)
);

CREATE TABLE LOG_TABLA_LIBRO (
fecha_hora datetime,
usuario varchar(100),
bd varchar(100),
version varchar(20)
);


/* 
---------------------------------
INSERCIÓN DE DATOS EN CADA TABLA 

----------------------------------
*/

insert into ciudad (nombre, id_pais) VALUES
("San Miguel de Tucuman", 1);

insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Dexter', 25, null, null, 1);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Vidon', 13, 23, 'm', 2);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Riverside', 17, null, null, 3);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Old Gate', 21, null, null, 4);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Paget', 15, null, null, 5);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('South', 7, null, null, 6);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Memorial', 5, null, null, 7);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Sachs', 2, null, null, 8);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Fisk', 22, null, null, 9);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Monica', 13, null, null, 10);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Bowman', 8, null, null, 11);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Harbort', 14, null, null, 12);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Forest Dale', 18, 17, 'd', 13);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Mcguire', 17, null, null, 14);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('American Ash', 14, null, null, 15);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Kensington', 3, null, null, 16);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Spaight', 4, null, null, 17);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Rowland', 5, null, null, 18);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Hazelcrest', 11, null, null, 19);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Waubesa', 11, null, null, 20);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Bartelt', 19, null, null, 21);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Chive', 17, 8, 'k', 22);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Melvin', 2, null, null, 23);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Logan', 19, null, null, 24);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Service', 20, null, null, 25);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Larry', 3, null, null, 26);
insert into domicilio (calle, numero, piso, apartamento, id_ciudad) values ('Oakridge', 15, null, null, 27);

INSERT INTO usuario (id_direccion,nombre,apellido,email,username, password) VALUES
(1,"Pedro","Ruiz Baleani","ruizbaleanipedro@gmail.com","pruiz","123"),
(2,"Yair","Amero","yairamero@gmail.com","yamero","123"),
(3,"Julia","Moreno","juliamoreno@gmail.com","jmoreno", "123"),
(3,"Monica","Celeste","monicaceleste@gmail.com","mceleste", "123"),
(3,"Teresa","Raymundo","teresaraymundo@hotmail.com","traymundo", "123");


INSERT INTO AUTOR (nombre,apellido,id_pais) VALUES
("Jorge Luis", "Borges",1),
("Pablo", "Neruda",4),
("Maria Rosa", "Lojo",1);
insert into autor (nombre, apellido, id_pais) values ('Padriac', 'Cussins', 4);
insert into autor (nombre, apellido, id_pais) values ('Tedmund', 'Piris', 5);
insert into autor (nombre, apellido, id_pais) values ('Emalee', 'Smythin', 3);
insert into autor (nombre, apellido, id_pais) values ('Poul', 'Itzkovsky', 4);
insert into autor (nombre, apellido, id_pais) values ('Judon', 'Farrow', 3);
insert into autor (nombre, apellido, id_pais) values ('Borden', 'Frenchum', 4);
insert into autor (nombre, apellido, id_pais) values ('Perry', 'Emmot', 5);
insert into autor (nombre, apellido, id_pais) values ('Miner', 'Norssister', 1);
insert into autor (nombre, apellido, id_pais) values ('Ethelind', 'Sutliff', 4);
insert into autor (nombre, apellido, id_pais) values ('Barbey', 'Meah', 4);
insert into autor (nombre, apellido, id_pais) values ('Xenos', 'Daborn', 4);
insert into autor (nombre, apellido, id_pais) values ('Quintina', 'Rodwell', 5);
insert into autor (nombre, apellido, id_pais) values ('Luce', 'Bayldon', 2);
insert into autor (nombre, apellido, id_pais) values ('Hersch', 'Denes', 3);
insert into autor (nombre, apellido, id_pais) values ('Herold', 'Friel', 1);
insert into autor (nombre, apellido, id_pais) values ('Hettie', 'Raulin', 2);
insert into autor (nombre, apellido, id_pais) values ('Dawna', 'Bardsley', 1);
insert into autor (nombre, apellido, id_pais) values ('Dian', 'Romaines', 1);
insert into autor (nombre, apellido, id_pais) values ('Ava', 'Aymeric', 4);
insert into autor (nombre, apellido, id_pais) values ('Eustace', 'Cawdell', 3);
insert into autor (nombre, apellido, id_pais) values ('Dagmar', 'Steger', 1);
insert into autor (nombre, apellido, id_pais) values ('Alix', 'Tomaselli', 5);
insert into autor (nombre, apellido, id_pais) values ('Romain', 'Heinl', 2);
insert into autor (nombre, apellido, id_pais) values ('Bran', 'Pail', 5);
insert into autor (nombre, apellido, id_pais) values ('Lorin', 'Garnsey', 2);
insert into autor (nombre, apellido, id_pais) values ('Maurizia', 'Ainger', 2);
insert into autor (nombre, apellido, id_pais) values ('Norry', 'Pattrick', 2);
insert into autor (nombre, apellido, id_pais) values ('Bernice', 'Sandry', 2);
insert into autor (nombre, apellido, id_pais) values ('Edgard', 'Jones', 4);
insert into autor (nombre, apellido, id_pais) values ('Sloan', 'Croneen', 4);
insert into autor (nombre, apellido, id_pais) values ('Welbie', 'Sambells', 1);
insert into autor (nombre, apellido, id_pais) values ('Della', 'Carcass', 6);
insert into autor (nombre, apellido, id_pais) values ('Edeline', 'Moorhead', 6);
insert into autor (nombre, apellido, id_pais) values ('Tania', 'Rawne', 6);
insert into autor (nombre, apellido, id_pais) values ('Valentina', 'Fitzsymons', 6);
insert into autor (nombre, apellido, id_pais) values ('Eugine', 'Ughini', 2);
insert into autor (nombre, apellido, id_pais) values ('Leland', 'Brownbridge', 4);
insert into autor (nombre, apellido, id_pais) values ('Gilli', 'Plose', 3);
insert into autor (nombre, apellido, id_pais) values ('Adolphus', 'Confait', 5);
insert into autor (nombre, apellido, id_pais) values ('Muire', 'Concannon', 5);
insert into autor (nombre, apellido, id_pais) values ('Arlina', 'Shiel', 4);
insert into autor (nombre, apellido, id_pais) values ('Rodrick', 'Merigot', 2);
insert into autor (nombre, apellido, id_pais) values ('Rakel', 'Perry', 2);
insert into autor (nombre, apellido, id_pais) values ('Noami', 'Blamire', 6);
insert into autor (nombre, apellido, id_pais) values ('Dav', 'Beevens', 3);
insert into autor (nombre, apellido, id_pais) values ('Keenan', 'Oene', 5);
insert into autor (nombre, apellido, id_pais) values ('Ddene', 'Laible', 1);
insert into autor (nombre, apellido, id_pais) values ('Margeaux', 'Mielnik', 2);
insert into autor (nombre, apellido, id_pais) values ('Heidi', 'De Ferraris', 1);
insert into autor (nombre, apellido, id_pais) values ('Barney', 'Klein', 6);
insert into autor (nombre, apellido, id_pais) values ('Violette', 'Chaddock', 3);
insert into autor (nombre, apellido, id_pais) values ('Lorena', 'Hazart', 6);
insert into autor (nombre, apellido, id_pais) values ('Thebault', 'Roughley', 4);
insert into autor (nombre, apellido, id_pais) values ('Betteanne', 'Donohue', 6);
insert into autor (nombre, apellido, id_pais) values ('Uri', 'Merrgan', 4);
insert into autor (nombre, apellido, id_pais) values ('Bryn', 'Pole', 2);
insert into autor (nombre, apellido, id_pais) values ('Lula', 'Edmett', 6);
insert into autor (nombre, apellido, id_pais) values ('Hayden', 'Penk', 6);
insert into autor (nombre, apellido, id_pais) values ('Filbert', 'Keggin', 2);
insert into autor (nombre, apellido, id_pais) values ('Toddie', 'Spendlove', 3);
insert into autor (nombre, apellido, id_pais) values ('Gordy', 'Linforth', 2);
insert into autor (nombre, apellido, id_pais) values ('Kacey', 'Passey', 1);
insert into autor (nombre, apellido, id_pais) values ('Nickolaus', 'Jardin', 5);
insert into autor (nombre, apellido, id_pais) values ('Kristian', 'Cawkwell', 1);
insert into autor (nombre, apellido, id_pais) values ('Blythe', 'Foard', 4);
insert into autor (nombre, apellido, id_pais) values ('Domini', 'Arnopp', 1);
insert into autor (nombre, apellido, id_pais) values ('Eberhard', 'Acory', 1);
insert into autor (nombre, apellido, id_pais) values ('Gilly', 'Deetlefs', 5);
insert into autor (nombre, apellido, id_pais) values ('Marty', 'Reignard', 4);
insert into autor (nombre, apellido, id_pais) values ('Linea', 'Heasman', 3);
insert into autor (nombre, apellido, id_pais) values ('Delmore', 'Poetz', 5);
insert into autor (nombre, apellido, id_pais) values ('Errol', 'Regorz', 4);
insert into autor (nombre, apellido, id_pais) values ('Cherish', 'Gilligan', 3);
insert into autor (nombre, apellido, id_pais) values ('Donnie', 'Dawidowsky', 3);
insert into autor (nombre, apellido, id_pais) values ('Kaiser', 'Cumberlidge', 6);
insert into autor (nombre, apellido, id_pais) values ('Adolphus', 'Levecque', 4);
insert into autor (nombre, apellido, id_pais) values ('Rodolph', 'Wiggall', 4);
insert into autor (nombre, apellido, id_pais) values ('Aluin', 'Causnett', 2);
insert into autor (nombre, apellido, id_pais) values ('Roxane', 'Yewen', 1);
insert into autor (nombre, apellido, id_pais) values ('Alysia', 'Scoyne', 6);
insert into autor (nombre, apellido, id_pais) values ('Krystyna', 'Collingham', 1);
insert into autor (nombre, apellido, id_pais) values ('Elisha', 'Dumper', 4);
insert into autor (nombre, apellido, id_pais) values ('Corina', 'Fullstone', 5);
insert into autor (nombre, apellido, id_pais) values ('Shalna', 'Kembry', 4);
insert into autor (nombre, apellido, id_pais) values ('Ally', 'Marsters', 3);
insert into autor (nombre, apellido, id_pais) values ('Maximo', 'Shorthouse', 1);
insert into autor (nombre, apellido, id_pais) values ('Remington', 'Bloxam', 3);
insert into autor (nombre, apellido, id_pais) values ('Alexandrina', 'Lomasny', 5);
insert into autor (nombre, apellido, id_pais) values ('Jenifer', 'Farey', 1);
insert into autor (nombre, apellido, id_pais) values ('Trent', 'Trussell', 6);
insert into autor (nombre, apellido, id_pais) values ('Martita', 'Chappell', 6);
insert into autor (nombre, apellido, id_pais) values ('Ulrike', 'Dyott', 1);
insert into autor (nombre, apellido, id_pais) values ('Rowland', 'Sansam', 5);
insert into autor (nombre, apellido, id_pais) values ('Rhett', 'Boyes', 4);
insert into autor (nombre, apellido, id_pais) values ('Lorelei', 'Dressel', 3);
insert into autor (nombre, apellido, id_pais) values ('Erina', 'Meany', 5);
insert into autor (nombre, apellido, id_pais) values ('Sonja', 'Mitten', 1);
insert into autor (nombre, apellido, id_pais) values ('Lenette', 'Rotham', 6);
insert into autor (nombre, apellido, id_pais) values ('Celinda', 'Whereat', 5);
insert into autor (nombre, apellido, id_pais) values ('Sydney', 'Spuner', 5);

INSERT INTO CATEGORIA (nombre) VALUES
("Cientificos"),
("Literatura y linguisticos"),
("Biografias"),
('Monografias'),
('Libro de texto'),
('Arte'),
('Viaje');


INSERT INTO GENERO (nombre) VALUES
("Narrativo"),
("Dramatico"),
("Didactico"),
('Ficcion'),
('Misterio'),
('Fantasia');

INSERT INTO EDITORIAL (nombre,id_pais) VALUES
("Atlantida Editorial",1),
("Ampersand Editorial",1),
("Acantilado Editorial",5),
("Aguilar Editorial",5);
insert into editorial (nombre, id_pais) values ('Rhycero', 5);
insert into editorial (nombre, id_pais) values ('Quinu', 5);
insert into editorial (nombre, id_pais) values ('Rhynyx', 6);
insert into editorial (nombre, id_pais) values ('Wikido', 3);
insert into editorial (nombre, id_pais) values ('Ooba', 3);
insert into editorial (nombre, id_pais) values ('Livefish', 6);
insert into editorial (nombre, id_pais) values ('Twitterlist', 6);
insert into editorial (nombre, id_pais) values ('Jamia', 1);
insert into editorial (nombre, id_pais) values ('Bluezoom', 5);
insert into editorial (nombre, id_pais) values ('Buzzdog', 1);
insert into editorial (nombre, id_pais) values ('Zava', 1);
insert into editorial (nombre, id_pais) values ('Jabbertype', 5);
insert into editorial (nombre, id_pais) values ('Rhycero', 6);
insert into editorial (nombre, id_pais) values ('Mudo', 3);
insert into editorial (nombre, id_pais) values ('Mynte', 4);
insert into editorial (nombre, id_pais) values ('Kwimbee', 2);
insert into editorial (nombre, id_pais) values ('Youtags', 4);
insert into editorial (nombre, id_pais) values ('Rhyzio', 5);
insert into editorial (nombre, id_pais) values ('Skinte', 5);
insert into editorial (nombre, id_pais) values ('Yamia', 6);
insert into editorial (nombre, id_pais) values ('Eimbee', 5);
insert into editorial (nombre, id_pais) values ('Jaloo', 1);
insert into editorial (nombre, id_pais) values ('Ozu', 1);
insert into editorial (nombre, id_pais) values ('Skippad', 5);
insert into editorial (nombre, id_pais) values ('Kimia', 2);
insert into editorial (nombre, id_pais) values ('Aimbu', 6);
insert into editorial (nombre, id_pais) values ('Edgepulse', 5);
insert into editorial (nombre, id_pais) values ('Yodel', 3);
insert into editorial (nombre, id_pais) values ('Leenti', 6);
insert into editorial (nombre, id_pais) values ('Flipopia', 6);
insert into editorial (nombre, id_pais) values ('Yakidoo', 6);
insert into editorial (nombre, id_pais) values ('Devcast', 4);
insert into editorial (nombre, id_pais) values ('Meemm', 1);
insert into editorial (nombre, id_pais) values ('Babbleset', 4);
insert into editorial (nombre, id_pais) values ('Thoughtbeat', 5);
insert into editorial (nombre, id_pais) values ('LiveZ', 2);
insert into editorial (nombre, id_pais) values ('Skynoodle', 5);
insert into editorial (nombre, id_pais) values ('Voonte', 2);
insert into editorial (nombre, id_pais) values ('Trilith', 3);
insert into editorial (nombre, id_pais) values ('Buzzbean', 5);


insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (43, 7, 1, 37, 'Flexidy', 5370, '2016-12-12', 29819.56);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (74, 2, 6, 16, 'Redhold', 1738, '1946-10-08', 48184.44);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (3, 1, 5, 12, 'Rank', 9890, '1940-03-16', 43465.56);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (16, 5, 3, 11, 'Tresom', 713, '1928-05-29', 86196.55);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (15, 2, 1, 17, 'Konklab', 2543, '1926-03-14', 11938.63);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (71, 5, 1, 43, 'Y-find', 6410, '1931-03-09', 30051.7);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (24, 7, 3, 31, 'Bigtax', 9844, '2012-09-01', 2969.85);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (67, 1, 6, 36, 'Konklab', 5214, '1994-12-24', 75733.21);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (24, 7, 5, 31, 'Voltsillam', 480, '1962-11-17', 76017.72);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (14, 3, 4, 12, 'Transcof', 4181, '1940-07-23', 7302.23);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (60, 6, 1, 33, 'Konklux', 5113, '1941-07-09', 56928.92);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (62, 7, 3, 36, 'Zathin', 3367, '1958-04-06', 76625.68);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (83, 2, 4, 28, 'Konklux', 614, '1923-05-03', 2628.46);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (60, 4, 1, 22, 'Redhold', 5183, '2010-09-19', 39704.12);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (99, 5, 6, 4, 'Sub-Ex', 5596, '1936-09-13', 81703.6);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (13, 6, 6, 9, 'Greenlam', 1114, '1941-01-31', 43192.25);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (64, 7, 4, 12, 'Zamit', 1187, '2000-02-26', 42882.46);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (43, 3, 4, 36, 'Lotstring', 6870, '1930-05-30', 48612.23);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (68, 1, 4, 19, 'Zamit', 5310, '1993-02-19', 96116.34);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (51, 4, 4, 7, 'Overhold', 1677, '1931-11-22', 45931.2);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (79, 7, 6, 11, 'Hatity', 7241, '2005-09-30', 89554.05);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (100, 2, 4, 4, 'Viva', 6428, '2006-03-27', 63066.55);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (38, 6, 4, 13, 'Fixflex', 7690, '2006-03-07', 5433.88);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (17, 5, 4, 7, 'Cardguard', 1553, '1932-03-05', 61365.04);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (51, 3, 6, 8, 'Andalax', 6737, '1995-12-31', 47017.29);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (25, 2, 5, 2, 'Cookley', 4675, '1958-01-25', 35084.61);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (61, 1, 2, 2, 'Veribet', 4719, '2001-01-28', 57630.3);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (73, 5, 1, 20, 'Bigtax', 5641, '1922-02-06', 39506.76);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (51, 2, 1, 5, 'Lotlux', 8149, '1933-12-23', 92299.0);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (43, 5, 1, 31, 'Cookley', 6955, '1964-01-03', 92892.62);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (59, 1, 4, 37, 'Treeflex', 8423, '1996-11-05', 29303.48);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (31, 5, 1, 20, 'Transcof', 5404, '1964-01-10', 29114.39);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (48, 5, 6, 35, 'Daltfresh', 5874, '1975-04-18', 65752.72);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (16, 5, 1, 42, 'Veribet', 7247, '1978-09-12', 31958.47);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (69, 1, 1, 32, 'Pannier', 4888, '2006-04-24', 39590.05);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (101, 3, 2, 3, 'Greenlam', 8819, '1965-04-06', 38519.3);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (83, 3, 6, 39, 'Konklab', 3499, '2019-06-05', 91293.56);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (88, 5, 6, 29, 'Bitchip', 1720, '1974-07-10', 13921.36);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (80, 2, 1, 28, 'Voltsillam', 369, '1926-10-20', 78727.64);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (46, 4, 2, 1, 'Domainer', 8765, '1931-02-18', 33862.14);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (83, 4, 2, 19, 'Stringtough', 810, '1950-05-03', 15450.06);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (86, 4, 3, 21, 'Daltfresh', 527, '1926-07-08', 3414.89);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (70, 5, 2, 33, 'Aerified', 1667, '2015-04-06', 92445.84);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (24, 7, 6, 22, 'Stringtough', 4099, '1988-03-15', 93554.62);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (50, 2, 5, 32, 'Lotstring', 90, '1940-06-07', 89329.15);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (95, 2, 3, 18, 'Lotlux', 4194, '1976-06-26', 64903.96);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (66, 1, 1, 28, 'Y-Solowarm', 6577, '1998-05-09', 21986.86);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (7, 2, 1, 11, 'Namfix', 4782, '1980-05-21', 83856.73);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (51, 6, 2, 34, 'Sub-Ex', 813, '2002-08-08', 38214.13);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (96, 6, 3, 42, 'Latlux', 7384, '1961-03-12', 2839.78);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (66, 1, 1, 13, 'Domainer', 9282, '1953-10-02', 48576.77);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (36, 5, 1, 5, 'Stim', 2998, '1935-02-21', 8875.45);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (34, 5, 6, 3, 'Stim', 6744, '1997-01-11', 79211.72);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (28, 2, 2, 32, 'Konklab', 4054, '1936-05-04', 20131.12);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (60, 3, 2, 26, 'Stringtough', 4454, '1982-12-18', 45362.61);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (65, 5, 4, 34, 'Opela', 4745, '1968-03-28', 28788.01);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (49, 3, 4, 7, 'Latlux', 7183, '1986-06-05', 2716.05);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (92, 4, 4, 37, 'Bitchip', 621, '1995-02-13', 13010.12);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (95, 5, 6, 6, 'Alpha', 3625, '2004-05-16', 44706.82);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (1, 2, 3, 44, 'Alpha', 8114, '1968-03-21', 98235.91);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (77, 4, 3, 18, 'Holdlamis', 805, '1928-09-20', 37014.5);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (28, 4, 1, 23, 'Regrant', 9193, '1972-08-30', 90960.23);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (22, 1, 4, 35, 'Keylex', 3022, '1967-12-17', 48238.24);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (15, 7, 4, 39, 'Flowdesk', 8217, '2020-05-01', 61368.55);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (47, 5, 5, 8, 'Fix San', 7374, '2021-10-01', 91370.97);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (56, 3, 6, 6, 'Stim', 1291, '1948-04-06', 21909.56);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (19, 5, 5, 13, 'Tin', 8580, '1950-06-10', 28791.49);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (30, 7, 5, 37, 'Stringtough', 7367, '1977-11-03', 50200.57);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (28, 3, 1, 20, 'Flexidy', 7967, '1943-06-25', 37531.04);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (3, 2, 3, 17, 'Cookley', 3720, '1943-12-02', 61050.49);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (25, 6, 2, 20, 'Opela', 6016, '2003-08-08', 68044.68);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (59, 3, 4, 35, 'Konklux', 2851, '1924-04-06', 52721.5);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (73, 2, 4, 42, 'Lotstring', 139, '2016-01-29', 18225.32);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (50, 2, 1, 3, 'Redhold', 7830, '1973-03-08', 84709.69);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (28, 1, 4, 9, 'Aerified', 6926, '1944-10-03', 77979.34);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (98, 3, 5, 34, 'Fix San', 111, '1929-09-24', 27744.84);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (79, 6, 1, 2, 'Keylex', 8630, '1927-03-11', 25684.99);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (91, 6, 3, 22, 'Zaam-Dox', 3625, '1947-09-06', 57286.57);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (82, 1, 3, 42, 'Bigtax', 736, '2019-07-01', 21905.44);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (10, 3, 4, 25, 'Alpha', 1068, '1934-03-20', 34947.24);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (28, 7, 1, 16, 'Alpha', 2003, '1975-09-17', 40324.97);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (17, 5, 4, 6, 'Daltfresh', 2454, '1950-04-26', 6764.15);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (70, 5, 5, 8, 'Quo Lux', 6679, '1952-03-24', 87905.18);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (75, 3, 2, 31, 'Sonsing', 612, '1924-05-01', 10104.34);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (50, 7, 3, 9, 'Duobam', 6373, '1979-05-30', 86498.18);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (7, 2, 5, 19, 'Tres-Zap', 4818, '1954-08-26', 33813.3);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (27, 6, 1, 28, 'Gembucket', 4737, '2017-04-27', 19785.72);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (102, 1, 3, 27, 'Stringtough', 2718, '1968-10-05', 26703.38);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (93, 4, 6, 41, 'Stim', 3213, '1934-01-26', 66170.89);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (42, 6, 3, 1, 'Lotlux', 9810, '1942-04-13', 41501.14);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (89, 1, 5, 22, 'Quo Lux', 1233, '1933-04-09', 57894.29);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (36, 2, 5, 21, 'Trippledex', 414, '1945-11-28', 90340.73);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (95, 2, 2, 31, 'Asoka', 6782, '1985-01-12', 78677.47);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (38, 5, 5, 13, 'Tres-Zap', 3343, '1923-01-08', 71548.73);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (15, 4, 6, 5, 'Sonair', 5157, '2015-11-01', 4204.46);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (59, 6, 2, 4, 'Bitwolf', 9098, '2014-01-28', 29785.23);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (89, 1, 2, 39, 'Latlux', 7178, '2010-08-02', 14166.96);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (48, 1, 4, 7, 'Stringtough', 6356, '1971-06-12', 16027.13);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (75, 5, 1, 19, 'Greenlam', 4478, '2018-05-22', 29178.49);
insert into libro (id_autor, id_categoria, id_genero, id_editorial, titulo, paginas, fecha, precio) values (36, 1, 2, 1, 'Tin', 9131, '2007-01-13', 29030.31);


UPDATE libro 
SET titulo = "Flexigol", precio = 1.23
WHERE TITULO = 'Flexidy';
SELECT  * FROM libro WHERE titulo = 'Flexigol';

 INSERT INTO FACTURA(fecha,id_usuario) VALUES 
 ('2022-10-10 08:48:54',1),
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
 
/* 
---------------------------------
CREACION DE VISTAS

----------------------------------
 */
 
 
 CREATE VIEW usuarios
AS SELECT id_usuario,username,email FROM usuario;

CREATE VIEW autores_argentinos
AS SELECT nombre,apellido FROM autor;

CREATE VIEW libros_mayores_a_5000
AS SELECT titulo, fecha, precio FROM libro WHERE precio > 5000;

CREATE VIEW cantidad_libros_mayores_a_50
AS SELECT id_factura,cantidad FROM factura_detalle WHERE cantidad > 50;

CREATE VIEW libros_cientificos_y_biografias
AS SELECT nombre FROM categoria WHERE nombre = 'Biografias' OR nombre = 'Cientificos';
 
 /*
 ---------------------------------
CREACION DE FUNCIONES 

----------------------------------
 
 */
 
 /* FIRST FUNCTION */

CREATE DEFINER=`root`@`localhost` FUNCTION `CALCULATE_IVA`(price FLOAT) 
RETURNS float
NO SQL
BEGIN
	DECLARE IVA float;
    SET IVA = (precio * 0.21);
    RETURN IVA;
END

/*SECOND FUNCTION */

CREATE DEFINER=`root`@`localhost` FUNCTION `get_length_of_word`(word VARCHAR(50)) RETURNS int
    NO SQL
BEGIN
	DECLARE RESULT INT;
	SET RESULT = count(word);
    RETURN RESULT;
END

 /*
 ---------------------------------
CREACION DE STORED PROCEDURES 

----------------------------------
 
 */

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


 /*
 ---------------------------------
CREACION DE TRIGGERS

----------------------------------
 
 */

/* Trigger utilizado para registrar cada vez que se elimine un libro de la tabla libro */

 CREATE TRIGGER `bef_del_libro`
 BEFORE DELETE ON libro
 FOR EACH ROW
 INSERT INTO log_tabla_libro
 VALUES (current_timestamp(),user(),database(),version());
 
 /* TEST DE PRIMER TRIGGER */
 
 DELETE FROM LIBRO 
 WHERE ID_LIBRO = 15;
 
 SELECT * FROM log_tabla_libro;

 
 /* Trigger utilizado para registrar cada vez que se actualice un libro de la tabla libro
 Tendremos un chequeo de que libro fue actualizado, hora de ejecucion, usuario de ejecucion, base de datos y version en la cual se llevo a cabo dicha accion
 */ 
 
 CREATE TRIGGER `aft_updt_libro`
 AFTER UPDATE ON libro
 FOR EACH ROW
 INSERT INTO log_libros_actualizados
 VALUES (new.id_libro,current_timestamp(),user(),database(),version());
 
 SET sql_safe_updates=0;
 
/* TEST DE SEGUNDO TRIGGER */
 
UPDATE libro 
SET titulo = "Flexigol", precio = 500.23
WHERE TITULO = 'Flexidy';

SELECT * FROM LOG_LIBROS_ACTUALIZADOS;

 

 

