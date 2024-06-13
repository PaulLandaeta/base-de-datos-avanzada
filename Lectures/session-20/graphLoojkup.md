## Tutorial de graphLookup

```js
{
   $graphLookup: {
      from: <collection>,
      startWith: <expression>,
      connectFromField: <string>,
      connectToField: <string>,
      as: <string>,
      maxDepth: <number>,
      depthField: <string>,
      restrictSearchWithMatch: <document>
   }
}
```

```js
{
   "_id": 1,
   "name": "Alexis",
   "reportsTo": null
},
{
   "_id": 2,
   "name": "Paul",
   "reportsTo": 1
},
{
   "_id": 3,
   "name": "Auxiliar Pepito",
   "reportsTo": 2
}
```

Query 
```
db.empleados.aggregate([
   {
      $graphLookup: {
         from: "empleados",
         startWith: "$_id",
         connectFromField: "_id",
         connectToField: "reportsTo",
         as: "subordinates"
      }
   }
])
```



