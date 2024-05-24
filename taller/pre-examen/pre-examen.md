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

8. **Trigger (10%)**
   Crea un trigger que automáticamente actualice la edad de los miembros en la base de datos cuando se cambie la fecha de nacimiento. (crear una columna edad en el tabla correspondiente)

9.  **Creación de Usuarios (15%)**
    
    **- Administrador del Gimnasio (gym_admin):**
            
    Este usuario necesita tener permisos para modificar cualquier tabla dentro de la base de datos del gimnasio, lo que incluye la capacidad de realizar inserciones, actualizaciones, eliminaciones y consultas en todas las tablas.

    **- Entrenador (gym_trainer):**

    Este usuario debe poder consultar la tabla de miembros y registrar clases, pero no debería poder modificar información de miembros o eliminar registros.

    **- Recepcionista (gym_receptionist):**

    Este usuario necesita poder agregar y consultar registros en la tabla de visitas y consultar datos de miembros para verificar sus suscripciones, pero no debe tener permisos para modificar las estructuras de las tablas

10. **Crear una funcion para ver ganancias (10%)**
    
    Diseña una función que calcule el total de ingresos mensuales del gimnasio basándose en las membresías activas y su tarifa mensual.

11. **Particionamiento de la Tabla Visitas (10%)**
    
    La tabla Visitas en la base de datos del gimnasio registra cada entrada de los miembros al establecimiento, almacenando la identificación del miembro, la fecha y la hora de la visita. A medida que el gimnasio crece en popularidad, esta tabla acumula millones de registros, lo que podría comenzar a degradar el rendimiento de las consultas y complicar el mantenimiento de los datos.

12. **Análisis de Tendencias de Asistencia (10%)**

    Diseña una vista en MySQL que proporcione un resumen mensual de la asistencia por tipo de clase, que incluya el número total de asistentes y la cantidad de clases ofrecidas por mes para cada tipo de clase. La vista debe facilitar la identificación de las clases más y menos populares cada mes.
    ¿Qué otros datos podrías incluir en la vista para hacerla más útil?