# Conceptos Básicos

## ¿Qué es una Transacción?

Una transacción es una secuencia de operaciones que se ejecutan como una sola unidad lógica de trabajo. Una transacción tiene éxito si todas las operaciones dentro de ella tienen éxito. Si alguna operación falla, toda la transacción se deshace.

### Propiedades ACID

	•	Atomicidad: Todas las operaciones dentro de una transacción se completan con éxito o ninguna.
	•	Consistencia: Las transacciones llevan la base de datos de un estado válido a otro estado válido.
	•	Aislamiento: Las operaciones de una transacción son invisibles para otras transacciones hasta que se confirman.
	•	Durabilidad: Una vez que una transacción se confirma, los cambios son permanentes.

## Comandos de Transacción en MySQL

	•	START TRANSACTION: Inicia una nueva transacción.
	•	COMMIT: Confirma la transacción actual, haciendo permanentes sus cambios.
	•	ROLLBACK: Revierte la transacción actual, deshaciendo sus cambios.

###  Manejo de Transacciones

Set autocommit false
```sql
SET autocommit = 0;
```
Iniciar una Transacción
``` sql 
START TRANSACTION;
```

Confirmar transacción
```sql 
COMMIT;
```

Revertir una Transacción
```sql 
ROLLBACK; 
```

## Ejemplo 1: Manejo de Errores en Transacciones

```sql 
START TRANSACTION;

BEGIN TRY
    UPDATE cuentas SET balance = balance - 50 WHERE id = 1;
    UPDATE cuentas SET balance = balance + 50 WHERE id = 2;
    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
END CATCH;
```


