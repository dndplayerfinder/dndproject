const express = require('express');
const router = express.Router();
const pool = require('../database');
const { post } = require('./authentication');
const { session } = require('passport');
const app = express();

router.get('/modificar_perfil',(req,res)=>{
    console.log("Entrando a modificar perfil");
    console.log(req.session.login);
    var sess = req.session
    res.render("usuarios/modificar_perfil",{sess});
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
    const {player_id}= req.body
    const player = player_id;

    try {
        logged = await pool.query("call Add_Friend(?,?)"[sess.login,player]);
        res.send('Usuario Agregado');
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
    const {new_mail,new_login,new_pwd,new_img} = req.body;

    const user ={
        new_login,
        new_pwd,
        new_img,
        new_mail
    };
    if(user.new_login==''){
        user.new_login = session.login;
    }
    if(user.new_pwd==''){
        user.new_pwd = session.login;
    }
    if(user.new_mail==''){
        user.new_mail= session.mail;
    }
    console.log(user);
    console.log(session);
    try {
        
    } catch (error) {
        
    }
});

module.exports = router;