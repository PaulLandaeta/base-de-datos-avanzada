

# Ejercicio 1: 
Una empresa multinacional de ingeniería ha decidido distribuir su información de gestión de proyectos a nivel regional en Bolivia. El esquema relacional centralizado actual es el siguiente:

	•	Empleado (CI, nombre, apellido, dirección, fechaNac, sexo, salario, códigoFiscal, nroDept)
	•	Departamento (nroDept, nombreDept, CIJefe, nroAreaNegocio, nroRegión)
	•	Proyecto (nroProyecto, nombreProyecto, precioContrato, CIJefeProyecto, nroDept)
	•	TrabajaEn (CI, nroProyecto, horasTrabajadas)
	•	Negocio (nroAreaNegocio, nombreAreaNegocio)
	•	Región (nroRegión, nombreRegión)

Donde Empleado contiene detalles del empleado y el número de cedula (CI) es la clave. Los departamentos están agrupados regionalmente de la siguiente manera:

	•	Región 1: Norte
	•	Región 2: Sur
	•	Región 3: Este
	•	Región 4: Oeste

La información se requiere por área de negocio que cubre: Ingeniería de Software, Ingeniería Mecánica e Ingeniería Eléctrica. No hay Ingeniería de Software en el Sur y todos los departamentos de Ingeniería Eléctrica están en el Este. Los proyectos son atendidos por oficinas de departamentos locales.

Tarea:

Diseña una base de datos distribuida que refleje la siguiente estructura organizativa y requisitos:

	1.	Descentralización por Regiones:
	•	Modifica el esquema para que cada región maneje su propia base de datos con información relevante a sus departamentos y empleados.
	•	Asegura que cada base de datos regional solo contenga datos de los proyectos, empleados y departamentos que pertenecen a esa región.
	2.	Especificaciones de Área de Negocio:
	•	Implementa reglas de negocio que impidan la existencia de Ingeniería de Software en el Sur y que mantengan todos los departamentos de Ingeniería Eléctrica en el Este.
	•	Configura las bases de datos para que reflejen estas reglas y restricciones específicas de área de negocio.
	3.	Acceso y Actualización de Datos:
	•	Establece mecanismos para que los datos puedan ser actualizados y accesados de manera eficiente y segura, considerando los desafíos de una base de datos distribuida.
	•	Proporciona una solución para consolidar la información a nivel nacional cuando sea necesario, por ejemplo, para reportes de alta dirección que necesiten una visión global de la compañía.

# Ejercicio 2: 

Farmacorp es una de las principales cadenas de farmacias en Bolivia con sucursales en todas las principales ciudades del país. Dada la extensa red de sucursales y la necesidad de manejar eficientemente el inventario y los pedidos de clientes, la empresa ha decidido implementar un sistema de base de datos distribuida.

Diseñar una base de datos distribuida que permita a cada sucursal gestionar su inventario y pedidos de manera autónoma, mientras mantiene una visión consolidada del inventario y las ventas a nivel nacional para la administración central.

## Tarea:

### Descentralización por Regiones:

-   Divide las sucursales de Farmacorp en regiones geográficas (por ejemplo, La Paz, Cochabamba, Santa Cruz, etc.).
-   Cada región manejará su propia base de datos con información relevante a sus sucursales, incluyendo inventarios y pedidos.
### Estructura de la Base de Datos:
- Sucursal (IDSucursal, NombreSucursal, Dirección, Ciudad, Teléfono)
- Empleado (CI, Nombre, Apellido, IDSucursal, Rol)
- Producto (IDProducto, NombreProducto, Descripción, Precio)
- Inventario (IDInventario, IDProducto, IDSucursal, Cantidad)
- Pedido (IDPedido, FechaPedido, CIEmpleado, TotalPedido)
- DetallePedido (IDPedido, IDProducto, Cantidad, PrecioUnitario)
### Sincronización y Consolidación de Datos:
- Implementa un mecanismo de sincronización para actualizar periódicamente la información de inventarios y ventas a una base de datos central.
- Esta base central será utilizada para análisis de datos y reportes de gestión a nivel de toda la empresa.
### Seguridad y Acceso a los Datos:
- Define políticas de seguridad para garantizar que los datos sensibles sean accesibles solo para el personal autorizado.