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