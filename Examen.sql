CREATE TABLE Autores(
    id_autor bigint identity(300,1) PRIMARY KEY,
    nombre VARCHAR(100),
    pais_origen VARCHAR(100)
    );

ALTER TABLE Comics
ADD id_autor bigint, 
FOREIGN KEY (id_autor) REFERENCES Autores(id_autor);


INSERT INTO Autores(nombre, pais_origen)VALUES ('Karen Roman', 'Estados Unidos');
INSERT INTO Autores(nombre, pais_origen)VALUES ('Elias Perez', 'Bélgica');
INSERT INTO Autores(nombre, pais_origen)VALUES ('Isaias Lopez', 'Japón');
INSERT INTO Autores(nombre, pais_origen)VALUES ('Abraham Perez', 'Reino Unido');

SELECT *FROM Comics;

UPDATE Comics SET id_autor = 301 WHERE id_comic = 10;
UPDATE Comics SET id_autor = 302 WHERE id_comic = 12;
UPDATE Comics SET id_autor = 303 WHERE id_comic = 14;
UPDATE Comics SET id_autor = 300 WHERE id_comic = 16;
UPDATE Comics SET id_autor = 301 WHERE id_comic = 18;
UPDATE Comics SET id_autor = 302 WHERE id_comic = 20;
UPDATE Comics SET id_autor = 303 WHERE id_comic = 22;
UPDATE Comics SET id_autor = 300 WHERE id_comic = 24;
UPDATE Comics SET id_autor = 301 WHERE id_comic = 26;
UPDATE Comics SET id_autor = 302 WHERE id_comic = 28;
UPDATE Comics SET id_autor = 302 WHERE id_comic = 30;

SELECT 
    C.id_comic,
    C.nombre AS comic_nombre,
    A.nombre AS autor_nombre,
    A.pais_origen
FROM 
    Comics C
LEFT JOIN 
    Autores A
ON 
    C.id_autor = A.id_autor;

SELECT
    C.id_venta,
    C.venta AS autores,
	A.venta AS venta_autor,

FROM 
   Ventas 

