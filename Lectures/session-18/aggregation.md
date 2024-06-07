
### Operador $group de Agregación


Se puede usar $sum, $avg, $max, $min, 
```sql 
db.libros.aggregate([
    {
        $group: {
            _id: '$autor',
            sumPrice: {$sum: "$price"}
        }
    }
])
``` 

hacer un count 
```sql 
db.libros.aggregate([
    {
        $group: {
            _id: '$autor',
            totalLibros: {$sum: 1}
        }
    }
])
```

agrupar por switch 

```js
db.libros.aggregate([
    {
        $group: {
            _id: {
                $switch: {
                    branches: [
                        {case: { $lte:["$price", 5]}, then: "Bajo"},
                        {case: { $lte:["$price", 10]}, then: "Medio"}
                    ],
                    default: "Alto"
                }
            },
           suma: { $sum: "$price" }
        }
    }
])
```

### Operador $sort de Agregación

```js
db.libros.aggregate([
    {
        $sort: {
            price: 1
        }
    }
])
```

### Operador $project de Agregación 

```js
db.collection.aggregate([
  {
    $project: {
      name: 1,
      totalAmount: { $multiply: ["$quantity", "$price"] }
    }
  }
])
```

### Descomoponer $unwind de Agregación 

Descomponer un array por elemento 

```js
db.libros.aggregate([
  { $unwind: "$categorias" }
])
```

### Operador $count de Agregación 

Contar numero de de documentos que cumplan un criterio

```js
db.libros.aggregate([
  { $match: { autor: "Victor" } },
  { $count: "total" }
])
```