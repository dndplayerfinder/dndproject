const express = require('express');
const multer = require('multer');
const { session } = require('passport');
const router = express.Router();
const pool = require('../database');
const app = express();

const uploadController = require("../controllers/upload");
const upload = require("../middleware/upload");


//const upload = multer({})

router.get('/registro',(req,res)=>{
    res.render('cuenta/registro',{layout:'login_layout'});
});
router.post('/registro',async(req,res)=>{
    
    const {correo,usuario,password,password_confirm,img} = req.body;
    const new_user={
        usuario,
        correo,
        password,
        password_confirm,
        img
    };
    
    console.log(new_user.img);
    if(new_user.password!=new_user.password_confirm){
        res.redirect('registro');
    }
    
    res.send('Registrado en el sistema'); 
   try {
       const logged = await pool.query("call IUD_Usuario(0,?,?,?,0,'INSERT')",[new_user.usuario,new_user.password,new_user.correo]);
        const l_user = logged[0];
        console.log(l_user);
            session.login = l_user.login;

            res.redirect("/");
    } catch (error) {
        req.flash('success', 'Registro no válido!');
        res.redirect('back');
    }
    
});

router.post('/login',async(req,res)=>{
    const {login_login,login_pwd} = req.body;
    const user={
        login_login,
        login_pwd
    };
    var query = "SELECT * FROM usuario where login='"+user.login_login+"' and password='"+user.login_pwd+"'";
    console.log(query);
    try {
        const logged = await pool.query("SELECT * FROM usuario where login=? and password=?",[user.login_login,user.login_pwd]);
        const l_user = logged[0];
        //console.log(l_user); 
            /*var sess = req.session;
            sess.usuario = l_user.login;
            console.log("logged");*/
        req.session.login = l_user.login;
        req.session.img = l_user.img;
        req.session.user_id = l_user.usuario_id;
        req.session.mail = l_user.mail;
        req.session.pwd = l_user.password;
        
       const rating =  await pool.query("SELECT promedio from user_info where usuario_id=?",[l_user.usuario_id]);
        const r = rating[0];
        req.session.rating = r.promedio;
        console.log(req.session);   
        res.redirect("/");
    }catch (error) {
        req.flash('success', 'Inicio de sesion no válido!');
        res.redirect('back');
    }
});

/*router.get('/upload', (req,res)=>{
    res.render('upload_test');
});*/

//router.post('/upload',upload.single("file"),uploadController.uploadFiles);
module.exports = router;