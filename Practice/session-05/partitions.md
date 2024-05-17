### Ejercicio 1: Diseño y Creación de Particiones

Descripción:
Imagina que estás trabajando en una aplicación de e-commerce que gestiona un gran número de pedidos. Se requiere diseñar una tabla Orders que contenga los siguientes campos:

	•	OrderID (ID del pedido)
	•	CustomerID (ID del cliente)
	•	OrderDate (Fecha del pedido)
	•	TotalAmount (Monto total del pedido)

Tarea:

	1.	Diseña y crea una tabla Orders que utilice el particionamiento basado en el año de OrderDate para optimizar las consultas por año.
	2.	Asegúrate de incluir al menos 5 años en tus particiones.
```sql
CREATE TABLE Orders (
    OrderID INT NOT NULL AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2),
    PRIMARY KEY (OrderID)
)
PARTITION BY RANGE (YEAR(OrderDate)) (
    ... 
);
```

Ejercicio 2


Descripción:
En el sistema de e-commerce, necesitas gestionar una gran variedad de productos que varían ampliamente en precio. Diseña una tabla Products que contenga los siguientes campos:

	•	ProductID (ID del producto, entero autoincremental)
	•	ProductName (Nombre del producto, cadena de texto)
	•	Price (Precio del producto, decimal)

Tarea:

	1.	Crea la tabla Products usando el particionamiento por rango basado en el precio del producto para mejorar la gestión y consulta de productos según diferentes categorías de precios.
	2.	Define particiones para productos de menos de $50, entre $50 y $100, entre $100 y $500, y más de $500.

Código SQL sugerido para comenzar:
```sql
CREATE TABLE Products (
    ProductID INT NOT NULL AUTO_INCREMENT,
    ProductName VARCHAR(255),
    Price DECIMAL(10, 2),
    PRIMARY KEY (ProductID)
)
PARTITION BY RANGE (Price) (
    ...
);
```