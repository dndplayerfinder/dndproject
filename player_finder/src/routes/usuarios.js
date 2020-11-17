const express = require('express');
const router = express.Router();
const pool = require('../database');
const { post } = require('./authentication');
const app = express();

router.get('/modificar_perfil',(req,res)=>{
    //if(sess.login!=null){
        res.render("usuarios/modificar_perfil");
    //}
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

module.exports = router;