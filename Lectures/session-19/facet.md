```
db.ventas.aggregate([
    {
        $facet: {
            ventasCompletadas: [
                { $match: { estado: "completado" }},
                { $project: { _id: 0, cliente: 1, total: 1 }}
            ],
            ventasPendientes: [
                { $match: { estado: "pendiente" }},
                { $project: { _id: 0, cliente: 1, total: 1 }}
            ]
        }
    }
])
```


```
db.ventas.aggregate([
    {
        $facet: {
            ventasCompletadas: [
                { $match: { estado: "completado" }},
                { $project: { _id: 0, cliente: 1, total: 1 }}
            ],
            ventasPendientes: [
                { $match: { estado: "pendiente" }},
                { $project: { _id: 0, cliente: 1, total: 1 }}
            ]
        }
    }
])
```



db.collection.aggregate([
    {
        $lookup: {
            from: "otraColeccion",
            localField: "campoLocal",
            foreignField: "campoExterno",
            as: "nombreDelCampo"
        }
    }
])



db.libros.aggregate([
    {
        $lookup: {
            from: "autores",
            localField: "autorId",
            foreignField: "_id",
            as: "autorDetalles"
        }
    },
    {
        $unwind: "$autorDetalles"
    },
    {
        $project: {
            _id: 1,
            titulo: 1,
            año: 1,
            "autorDetalles.nombre": 1,
            "autorDetalles.nacionalidad": 1
        }
    }
])


db.libros.aggregate([
    {
        $lookup: {
            from: "autores",
            localField: "autorId",
            foreignField: "_id",
            as: "autorDetalles"
        }
    },
    {
        $unwind: "$autorDetalles"
    },
    {
        $project: {
            _id: 1,
            titulo: 1,
            año: 1,
            "autorDetalles.nombre": 1,
            "autorDetalles.nacionalidad": 1
        }
    }
])


