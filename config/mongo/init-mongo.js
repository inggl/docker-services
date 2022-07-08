db = db.getSiblingDB('erp');

db.createUser(
    {
        user: "mongo",
        pwd: "mongo",
        roles: [
            {
                role: "readWrite",
                db: "erp"
            }
        ]
    }
);