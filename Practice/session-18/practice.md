```js
[
  {
    "_id": 1,
    "customerId": 101,
    "date": ISODate("2023-01-15T08:00:00Z"),
    "status": "completed",
    "items": [
      { "productId": "A123", "quantity": 2, "price": 10 },
      { "productId": "B456", "quantity": 1, "price": 20 }
    ],
    "shippingAddress": {
      "street": "123 Main St",
      "city": "Metropolis",
      "state": "NY",
      "zip": "10001"
    },
    "payment": {
      "method": "credit_card",
      "transactionId": "txn789"
    },
    "total": 40
  },
  {
    "_id": 2,
    "customerId": 102,
    "date": ISODate("2023-02-20T09:30:00Z"),
    "status": "pending",
    "items": [
      { "productId": "A123", "quantity": 1, "price": 10 },
      { "productId": "C789", "quantity": 3, "price": 15 }
    ],
    "shippingAddress": {
      "street": "456 Elm St",
      "city": "Gotham",
      "state": "NJ",
      "zip": "07001"
    },
    "payment": {
      "method": "paypal",
      "transactionId": "txn456"
    },
    "total": 55
  },
  {
    "_id": 3,
    "customerId": 101,
    "date": ISODate("2023-03-10T10:45:00Z"),
    "status": "completed",
    "items": [
      { "productId": "B456", "quantity": 2, "price": 20 },
      { "productId": "D012", "quantity": 1, "price": 25 }
    ],
    "shippingAddress": {
      "street": "123 Main St",
      "city": "Metropolis",
      "state": "NY",
      "zip": "10001"
    },
    "payment": {
      "method": "credit_card",
      "transactionId": "txn123"
    },
    "total": 65
  }
]
```


- Filtra los documentos en la colección orders para encontrar aquellos que tienen un status de “completed”.
- Agrupa los documentos en la colección orders por customerId y calcula el total de total para cada cliente.
- Ordena los documentos en la colección orders por date en orden descendente.
- Selecciona solo los campos customerId, date y un campo calculado totalItems que sea la suma de las cantidades de los artículos en cada pedido.
- Descompone el array items en documentos individuales en la colección orders.
- Cuenta el número de documentos en la colección orders con un status de “completed”.