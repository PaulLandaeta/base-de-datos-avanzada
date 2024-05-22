# Gestión de Usuarios y Permisos en MySQL

### Crear Usuarios en MySQL

```sql
CREATE USER 'username'@'host' IDENTIFIED BY 'password'; 
```
- username: Nombre del Usuario
- host: dominio permitido para ingreso del usuario
- password: Password creado por el usuario

### Asignación de Permisos

Puedes asignar permisos al nuevo usuario para que pueda realizar acciones específicas en las bases de datos. Por ejemplo, para dar permisos completos en una base de datos llamada mi_base_de_datos:
```sql 
GRANT ALL PRIVILEGES ON mi_base_de_datos.* TO 'nuevo_usuario'@'localhost';
``` 

Para asignar permisos más específicos (como solo lectura):

```sql
GRANT SELECT ON mi_base_de_datos.* TO 'nuevo_usuario'@'localhost';
```

Después de asignar los permisos, debes ejecutar el siguiente comando para que los cambios tengan efecto:
```sql
FLUSH PRIVILEGES;
```

### Revocación de Permisos y Eliminación de Usuarios

Si necesitas revocar permisos específicos o todos los permisos de un usuario, puedes usar el comando REVOKE:
```sql
REVOKE ALL PRIVILEGES ON mi_base_de_datos.* FROM 'nuevo_usuario'@'localhost';
```
Para eliminar completamente un usuario de MySQL:

```sql
DROP USER 'nuevo_usuario'@'localhost';
```

Cambiar contraseña
```sql 
ALTER USER 'nuevo_usuario'@'localhost' IDENTIFIED BY 'nueva_contraseña_segura';

FLUSH PRIVILEGES;
``` 
