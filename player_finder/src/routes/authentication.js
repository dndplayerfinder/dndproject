const express = require('express');
const router = express.Router();
const pool = require('../database');
const app = express();

router.get('/registro',(req,res)=>{
    res.render('cuenta/registro');
});
router.post('/registro',async(req,res)=>{
    const {correo,usuario,password} = req.body;
    const new_user={
        usuario,
        correo,
        password
    };
    console.log(new_user);
    res.send('Registrado en el sistema'); 
    try {
        /*const logged = await pool.query("call IUD_Usuario(0,?,?,?,0,'INSERT')",[new_user.usuario,new_user.password,new_user.correo]);
        const l_user = logged[0];
        console.log(l_user); 
            var sess = req.session;
            sess.usuario = l_user.login;*/
        res.send('Registrado en el sistema');  
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
        console.log(l_user); 
            var sess = req.session;
            sess.usuario = l_user.login;
            console.log("logged");
            res.send('Sesion iniciada '+l_user.login);
    }catch (error) {
        req.flash('success', 'Inicio de sesion no válido!');
        res.redirect('back');
    }
});
module.exports = router;