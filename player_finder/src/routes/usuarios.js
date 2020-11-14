const express = require('express');
const router = express.Router();
const pool = require('../database');
const { post } = require('./authentication');
const app = express();

router.post('/rate_player',async(req,res)=>{
    const {player_rated,puntuacion}= req.body
    const rating ={
        player_rated,
        puntuacion
    };

    try {
        logged = await pool.query("insert into usuario_puntuacion(usuario_puntuador,usuario_punteado,puntaje)values(?,?,?) where not(usuario_punteador=? and usuario_punteado=?",[sess.login,rating.player_rated,rating.puntuacion,sess.login,rating.player_rated]);
        res.send('Usuario Puntuado');
    } catch (error) {
        
    }
});

module.exports = router;