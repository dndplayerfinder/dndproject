const express = require('express');
const router = express.Router();
const pool = require('../database');
const { post } = require('./usuarios');
const { session } = require('passport');
const app = express();

router.get('/modificar_perfil',async (req,res)=>{
    var sess = req.session;
    console.log(sess);
    if(!sess.user_id){
        res.redirect('/registro');
    }
    
    try {
        const friends = await pool.query("select * from friends_score where usuario1=?",[sess.user_id]);
        const groups = await pool.query("select * from miembros where usuario_id=?",[sess.user_id]);
        res.render("usuarios/modificar_perfil",{sess,friends,groups});
    } catch (error) {
        
    }
});

router.get('/ver_perfil',async(req,res)=>{
    var sess = req.session;
    console.log(sess);
    if(!sess.user_id){
        res.redirect('/registro');
    }
    var id_button =req.query.id;
    if(sess.user_id==id_button){
        res.redirect("../usuarios/modificar_perfil");
    }
    
    try {
        const action = await pool.query("select * from usuario where usuario_id=?",[id_button]);
        const usuario = action[0];
        console.log(usuario);
        res.render("usuarios/perfil",{usuario});
    } catch (error) {
        
    }
});

router.post('/rate_player',async(req,res)=>{
    const {player_rated,puntuacion}= req.body
    const rating ={
        player_rated,
        puntuacion
    };

    try {
        logged = await pool.query("call Rate_Player(?,?,?)",[sess.login,rating.player_rated,rating.puntuacion]);
        res.send('Usuario Puntuado');
    } catch (error) {
        
    }
});

router.post('/add_friend',async(req,res)=>{
    const {button} = req.body;
    const user = button;
    const sess = req.session;
    console.log("Solicitado "+user);
    console.log("Usuario "+sess.user_id);
    try {
        const logged = await pool.query("call Add_Friend(?,?)",[sess.user_id,user]);
        res.redirect("../usuarios/ver_perfil");
    } catch (error) {
        
    }
});


router.post('/Blacklist',async(req,res)=>{
    const {player_id}= req.body
    const player = player_id;

    try {
        logged = await pool.query("call Blacklist(?,?)"[sess.login,player]);
        res.send('Usuario Bloqueado');
    } catch (error) {
        
    }
});

router.post('/update_user', async(req,res)=>{
    const {new_mail,new_login,new_pwd} = req.body;
    const sess = req.session;
    var user ={
        new_login,
        new_pwd,
        new_mail
    };
    if(user.new_login==''){
        user.new_login = sess.login;
    }
    if(user.new_pwd==''){
        user.new_pwd = sess.pwd;
    }
    if(user.new_mail==''){
        user.new_mail= sess.mail;
    }
    console.log(user);
    console.log(sess.user_id);
    let id = sess.user_id;
    try {
        const change = await pool.query("call IUD_Usuario(?,?,?,?,0,'UPDATE')",[id,user.new_login,user.new_pwd,user.new_mail]);
        console.log("Valores cambiados");
        req.session.user_login = user.new_login;
        req.session.mail = user.new_pwd;
        req.session.pwd =  user.new_mail;
        res.redirect("/usuarios/modificar_perfil");
    } catch (error) {
        
    }
});

module.exports = router;