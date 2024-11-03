CREATE TABLE `Usuarios` (
  `id_usuario` INT PRIMARY KEY,
  `nombre` VARCHAR(100),
  `email` VARCHAR(100) UNIQUE,
  `contraseña` VARCHAR(255),
  `telefono` VARCHAR(20),
  `direccion` VARCHAR(255)
);

CREATE TABLE `Canchas` (
  `id_cancha` INT PRIMARY KEY,
  `nombre` VARCHAR(100),
  `ubicacion` VARCHAR(255),
  `tipo` VARCHAR(50),
  `capacidad` INT,
  `estado` VARCHAR(50)
);

CREATE TABLE `Reservas` (
  `id_reserva` INT PRIMARY KEY,
  `id_usuario` INT,
  `id_cancha` INT,
  `fecha` DATE,
  `hora_inicio` TIME,
  `hora_fin` TIME,
  `estado` VARCHAR(50)
);

CREATE TABLE `Reservas_Conjuntas` (
  `id_reserva_conjunta` INT PRIMARY KEY,
  `id_reserva` INT,
  `nombre_grupo` VARCHAR(100),
  `numero_participantes` INT
);

CREATE TABLE `Mantenimiento` (
  `id_mantenimiento` INT PRIMARY KEY,
  `id_cancha` INT,
  `fecha` DATE,
  `descripcion` TEXT,
  `estado` VARCHAR(50)
);

CREATE TABLE `Notificaciones` (
  `id_notificacion` INT PRIMARY KEY,
  `id_usuario` INT,
  `mensaje` TEXT,
  `fecha` DATE,
  `estado` VARCHAR(50)
);

ALTER TABLE `Reservas` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`);

ALTER TABLE `Reservas` ADD FOREIGN KEY (`id_cancha`) REFERENCES `Canchas` (`id_cancha`);

ALTER TABLE `Reservas_Conjuntas` ADD FOREIGN KEY (`id_reserva`) REFERENCES `Reservas` (`id_reserva`);

ALTER TABLE `Mantenimiento` ADD FOREIGN KEY (`id_cancha`) REFERENCES `Canchas` (`id_cancha`);

ALTER TABLE `Notificaciones` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`);
