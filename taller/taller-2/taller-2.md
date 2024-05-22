# Taller 2 - 22-05-2024
## Descripción del Taller

### Tema: Restaurante de Venta de Alitas.

**Duración:** 1 hora.

**Objetivo:** Los estudiantes deben poner en práctica lo aprendido en clases haciendo uso de los Stored Procedures, Vistas, Funciones, Triggers, Transacciones, Particiones, Índices, y prácticas de Backup y Restauración, utilizando el escenario de un restaurante de alitas.

### Estructura del Taller

**Introducción**

El “Wings Restaurant” es un popular restaurante que se especializa en alitas. La gerencia necesita manejar eficientemente pedidos de clientes, mantener el inventario actualizado y asegurarse de que las operaciones diarias sean fluidas y eficientes.


**Base de Datos Inicial:**


1.	**Clientes** -> CustomerID, Name, PhoneNumber
2.	**Pedidos** -> OrderID, CustomerID, OrderDate, TotalAmount
3.	**Detalles del Pedido** -> OrderDetailID, OrderID, ProductID, Quantity, Price
4.	**Inventario de Alitas** -> ProductID, ProductName, QuantityAvailable, Price
5.	**Ventas Diarias** -> SaleID, OrderID, SaleDate, TotalSaleAmount

**Ejercicios:**

1.	**Gestionar Pedidos Nuevos:**
    El restaurant recibirá una lista de nuevos pedidos que incluyen información del cliente y detalles de pedido. 
    
    - Insertar nuevos clientes en la base de datos si es necesario. (verificar si el usuario existe)
    - Crear un nuevo pedido y los detalles correspondientes del pedido. (1 producto mínimo, 2 como máximo)
    - Actualizar el inventario automáticamente mediante un trigger después de cada inserción en los detalles del pedido.
  
2.	**Consultas de Información:**
	
    Usar vistas para consultar y mostrar:

    - Todos los pedidos del día con detalles del cliente.
    - Productos que necesitan reabastecimiento (donde la cantidad disponible es baja menor a 5).
3.	**Operaciones de Cierre de Día:**

    Realizar un cierre del día que incluya:
    - Calcular el total de ventas del día.
    - Generar un reporte de ventas diarias usando una función que calcule los totales.
    - Insertar el resumen en una nueva tabla de venta_diaria.
4.	**Transacciones:**

    - Demostrar el uso de transacciones en la aplicación de un descuento a un pedido grande, asegurando que tanto la tabla de pedidos como la tabla de ventas diarias se actualicen de forma atómica.
5.	**Backup y Restauración:**
    - Realizar un backup del estado actual de la base de datos al final del día.
    - Simular una restauración del backup en otra base de datos con el nombre de la db.
6.	**Particionamiento y Índices:**
    - Crear particiones en la tabla de ventas diarias basadas en la fecha (Año).
    - Crear particiones en la tabla de venta_diaria basadas por fecha (Mes).
    - Añadir índices a las columnas que son frecuentemente consultadas para mejorar el rendimiento de las consultas.
7. **Entrega del Taller:**

    Cada grupo debe subir el archivo .sql en la plataforma virtual, ademas de la documentacion realizada en cada paso del taller. Incluir una caratula con los integrantes del grupo. 
    
