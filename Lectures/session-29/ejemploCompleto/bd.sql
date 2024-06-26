CREATE DATABASE IF NOT EXISTS ventas_medicamentos;
USE ventas_medicamentos;

CREATE TABLE dim_proveedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(20)
);

CREATE TABLE dim_medicamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    proveedor_id INT,
    categoria VARCHAR(50),
    FOREIGN KEY (proveedor_id) REFERENCES dim_proveedores(id)
);

CREATE TABLE dim_ubicaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ciudad VARCHAR(50),
    estado VARCHAR(50),
    pais VARCHAR(50)
);

CREATE TABLE dim_clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion_id INT,
    telefono VARCHAR(20),
    FOREIGN KEY (ubicacion_id) REFERENCES dim_ubicaciones(id)
);

CREATE TABLE dim_tiempo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    año INT,
    mes INT,
    dia INT,
    dia_semana VARCHAR(10)
);

CREATE TABLE hechos_ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    medicamento_id INT,
    cliente_id INT,
    fecha_id INT,
    cantidad INT,
    precio DECIMAL(10, 2),
    FOREIGN KEY (medicamento_id) REFERENCES dim_medicamentos(id),
    FOREIGN KEY (cliente_id) REFERENCES dim_clientes(id),
    FOREIGN KEY (fecha_id) REFERENCES dim_fecha(id)
);