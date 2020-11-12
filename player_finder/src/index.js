const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');

const flash = require('connect-flash');
const session = require('express-session');
const mysqlstore = require('express-mysql-session');
const {database} = require('./keys');
const pool = require('./database');
const { pathToFileURL } = require('url');
//inicializaciones
const app = express();

// settings
app.set('port', process.env.PORT || 4000);
app.set('views', path.join(__dirname,'views'));
app.engine('.hbs',exphbs({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'),'layouts'),
    partialsDir: path.join(app.get('views'),'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
}))
app.set('view engine','.hbs');
//Middlewares

app.use(session({
    secret: 'secreto',
    resave: false,
    saveUninitialized: false,
    store: new mysqlstore(database)
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
//Public
app.use(express.static(path.join(__dirname, 'public')));
//Start
app.listen(app.get('port'),() =>{
    console.log('Servidor en puerto',app.get('port'));
});