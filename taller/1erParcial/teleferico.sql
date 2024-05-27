CREATE DATABASE TelefericoLaPaz;
USE TelefericoLaPaz;

CREATE TABLE Usuarios (
                          UsuarioID INT AUTO_INCREMENT PRIMARY KEY,
                          Nombre VARCHAR(100),
                          Apellido VARCHAR(100),
                          Email VARCHAR(100) UNIQUE,
                          Rol ENUM('pasajero', 'operador', 'administrador', 'técnico') NOT NULL,
                          Saldo DECIMAL(10, 2) DEFAULT 0.00
);


CREATE TABLE Telefericos (
                             TelefericoID INT AUTO_INCREMENT PRIMARY KEY,
                             Nombre VARCHAR(100),
                             Estado ENUM('operativo', 'mantenimiento', 'fuera de servicio') NOT NULL,
                             UltimoMantenimiento DATE
);

CREATE TABLE Tickets (
                         TicketID INT AUTO_INCREMENT PRIMARY KEY,
                         UsuarioID INT,
                         TelefericoID INT,
                         Fecha DATE,
                         Monto DECIMAL(10, 2),
                         FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
                         FOREIGN KEY (TelefericoID) REFERENCES Telefericos(TelefericoID)
);


CREATE TABLE Mantenimiento (
                               MantenimientoID INT AUTO_INCREMENT PRIMARY KEY,
                               TelefericoID INT,
                               FechaInicio DATE,
                               FechaFin DATE,
                               Descripcion TEXT,
                               FOREIGN KEY (TelefericoID) REFERENCES Telefericos(TelefericoID)
);

