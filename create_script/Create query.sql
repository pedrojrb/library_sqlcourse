CREATE DATABASE library;

USE library;

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
numero int,
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
ADD precio DECIMAL NOT NULL;

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
