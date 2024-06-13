db.createUser({
    user: "admin",
    pwd: "Password123",
    roles: [ { role: "root", db: "admin" } ]
});