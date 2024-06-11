CREATE DATABASE sonrisa_sleep;
USE sonrisa_sleep;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    edad INT NOT NULL
);

CREATE TABLE Medico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cedula VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE cita_medica (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    medico_id INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    motivo VARCHAR(255) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (medico_id) REFERENCES Medico(id)
);

CREATE TABLE Especialidades_Medico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    medico_id INT NOT NULL,
    FOREIGN KEY (medico_id) REFERENCES Medico(id)
);

CREATE TABLE Diagnostico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    tiempo DATE NOT NULL,
    playlist_id TEXT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE playlist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    diagnostico_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (diagnostico_id) REFERENCES Diagnostico(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE multimedia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    archivo VARCHAR(255) NOT NULL,
    fecha_subida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

INSERT INTO Medico (nombre, cedula) VALUES 
('Dr. Luis Ram�rez', '1234567890'),
('Dra. Ana Gonz�lez', '2345678901'),
('Dr. Javier Mart�nez', '3456789012'),
('Dra. Mar�a S�nchez', '4567890123'),
('Dr. Carlos L�pez', '5678901234'),
('Dra. Laura P�rez', '6789012345'),
('Dr. Juan Rodr�guez', '7890123456'),
('Dra. Andrea Mart�n', '8901234567'),
('Dr. Alejandro G�mez', '9012345678'),
('Dra. Patricia Hern�ndez', '0123456789');

INSERT INTO usuarios (nombre, apellido, email, edad) VALUES 
('Juan', 'P�rez', 'juan@example.com', 30),
('Mar�a', 'Garc�a', 'maria@example.com', 25),
('Pedro', 'L�pez', 'pedro@example.com', 35),
('Ana', 'Mart�nez', 'ana@example.com', 28),
('Luis', 'S�nchez', 'luis@example.com', 40),
('Laura', 'Rodr�guez', 'laura@example.com', 22),
('Carlos', 'Fern�ndez', 'carlos@example.com', 33),
('Sara', 'G�mez', 'sara@example.com', 27),
('Javier', 'D�az', 'javier@example.com', 32),
('Elena', 'Alvarez', 'elena@example.com', 29);

INSERT INTO cita_medica (usuario_id, medico_id, fecha_hora, motivo) VALUES 
(1, 3, '2024-04-15 10:00:00', 'Insomnio cr�nico'),
(2, 4, '2024-04-16 11:30:00', 'Apnea del sue�o'),
(3, 5, '2024-04-17 09:45:00', 'Narcolepsia'),
(4, 6, '2024-04-18 14:15:00', 'Par�lisis del sue�o'),
(5, 7, '2024-04-19 16:00:00', 'S�ndrome de piernas inquietas'),
(6, 8, '2024-04-20 13:00:00', 'Bruxismo'),
(7, 9, '2024-04-21 10:45:00', 'Trastorno del sue�o relacionado con la depresi�n'),
(8, 10, '2024-04-22 08:30:00', 'Somnambulismo'),
(9, 9, '2024-04-23 12:30:00', 'Bruxismo'),
(10, 10, '2024-04-24 15:30:00', 'S�ndrome de fase de sue�o retrasado');

INSERT INTO Especialidades_Medico (nombre, medico_id) VALUES 
('Medicina del Sue�o', 1),
('Neurolog�a del Sue�o', 2),
('Psiquiatr�a del Sue�o', 3),
('Otorrinolaringolog�a del Sue�o', 4),
('Pediatr�a del Sue�o', 5),
('Medicina Interna del Sue�o', 6),
('Neumolog�a del Sue�o', 7),
('Endocrinolog�a del Sue�o', 8),
('Cardiolog�a del Sue�o', 9),
('Psicolog�a del Sue�o', 10);

INSERT INTO Diagnostico (usuario_id, tiempo, playlist_id) VALUES 
(1, '2024-04-15', 'playlist_trastorno_sueno_1'),
(2, '2024-04-14', 'playlist_trastorno_sueno_2'),
(3, '2024-04-13', 'playlist_trastorno_sueno_3'),
(4, '2024-04-12', 'playlist_trastorno_sueno_4'),
(5, '2024-04-11', 'playlist_trastorno_sueno_5'),
(6, '2024-04-10', 'playlist_trastorno_sueno_6'),
(7, '2024-04-09', 'playlist_trastorno_sueno_7'),
(8, '2024-04-08', 'playlist_trastorno_sueno_8'),
(9, '2024-04-07', 'playlist_trastorno_sueno_9'),
(10, '2024-04-06', 'playlist_trastorno_sueno_10');

INSERT INTO playlist (usuario_id, diagnostico_id, nombre, descripcion) VALUES 
(1, 1, 'Playlist 1', 'Descripci�n de la playlist 1'),
(2, 2, 'Playlist 2', 'Descripci�n de la playlist 2'),
(3, 3, 'Playlist 3', 'Descripci�n de la playlist 3'),
(4, 4, 'Playlist 4', 'Descripci�n de la playlist 4'),
(5, 5, 'Playlist 5', 'Descripci�n de la playlist 5'),
(6, 6, 'Playlist 6', 'Descripci�n de la playlist 6'),
(7, 7, 'Playlist 7', 'Descripci�n de la playlist 7'),
(8, 8, 'Playlist 8', 'Descripci�n de la playlist 8'),
(9, 9, 'Playlist 9', 'Descripci�n de la playlist 9'),
(10, 10, 'Playlist 10', 'Descripci�n de la playlist 10');

INSERT INTO multimedia (tipo, titulo, descripcion, archivo, usuario_id) VALUES 
('Video', 'Trastornos del sue�o: Causas y consecuencias', 'Este video explora las causas y consecuencias de los trastornos del sue�o.', 'video_trastornos_sueno1.mp4', 1),
('Art�culo', 'Gu�a completa sobre el insomnio', 'Este art�culo ofrece una gu�a completa sobre el insomnio, sus s�ntomas y posibles tratamientos.', 'guia_insomnio.pdf', 2),
('Podcast', 'Entrevista con un especialista en trastornos del sue�o', 'Escucha esta entrevista con un especialista en trastornos del sue�o para obtener m�s informaci�n sobre el tema.', 'podcast_trastornos_sueno.mp3', 3),
('Imagen', 'Infograf�a: Tipos de trastornos del sue�o', 'Esta infograf�a detalla los diferentes tipos de trastornos del sue�o, desde el insomnio hasta la apnea del sue�o.', 'infografia_trastornos_sueno.png', 4),
('Video', 'Consecuencias del s�ndrome de piernas inquietas', 'En este video se explican las posibles consecuencias del s�ndrome de piernas inquietas en la calidad de vida.', 'video_piernas_inquietas.mp4', 5),
('Art�culo', 'C�mo mejorar la higiene del sue�o', 'Descubre consejos pr�cticos para mejorar la higiene del sue�o y prevenir trastornos relacionados.', 'mejorar_higiene_sueno.html', 6),
('Podcast', 'Historias de personas con narcolepsia', 'Este podcast presenta historias reales de personas que viven con narcolepsia y c�mo manejan su condici�n.', 'narcolepsia_historias.mp3', 7),
('Imagen', 'Ilustraci�n: Ciclo del sue�o', 'Esta ilustraci�n muestra el ciclo completo del sue�o y las diferentes etapas del mismo.', 'ilustracion_ciclo_sueno.jpg', 8),
('Video', 'Entendiendo la apnea del sue�o', 'Aprende m�s sobre la apnea del sue�o y su impacto en la salud en este video educativo.', 'video_apnea_sueno.mp4', 9),
('Art�culo', 'Efectos del sue�o fragmentado en el rendimiento cognitivo', 'Lee este art�culo para conocer c�mo el sue�o fragmentado puede afectar el rendimiento cognitivo y la concentraci�n.', 'efectos_sueno_fragmentado.pdf', 10);


SELECT usuarios.nombre, usuarios.apellido, cita_medica.fecha_hora, cita_medica.motivo
FROM usuarios
INNER JOIN cita_medica ON usuarios.id = cita_medica.usuario_id;

SELECT usuarios.nombre, usuarios.apellido, Diagnostico.tiempo, Diagnostico.playlist_id
FROM usuarios
INNER JOIN Diagnostico ON usuarios.id = Diagnostico.usuario_id;

SELECT usuarios.nombre, usuarios.apellido, playlist.name, playlist.description
FROM usuarios
INNER JOIN playlist ON usuarios.id = playlist.usuario_id;

SELECT usuarios.nombre, usuarios.apellido, multimedia.tipo, multimedia.titulo
FROM usuarios
INNER JOIN multimedia ON usuarios.id = multimedia.usuario_id;

SELECT Medico.nombre, Especialidades_Medico.nombre AS especialidad
FROM Medico
INNER JOIN Especialidades_Medico ON Medico.id = Especialidades_Medico.medico_id;

CREATE VIEW vista_usuario AS
SELECT * FROM usuarios;

CREATE VIEW vista_citas_medicas AS
SELECT u.nombre, u.apellido, c.fecha_hora, c.motivo
FROM usuarios u
JOIN cita_medica c ON u.id = c.usuario_id;

CREATE VIEW vista_medicos_especialidades AS
SELECT m.nombre AS nombre_medico, em.nombre AS especialidad
FROM Medico m
JOIN Especialidades_Medico em ON m.id = em.medico_id;

CREATE VIEW multimedia_usuario_playlist AS
SELECT u.nombre, u.apellido, m.titulo, m.descripcion
FROM usuarios u
JOIN Diagnostico d ON u.id = d.usuario_id
JOIN playlist p ON d.id = p.diagnostico_id
JOIN multimedia m ON u.id = m.usuario_id;

SELECT * FROM vista_usuario;
SELECT * FROM vista_citas_medicas;
SELECT * FROM vista_medicos_especialidades;
SELECT * FROM multimedia_usuario_playlist;
