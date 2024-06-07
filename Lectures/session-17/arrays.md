# Operadores de Arrays en MongoDB

### Operador $all

El operador $all selecciona los documentos donde el valor de un campo array contiene todos los elementos especificados.

```sql
[
  { "_id": 1, "tags": ["electrónica", "hogar", "oferta"] },
  { "_id": 2, "tags": ["deporte", "verano"] },
  { "_id": 3, "tags": ["electrónica", "oferta"] }
]

db.productos.find({ tags: { $all: ["electrónica", "oferta"] } })
```

### Operador $elemMatch

El operador $elemMatch selecciona los documentos si al menos un elemento del array cumple todos los criterios especificados.

```sql
[
  { "_id": 1, "tags": [{ "value": "electrónica", "label": "Electrónica" }, { "value": "hogar", "label": "Hogar" }] },
  { "_id": 2, "tags": [{ "value": "deporte", "label": "Deporte" }, { "value": "verano", "label": "Verano" }] }
]

db.productos.find({ tags: { $elemMatch: { value: "electrónica", label: "Electrónica" } } })
```

### Operador $size

El operador $size selecciona los documentos donde el array tiene un número específico de elementos.

```sql 
[
  { "_id": 1, "tags": ["electrónica", "hogar", "oferta"] },
  { "_id": 2, "tags": ["deporte", "verano"] }
]

db.productos.find({ tags: { $size: 2 } })
```

### Operador $push

El operador $push añade un nuevo elemento al final de un array.

```sql 
{ "_id": 1, "tags": ["electrónica", "hogar"] }
db.productos.updateOne(
  { _id: 1 },
  { $push: { tags: "oferta" } }
)
```

Para poder agregar varios elementos 

```sql 
db.productos.updateOne(
  { _id: 1 },
  { $push: { tags: { $each: ["oferta", "nuevo"] } } }
)
```
### Operador $pull

El operador $pull elimina todos los elementos del array que coinciden con una condición.

```sql 
{ "_id": 1, "tags": ["electrónica", "hogar", "oferta"] }

db.productos.updateOne(
  { _id: 1 },
  { $pull: { tags: "hogar" } }
)
```

Si deseamos eliminar varios elementos del array usaremos el operador in 

```sql
db.productos.updateOne(
  { _id: 1 },
  { $pull: { tags: { $in: ["oferta", "nuevo"] } } }
)
```

### Operador $addToSet

El operador $addToSet añade un nuevo elemento al array solo si no está presente.

```sql
{ "_id": 1, "tags": ["electrónica", "hogar"] }
db.productos.updateOne(
  { _id: 1 },
  { $addToSet: { tags: "hogar" } }
)
```

Si deseamos agregar varios elementos 

```sql
db.productos.updateOne(
  { _id: 1 },
  { $addToSet: { tags: { $each: ["oferta", "nuevo", "exclusivo"] } } }
) 
```


### Operador $pop

El operador $pop elimina el primer o último elemento de un array.

```sql 
{ "_id": 1, "tags": ["electrónica", "hogar", "oferta"] }

db.productos.updateOne(
  { _id: 1 },
  { $pop: { tags: 1 } }  // Para eliminar el primer elemento, usa -1
)
```