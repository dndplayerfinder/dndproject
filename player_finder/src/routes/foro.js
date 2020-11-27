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
        const mensajes = await pool.query("select * from msj_info where foro_id=? order by fecha desc",[id_button]);
        console.log("Mensajes:");
        console.log(mensajes);
        msjs = mensajes;

        res.render("foro/ver_foro",{foro,msjs});

    } catch (error) {
        
    }
});

router.post('/enviar_msj',async(req,res)=>{
    var sess = req.session;
    const {foro,text} = req.body;

    const msj ={
        foro,
        text
    };
    console.log(msj);
    console.log(sess.user_id);
    try {
        const action = await pool.query("call Enviar_mensaje(?,?,?)",[sess.user_id,msj.foro,msj.text]);
        res.redirect("../foro/ver_foro?id="+msj.foro);
    } catch (error) {
        
    }
});


router.post('/delete_forum',async(req,res)=>{
    const {id_button,grupo_id} = req.body;

    const info ={
        id_button,
        grupo_id
    };
    console.log(info);

    try {
        //const del = await pool.query("DELETE * FROM foro where foro_id=?",[id_button.id_button]);

        res.redirect("/grupo/ver/?id="+info.grupo_id);
    } catch (error) {
        
    }
});

router.post('/crear_foro',async(req,res)=>{
    const {tema,descr,grupo_id} = req.body;

    const foro ={
        tema,
        descr,
        grupo_id
    }

    try {
        const action = pool.query("call IUD_foro(0,?,?,?,'INSERT')",[foro.tema,foro.grupo_id,foro.descr]);
        res.redirect("../grupo/ver?id="+foro.grupo_id);
        res.redirect("../grupo/ver?id="+foro.grupo_id);
    } catch (error) {
        
    }
});
module.exports = router;