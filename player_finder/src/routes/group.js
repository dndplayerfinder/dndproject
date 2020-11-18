const express = require('express');
const router = express.Router();
const pool = require('../database');
const app = express();

router.get('/grupo', async(req,res)=>{
    const sess = req.session;
    const grupos = await pool.query("SELECT * FROM dnd.group_info ");
    console.log(grupos[0].Nombre);
    res.render('grupos/grupo',{grupos,sess});
});

router.get('/crear_grupo',async (req,res)=>{
    try {
        const manuales = await pool.query("SELECT *FROM manual order by manual");
        console.log(manuales);
        res.render('grupos/crear_grupo',{manuales});
    } catch (error) {
        
    }
});
router.post('/addgroup',async(req,res)=>{
    const {g_name,g_limite_miembros,hora_inicio,hora_final,zona_horaria,dias,mod} = req.body;
    const new_group={
        g_name,
        g_limite_miembros,
        hora_inicio,
        hora_final,
        zona_horaria,
        dias,
        mod
    };
    var checkbox_array = document.querySelectorAll('input[type=checkbox]:checked');
    try {
        const logged = await pool.query("call IUD_Usuario(0,?,?,?,0,'INSERT')",[new_user.usuario,new_user.password,new_user.correo]);
        const group = logged[0];
        console.log(l_user); 
            var sess = req.session;
            sess.usuario = l_user.login;
        res.send('Registrado en el sistema'); 
        try {
            while(checkbox_array.length>0){
                var l_manuals = await pool.query("insert into grupo_manual(grupo_id,manual_id) values(?,?)",[group.grupo_id,checkbox_array.pop()]);
            }
        } catch (error) { 
        }
    } catch (error) {
        req.flash('success', 'Registro no válido!');
        res.redirect('back');
    }
    
});

module.exports = router;