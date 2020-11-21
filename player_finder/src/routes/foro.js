const express = require('express');
const router = express.Router();
const pool = require('../database');
const { post } = require('./foro');
const { session } = require('passport');
const app = express();


router.get('/ver_foro',async(req,res)=>{
    const sess = req.session;
    
    if(!sess.user_id){
        res.redirect('/registro');
    }

    var id_button =req.query.id;

    console.log(id_button);
    try {
        const mensajes = await pool.query("select * mensaje where foro_id=?",[id_button]);
        mensajes.foro = id_button;

        res.render("/ver_foro",{mensajes});

    } catch (error) {
        
    }
});

module.exports = router;