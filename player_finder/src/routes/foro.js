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
        const action= await pool.query("select * from foro_info where foro_id=?",[id_button]);
        const foro = action[0];
        console.log("Foro:");
        console.log(foro);
        const mensajes = await pool.query("select * from mensaje where foro_id=? order by fecha",[id_button]);
        console.log("Mensajes:");
        console.log(mensajes);
        foro.mensajes = mensajes[0];

        res.render("foro/ver_foro",{foro});

    } catch (error) {
        
    }
});

module.exports = router;