const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');
const multer = require('multer');
const Sequelize = require('sequelize');
const db = require("./lib/db.js");

const flash = require('connect-flash');
const session = require('express-session');
const mysqlstore = require('express-mysql-session');
const {database} = require('./keys');
const pool = require('./database');
const { pathToFileURL } = require('url');
//inicializaciones
const app = express();

//db.sequilize.sync();

global.__basedir = __dirname;

pool.query('DELETE FROM SESSIONS');
// settings
app.set('port', process.env.PORT || 4000);
app.set('views', path.join(__dirname,'views'));


app.engine('.hbs',exphbs({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'),'layouts'),
    partialsDir: path.join(app.get('views'),'partials'),
    extname: '.hbs',
    helpers: {
        loop: function(from,to,incrase){
            let out = '<input type="radio" id="r5" name="frg1" value="1" class="rate"style="color:red"><label for="fr1" style="color:red">&nbsp;★</label>'
            for( i=from;i<to;i+=incrase){
                out=out+'<input type="radio" id="r5" name="frg1" value="1" class="rate" style="color:red"><label for="fr1"style="color:red">&nbsp;★</label>'
            }
            return out;
        }
    }
}))
app.set('view engine','.hbs');
//Middlewares

app.use(session({
    secret: 'secreto',
    resave: false,
    saveUninitialized: false,
    store: new mysqlstore(database),
}))

app.use(flash());
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());

//Variables globales
app.use((req, res, next)=> {
    app.locals.success = req.flash('success');
    next();
} )

//Routes
app.use(require('./routes'));
app.use(require('./routes/authentication'));
app.use('/usuarios',require('./routes/usuarios'));
app.use('/grupo',require('./routes/group'));
app.use(require('./routes/upload'));
app.use(('/foro'),require('./routes/foro'));
//Public
app.use(express.static(path.join(__dirname, 'public')));
//Start
app.listen(app.get('port'),() =>{
    console.log('Servidor en puerto',app.get('port'));
});