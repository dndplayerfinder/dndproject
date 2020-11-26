const { response } = require('express');
const e = require('express');
const express = require('express');
const router = express.Router();
const pool = require('../database');
const app = express();

router.get('/comentarios',async(req,res)=>{
    var sess = req.session;
    console.log(sess);
    if(!sess.user_id){
        res.redirect('/registro');
    }
    else{
        if(sess.tipo!=1){
            res.redirect('/registro');
        }
    }
    try {
        const comentarios = await pool.query("SELECT * FROM puntuaciones_usuarios");
        const promedio = await pool.query("SELECT avg(puntuacion)promedio from puntuaciones");
        console.log(promedio);
        res.render('admin/comentarios',{layout:'admin_layout',comentarios,promedio});
    } catch (error) {
        
    }
});
module.exports = router;