const { response } = require('express');
const e = require('express');
const express = require('express');
const router = express.Router();
const pool = require('../database');
const app = express();

router.get('/ver', async(req,res)=>{
    const sess = req.session;
    
    if(!sess.user_id){
        res.redirect('/registro');
    }

    var id_button =req.query.id;
    console.log(req.query);
    try {
        const consulta = await pool.query("select * from group_info where grupo_id=?",[id_button]);
        console.log("Obteniendo manuales "+sess.user_id);
        let m = await pool.query("select * from g_manual where grupo_id=?",[id_button]);
        const grupo = consulta[0];
        const miembro = await pool.query("select * from miembros where grupo_id=? and usuario_id=?",[id_button,sess.user_id]);
        //Se intenta ver el valor dm dentro de miembro, si falla eso quiere decir que no es miembro del grupo
        try {
            //Si es miembro revisa si es el dueño
            if(miembro[0].dm==sess.user_id){
                grupo.dm = miembro[0].dm;
            }
            grupo.integrante = await pool.query("select usuario_id,miembro_login,rating from miembros where grupo_id=?",[id_button]);
            
            console.log("Imprimiento integrantes")
            console.log(grupo.integrante);
            //Se cargan los foros del grupo si es miembro
            //Si no es miembro produce un error al buscar en un parametro indefinido
            //por lo que salta hacia abajo y no hace la busqueda
            grupo.foros = await pool.query("select * from foro_info where grupo_id=? order by foro_id ",[id_button]);
        } catch (error) {
            console.log("No es miembro");
        }
        
        grupo.manuals=m;
        grupo.miembro = miembro[0];
        console.log(grupo);
        res.render("grupos/ver",grupo);
    } catch (error) {
        
    }
});

router.get('/', async(req,res)=>{
    const sess = req.session;
    if(!sess.user_id){
        res.redirect('/registro');
    }
    try {
        const grupos = await pool.query("SELECT * FROM dnd.group_info ");
        let tam = await pool.query("select * from group_lenght");
        const manuals = await pool.query("select * from manual");
        const mods = await pool.query("select * from modulo");
        try {
            for(i=0;i<tam[0].lenght;i++){
                var id = grupos[i].grupo_id;
                try {
                    grupos[i].manuales =  await pool.query("select * from g_manual where grupo_id=?",[id]);
                    
                    try {
                        var amigos = await pool.query("call get_friends(?,?)",[sess.user_id,id]);
                        grupos[i].amigos= amigos[0][0].num;
                        console.log(amigos[0][0].num);
                    } catch (error) {
                        grupos[i].amigos = 0;
                    }
                    
                } catch (error) {
                    grupos[i].manuales = 0;
                }
            }
            res.render('grupos/grupo',{grupos,sess,manuals,mods});
        } catch (error) {
            
        }
        
    } catch (error) {
        
    }
    
});

router.get('/crear_grupo',async (req,res)=>{
    var sess = req.session;
    if(!sess.user_id){
        res.redirect('/registro');
    }
    try {
        const manuales = await pool.query("SELECT *FROM manual order by manual");
        const modulos = await pool.query("SELECT *FROM modulo order by modulo");
        res.render('grupos/crear_grupo',{manuales,modulos});
    } catch (error) {
        
    }
});
router.post('/addgroup',async(req,res)=>{
    const {g_name,g_limite_miembros,zona,dias,mod,desc,rules,h_inicio,h_final,m_inicio,m_final} = req.body;
    const new_group={
        g_name,
        g_limite_miembros,
        h_inicio,
        m_inicio,
        m_final,
        h_final,
        zona,
        dias,
        mod,
        desc,
        rules
    };
    var hora_inicio= new_group.h_inicio+":"+new_group.m_inicio;
    var hora_final= new_group.h_final+":"+new_group.m_final;
    var manuales = req.body.manual;
    var index = 0;
    var only1=false;
    try {
        manuales.forEach(element => {
            index++;
        });
    } catch (error) {
         only1 = true;
         console.log("Solo un manual");
    }
    
    console.log(index);
    var id = req.session.user_id;
    try {
        const logged = await pool.query("call IUD_grupo(0,?,?,?,?,?,?,?,?,?,?,'INSERT')",[id,new_group.g_name,new_group.g_limite_miembros,hora_inicio,hora_final,new_group.zona,new_group.dias,new_group.mod,new_group.desc,new_group.rules]);
        const group = await pool.query("select *from grupo order by grupo_id desc limit 1");
        const g_id = group[0].grupo_id;
        console.log(g_id);
        const joinG = await pool.query("call Join_Group(?,?)",[g_id,id]);
        console.log("Ingresado al grupo");
        const foro = await pool.query("call IUD_foro(0,'Dudas',?,'Foro para contestar dudas','INSERT')",[g_id]);
        console.log("Foro ingresado");
        try {
            if(only1){
                var g = await pool.query("insert into grupo_manual(grupo_id,manual_id) values(?,?)",[g_id,manuales]);
            }
            else{
                for(i=0;i<index;i++){
                    var g = await pool.query("insert into grupo_manual(grupo_id,manual_id) values(?,?)",[g_id,manuales[i]]);
                }
            }
            res.redirect("/grupo");
        } catch (error) {
            
        }
        
    } catch (error) {
        req.flash('success', 'Registro no válido!');
        console.log("No se pudo");
        res.redirect('back');
    }
    
});

router.post('/ver/join',async(req,res)=>{
    var sess = req.session;
    const {index} = req.body;
    const id = sess.user_id;
    console.log(id);
    try {
        const accion = pool.query("call Join_Group(?,?)",[index,id]);
        res.redirect("/grupo");e
    } catch (error) {
        console.log("Error al unirse");
    }
    
});
module.exports = router;