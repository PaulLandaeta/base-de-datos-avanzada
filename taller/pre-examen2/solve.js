use pre-examen

db.createCollection(
'eventos'
)

db.eventos.insertMany([
{
    "_id": "evento1",
    "nombre": "Competencia de Programación",
    "descripcion": "Concurso de algoritmos y programación.",
    "fecha":ISODate("2024-06-15T00:00:00Z"),
    "carreras_participantes": ["carrera1", "carrera2", "equipo1"],
    "puntajes": [
        {"carrera_id": "carrera1", "puntos": 50},
        {"carrera_id": "carrera2", "puntos": 40},
        {"equipo_id": "equipo1", "puntos": 60}
    ],
    "evento_padre": null,
    "categoria": 'tecnologia',
}])


db.eventos.insertMany([
{
    "_id": "evento2",
    "nombre": "Competencia de Programación III",
    "descripcion": "Concurso de algoritmos y programación.",
    "fecha": ISODate("2024-06-15T00:00:00Z"),
    "carreras_participantes": ["carrera1", "carrera2", "equipo1"],
    "puntajes": [
        {"carrera_id": "carrera1", "puntos": 40},
        {"carrera_id": "carrera2", "puntos": 40},
        {"equipo_id": "equipo1", "puntos": 60}
    ],
    "evento_padre": "evento1",
    "categoria": 'tecnologia',
    "historial": [
        {"año": 2023, "puntajes": [
            {"carrera_id": "carrera1", "puntos": 30},
            {"carrera_id": "carrera2", "puntos": 20}
        ]}
    ]
}])

db.createCollection('carreras')

db.carreras.insertMany([
{
    "_id": "carrera1",
    "nombre": "Ingeniería de Sistemas Computacionales",
    "estudiantes": ["estudiante1", "estudiante2"],
    "rango": "Oro"
}])

db.createCollection(
'estudiantes'
)


db.estudiantes.insertMany([{
                               "_id": "estudiante1",
                               "nombre": "Pedro",
                               "apellido": "Picapiedra",
                               "correo_electronico": "pedro.picapiedra@upb.edu",
                               "carreras": ["carrera1", "carrera2"],
                               "puntos_ganados": [
                                   {"evento_id": "evento1", "puntos": 20},
                                   {"evento_id": "evento2", "puntos": 10}
                               ],
                               "rango": "Plata"
                           }
])


db.estudiantes.insertMany([{
                               "_id": "estudiante2",
                               "nombre": "Pablo",
                               "apellido": "Marmol",
                               "correo_electronico": "pedro.picapiedra@upb.edu",
                               "carreras": ["carrera1", "carrera2"],
                               "puntos_ganados": [
                                   {"evento_id": "evento1", "puntos": 20},
                                   {"evento_id": "evento2", "puntos": 10}
                               ],
                               "rango": "Plata"
                           }
])

db.createCollection('equipos')

db.equipos.insertMany([
{
    "_id": "equipo1",
    "nombre": "Equipo de Programación",
    "carreras": ["carrera1", "carrera2"],
    "estudiantes": ["estudiante1", "estudiante3"],
    "eventos": ["evento1"]
}
])

db.createCollection('puntajes')

db.puntajes.insertMany([
{
    "_id": "puntaje1",
    "evento_id": "evento1",
    "equipo_id": "equipo1",
    "puntos": 50
}])


db.createCollection('comentarios')

db.comentarios.insertMany([
{
    "_id": "comentario1",
    "estudiante_id": "estudiante1",
    "evento_id": "evento1",
    "contenido": "¡Gran evento, muy bien organizado!",
    "carrera": "carrera1",
    "created_at": ISODate("2024-06-15T00:00:00Z")
    "timestamp": ISODate("2024-06-15T15:00:00Z")
}
])

db.comentarios.find()
// eliminar comentarios al dia
db.comentarios.createIndex(
    { "created_at": 1 },
    { expireAfterSeconds: 86400 }
);

// Encontrar todos los eventos en los que una carrera específica ha participado.
// ojo
db.eventos.find({ carreras_participantes: "carrera1" });

// Listar todos los estudiantes de una carrera en particular.
db.estudiantes.find({ carreras: "carrera1" });
// Obtener los puntos totales acumulados por una carrera específica en un año determinado.
db.eventos.aggregate([
    {
        $match: {
            fecha: {
                $gte: ISODate("2024-01-01T00:00:00Z"),
                $lt: ISODate("2025-01-01T00:00:00Z")
            }
        }
    },
    { $unwind: "$puntajes" },
    { $match: { "puntajes.carrera_id": "carrera1" } },
    {
        $group: {
            _id: "$puntajes.carrera_id",
            total_puntos: { $sum: "$puntajes.puntos" }
        }
    }
]);



// Recuperar el detalle de los puntos obtenidos por cada carrera en un evento específico.
db.eventos.find(
    { _id: "evento1" },
    { puntajes: 1, _id: 0 }
);

// Calcular el puntaje total de todas las carreras en un evento específico.
db.eventos.aggregate([
    { $match: { _id: "evento1" } },
    { $unwind: "$puntajes" },
    { $group: { _id: 'total', total_puntos: { $sum: "$puntajes.puntos" } } }
]);

// Obtener los comentarios del evento del día y contar la cantidad de apoyo por carrera.
db.comentarios.aggregate([
    { $match: { timestamp: { $gte: new Date("2024-06-14T00:00:00Z"), $lt: new Date("2024-06-16T00:00:00Z") } } },
    { $group: { _id: "$carrera", total_apoyo: { $sum: 1 } } }
]);
// Determinar el estudiante más activo basándose en los puntos ganados en los eventos.

db.estudiantes.aggregate([
    { $unwind: "$puntos_ganados" },
    {
        $group: {
            _id: "$_id",
            total_puntos: { $sum: "$puntos_ganados.puntos" }
        }
    },
    { $sort: { total_puntos: -1 } },
    { $limit: 1 },
    {
        $lookup: {
            from: "estudiantes",
            localField: "_id",
            foreignField: "_id",
            as: "estudiante_info"
        }
    },
    { $unwind: "$estudiante_info" },
    {
        $project: {
            _id: 0,
            estudiante_id: "$_id",
            nombre_completo: { $concat: ["$estudiante_info.nombre", " ", "$estudiante_info.apellido"] },
            total_puntos: 1
        }
    }
]);

// Todos los subeventos de un evento específico.

db.eventos.aggregate([
    {
        $graphLookup: {
            from: "eventos",
            startWith: "$_id",
            connectFromField: "_id",
            connectToField: "evento_padre",
            as: "subeventos"
        }
    },
    { $match: { _id: "evento1" } },
    { $project: { subeventos: 1, _id: 0 } }
]);


// carreras mas destacadas
db.eventos.aggregate([
    { $unwind: "$puntajes" },
    {
        $group: {
            _id: "$puntajes.carrera_id",
            total_puntos: { $sum: "$puntajes.puntos" }
        }
    },
    {
        $lookup: {
            from: "carreras",
            localField: "_id",
            foreignField: "_id",
            as: "carrera_info"
        }
    },
    { $unwind: "$carrera_info" },
    {
        $project: {
            _id: 0,
            carrera_id: "$_id",
            nombre: "$carrera_info.nombre",
            total_puntos: 1
        }
    },
    { $sort: { total_puntos: -1 } },
    { $limit: 1 }
]);

// Estudiantes más destacados en una categoría específica
db.estudiantes.aggregate([
    { $unwind: "$puntos_ganados" },
    { $lookup: {
        from: "eventos",
        localField: "puntos_ganados.evento_id",
        foreignField: "_id",
        as: "evento_info"
    }},
    { $unwind: "$evento_info" },
    { $match: { "evento_info.categoria": "tecnologia" } },
    { $group: { _id: "$_id", total_puntos: { $sum: "$puntos_ganados.puntos" } } },
    { $sort: { total_puntos: -1 } },
    { $limit: 1 }
]);