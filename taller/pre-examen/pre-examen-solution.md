# Pre-Examen de Bases de Datos para un Sitio Web de Gimnasio

## Parte I: Preguntas Teóricas (30%)

1. ¿Qué es un Stored Procedure y cómo puede ser utilizado en un gimnasio para mejorar las operaciones? (5%)
   

2. Describe cómo un trigger podría ser utilizado para mantener la integridad de los datos en el registro de miembros del gimnasio. (5%)

3. Explica la importancia de manejar adecuadamente la creación de usuarios y asignación de permisos en un entorno de base de datos de un gimnasio. (5%)

4. ¿Qué son las particiones en una base de datos y cómo podrían ser aplicadas para mejorar el rendimiento de las consultas en un gimnasio? (5%)

5. Describe un escenario donde las transacciones serían cruciales en un sistema de base de datos para un gimnasio. (5%)

6. Define qué es una función en el contexto de SQL y cómo podría ser utilizada en un sistema de base de datos para un gimnasio. (5%)

## Parte II: Problemas Prácticos (70%)

7. **Store Procedure (15%)**
   Diseña un Stored Procedure que permita registrar una nueva suscripción de un miembro, asegurando que todos los pasos se completen correctamente o se deshagan en caso de error.

   ```sql 
        DELIMITER $$

        CREATE PROCEDURE registrar(
            IN memberID INT,
            IN startDate DATE,
            IN endDate DATE,
            IN fee DECIMAL(10,2)
        )
        BEGIN
            DECLARE exit handler FOR SQLEXCEPTION
            BEGIN
                -- si ocurre un error restablecer a todo 
                ROLLBACK;
            END;

            START TRANSACTION;

            -- verificar si hay un miembro con el mismo id
            IF NOT EXISTS (SELECT 1 FROM Miembros WHERE MiembroID = pMemberID) THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID del miembro no existe.';
            END IF;

            -- Guardar los datos
            INSERT INTO Suscripciones (MiembroID, FechaInicio, FechaFin, Tarifa)
            VALUES (pMemberID, pStartDate, pEndDate, pFee);

            COMMIT;
        END$$

        DELIMITER ;
   ```

8. **Trigger (10%)**
   Crea un trigger que automáticamente actualice la edad de los miembros en la base de datos cuando se cambie la fecha de nacimiento. (crear una columna edad en el tabla correspondiente)

   Añadimos la nueva columna 

   ```sql
    ALTER TABLE Miembros ADD COLUMN Edad INT;
   ```

    Creamos el Trigger

    ```sql

        DELIMITER $$

        CREATE TRIGGER ActualizarEdad
        BEFORE UPDATE ON Miembros
        FOR EACH ROW
        BEGIN
            IF NEW.FechaDeNacimiento <> OLD FechaDeNacimiento THEN
                SET NEW.Edad = TIMESTAMPDIFF(YEAR, NEW.FechaDeNacimiento, CURDATE());
            END IF;
        END$$

        DELIMITER ;
    ```
9.  **Creación de Usuarios (15%)**
    
    **- Administrador del Gimnasio (gym_admin):**
            
    Este usuario necesita tener permisos para modificar cualquier tabla dentro de la base de datos del gimnasio, lo que incluye la capacidad de realizar inserciones, actualizaciones, eliminaciones y consultas en todas las tablas.

    ```sql 
        CREATE USER 'gym_admin'@'localhost' IDENTIFIED BY 'Control123';
        GRANT ALL PRIVILEGES ON gym_database.* TO 'gym_admin'@'localhost';
    ```

    **- Entrenador (gym_trainer):**

    Este usuario debe poder consultar la tabla de miembros y registrar clases, pero no debería poder modificar información de miembros o eliminar registros.

    ```sql

    CREATE USER 'gym_trainer'@'localhost' IDENTIFIED BY 'Control123';
    GRANT SELECT, INSERT, UPDATE ON gym_database.Miembros TO 'gym_trainer'@'localhost';
    GRANT SELECT, INSERT ON gym_database.RegistroClases TO 'gym_trainer'@'localhost';
    ```

    **- Recepcionista (gym_receptionist):**

    Este usuario necesita poder agregar y consultar registros en la tabla de visitas y consultar datos de miembros para verificar sus suscripciones, pero no debe tener permisos para modificar las estructuras de las tablas

    ```sql
    CREATE USER 'gym_receptionist'@'localhost' IDENTIFIED BY 'Control123';
    GRANT SELECT, INSERT ON gym_database.Visitas TO 'gym_receptionist'@'localhost';
    GRANT SELECT ON gym_database.Miembros TO 'gym_receptionist'@'localhost';
    ```

10. **Crear una funcion para ver ganancias (10%)**
    
    Diseña una función que calcule el total de ingresos mensuales del gimnasio basándose en las membresías activas y su tarifa mensual.

    ```sql
    DELIMITER $$

    CREATE FUNCTION IngresoTotal(yearP INT, monthP INT)
    RETURNS DECIMAL(10, 2)
    DETERMINISTIC
    BEGIN
        DECLARE total DECIMAL(10, 2);

        SELECT SUM(Tarifa) INTO total
        FROM Suscripciones
        WHERE YEAR(FechaInicio) <= yearP AND MONTH(FechaInicio) <= monthP
        AND (FechaFin IS NULL OR YEAR(FechaFin) >= yearP AND MONTH(FechaFin) >= monthP);

        RETURN IFNULL(total, 0);
    END$$

    DELIMITER ;
    ```

11. **Particionamiento de la Tabla Visitas (10%)**
    
    La tabla Visitas en la base de datos del gimnasio registra cada entrada de los miembros al establecimiento, almacenando la identificación del miembro, la fecha y la hora de la visita. A medida que el gimnasio crece en popularidad, esta tabla acumula millones de registros, lo que podría comenzar a degradar el rendimiento de las consultas y complicar el mantenimiento de los datos.

    ```sql
    CREATE TABLE visitas_partition (
                                    VisitaID INT NOT NULL AUTO_INCREMENT,
                                    MiembroID INT NOT NULL,
                                    FechaHoraVisita DATE NOT NULL,
                                    PRIMARY KEY (VisitaID, FechaHoraVisita)
    )
    PARTITION BY RANGE (YEAR(FechaHoraVisita)) (
        PARTITION P0 VALUES LESS THAN (2020),
        PARTITION P1 VALUES LESS THAN (2022),
        PARTITION P2 VALUES LESS THAN (2023),
        PARTITION P3 VALUES LESS THAN (MAXVALUE)
        );
    ```

12. **Análisis de Tendencias de Asistencia (10%)**

    Diseña una vista en MySQL que proporcione un resumen mensual de la asistencia por tipo de clase, que incluya el número total de asistentes y la cantidad de clases ofrecidas por mes para cada tipo de clase. La vista debe facilitar la identificación de las clases más y menos populares cada mes.
    ¿Qué otros datos podrías incluir en la vista para hacerla más útil?

    ```sql
    DELIMITER $$

    CREATE VIEW resumen AS
    SELECT 
        c.NombreClase,
        YEAR(rc.FechaClase) AS Anhio,
        MONTH(rc.FechaClase) AS Mes,
        COUNT(DISTINCT rc.RegistroID) AS NroAsistentes,
        COUNT(DISTINCT rc.FechaClase) AS TotaldeClases
    FROM 
        RegistroClases rc
    JOIN 
        Clases c ON rc.ClaseID = c.ClaseID
    WHERE 
        rc.Asistio = TRUE
    GROUP BY 
        c.NombreClase, YEAR(rc.FechaClase), MONTH(rc.FechaClase);

    DELIMITER ;
    ```