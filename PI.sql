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
('Dr. Luis Ramírez', '1234567890'),
('Dra. Ana González', '2345678901'),
('Dr. Javier Martínez', '3456789012'),
('Dra. María Sánchez', '4567890123'),
('Dr. Carlos López', '5678901234'),
('Dra. Laura Pérez', '6789012345'),
('Dr. Juan Rodríguez', '7890123456'),
('Dra. Andrea Martín', '8901234567'),
('Dr. Alejandro Gómez', '9012345678'),
('Dra. Patricia Hernández', '0123456789');

INSERT INTO usuarios (nombre, apellido, email, edad) VALUES 
('Juan', 'Pérez', 'juan@example.com', 30),
('María', 'García', 'maria@example.com', 25),
('Pedro', 'López', 'pedro@example.com', 35),
('Ana', 'Martínez', 'ana@example.com', 28),
('Luis', 'Sánchez', 'luis@example.com', 40),
('Laura', 'Rodríguez', 'laura@example.com', 22),
('Carlos', 'Fernández', 'carlos@example.com', 33),
('Sara', 'Gómez', 'sara@example.com', 27),
('Javier', 'Díaz', 'javier@example.com', 32),
('Elena', 'Alvarez', 'elena@example.com', 29);

INSERT INTO cita_medica (usuario_id, medico_id, fecha_hora, motivo) VALUES 
(1, 3, '2024-04-15 10:00:00', 'Insomnio crónico'),
(2, 4, '2024-04-16 11:30:00', 'Apnea del sueño'),
(3, 5, '2024-04-17 09:45:00', 'Narcolepsia'),
(4, 6, '2024-04-18 14:15:00', 'Parálisis del sueño'),
(5, 7, '2024-04-19 16:00:00', 'Síndrome de piernas inquietas'),
(6, 8, '2024-04-20 13:00:00', 'Bruxismo'),
(7, 9, '2024-04-21 10:45:00', 'Trastorno del sueño relacionado con la depresión'),
(8, 10, '2024-04-22 08:30:00', 'Somnambulismo'),
(9, 9, '2024-04-23 12:30:00', 'Bruxismo'),
(10, 10, '2024-04-24 15:30:00', 'Síndrome de fase de sueño retrasado');

INSERT INTO Especialidades_Medico (nombre, medico_id) VALUES 
('Medicina del Sueño', 1),
('Neurología del Sueño', 2),
('Psiquiatría del Sueño', 3),
('Otorrinolaringología del Sueño', 4),
('Pediatría del Sueño', 5),
('Medicina Interna del Sueño', 6),
('Neumología del Sueño', 7),
('Endocrinología del Sueño', 8),
('Cardiología del Sueño', 9),
('Psicología del Sueño', 10);

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
(1, 1, 'Playlist 1', 'Descripción de la playlist 1'),
(2, 2, 'Playlist 2', 'Descripción de la playlist 2'),
(3, 3, 'Playlist 3', 'Descripción de la playlist 3'),
(4, 4, 'Playlist 4', 'Descripción de la playlist 4'),
(5, 5, 'Playlist 5', 'Descripción de la playlist 5'),
(6, 6, 'Playlist 6', 'Descripción de la playlist 6'),
(7, 7, 'Playlist 7', 'Descripción de la playlist 7'),
(8, 8, 'Playlist 8', 'Descripción de la playlist 8'),
(9, 9, 'Playlist 9', 'Descripción de la playlist 9'),
(10, 10, 'Playlist 10', 'Descripción de la playlist 10');

INSERT INTO multimedia (tipo, titulo, descripcion, archivo, usuario_id) VALUES 
('Video', 'Trastornos del sueño: Causas y consecuencias', 'Este video explora las causas y consecuencias de los trastornos del sueño.', 'video_trastornos_sueno1.mp4', 1),
('Artículo', 'Guía completa sobre el insomnio', 'Este artículo ofrece una guía completa sobre el insomnio, sus síntomas y posibles tratamientos.', 'guia_insomnio.pdf', 2),
('Podcast', 'Entrevista con un especialista en trastornos del sueño', 'Escucha esta entrevista con un especialista en trastornos del sueño para obtener más información sobre el tema.', 'podcast_trastornos_sueno.mp3', 3),
('Imagen', 'Infografía: Tipos de trastornos del sueño', 'Esta infografía detalla los diferentes tipos de trastornos del sueño, desde el insomnio hasta la apnea del sueño.', 'infografia_trastornos_sueno.png', 4),
('Video', 'Consecuencias del síndrome de piernas inquietas', 'En este video se explican las posibles consecuencias del síndrome de piernas inquietas en la calidad de vida.', 'video_piernas_inquietas.mp4', 5),
('Artículo', 'Cómo mejorar la higiene del sueño', 'Descubre consejos prácticos para mejorar la higiene del sueño y prevenir trastornos relacionados.', 'mejorar_higiene_sueno.html', 6),
('Podcast', 'Historias de personas con narcolepsia', 'Este podcast presenta historias reales de personas que viven con narcolepsia y cómo manejan su condición.', 'narcolepsia_historias.mp3', 7),
('Imagen', 'Ilustración: Ciclo del sueño', 'Esta ilustración muestra el ciclo completo del sueño y las diferentes etapas del mismo.', 'ilustracion_ciclo_sueno.jpg', 8),
('Video', 'Entendiendo la apnea del sueño', 'Aprende más sobre la apnea del sueño y su impacto en la salud en este video educativo.', 'video_apnea_sueno.mp4', 9),
('Artículo', 'Efectos del sueño fragmentado en el rendimiento cognitivo', 'Lee este artículo para conocer cómo el sueño fragmentado puede afectar el rendimiento cognitivo y la concentración.', 'efectos_sueno_fragmentado.pdf', 10);


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
