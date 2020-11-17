const multer = require('multer');
const Sequelize = require('sequelize');

const sequelize = new Sequelize("dnd","dm","qweQWE123",{
    host: 'localhost',
    dialect: "mysql",
    operatorAliases:false,

    pool: {
        max:5,
        min:0,
         acquire: 30000,
        idle: 10000.
    },
});

const db={};

db.Sequilize = Sequelize;
db.sequilize = sequelize;
db.images = require("./image.model.js")(sequelize,Sequelize);

module.exports = db;