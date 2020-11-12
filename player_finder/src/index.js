const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');
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
app.use(morgan('dev'));
app.use(express.urlencoded({extended:false}));
app.use(express.json());
//Variables globales
app.use((req,res,next)=>{
    
    next();
});

//Routes
app.use(require('./routes'));
app.use(require('./routes/authentication'));
app.use('links',require('./routes/authentication'));
app.use('/usuarios',require('./routes/usuarios'));
//Public
app.use(express.static(path.join(__dirname, 'public')));
//Start
app.listen(app.get('port'),() =>{
    console.log('Servidor en puerto',app.get('port'));
});