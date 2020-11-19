const express = require('express');
const router = express.Router();
const pool = require('../database');
const app = express();

router.get('/', async(req,res)=>{
    const sess = req.session;
    if(!sess.user_id){
        res.redirect('/registro');
    }
    try {
        const grupos = await pool.query("SELECT * FROM dnd.group_info ");
        //console.log(grupos);
        let tam = await pool.query("select * from group_lenght");        
        try {
            //console.log(manuales);
            console.log(sess.user_id);
            for(i=0;i<tam[0].lenght;i++){
                var id = grupos[i].grupo_id;
                try {
                    grupos[i].manuales =  await pool.query("select * from g_manual where grupo_id=?",[id]);
                    
                    console.log("Usuario: "+sess.user_id+" Grupo: "+id);
                    try {
                        var amigos = await pool.query("call get_friends(?,?)",[sess.user_id,id]);
                        grupos[i].amigos= amigos[0][0].num;
                        console.log("Amigos");
                        console.log(amigos[0]);
                        console.log(amigos[0][0].num);
                    } catch (error) {
                        grupos[i].amigos = 0;
                    }
                    
                } catch (error) {
                    grupos[i].manuales = 0;
                    //console.log("Error al buscar");
                    //console.log(grupos[i].manuales);
                }
               
                
            }
            //console.log(grupos[18].manuales);
            console.log(grupos);
            res.render('grupos/grupo',{grupos,sess});
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
    console.log(manuales);
    var index = 0;
    manuales.forEach(element => {
        index++;
    });
    console.log(index);
    /*for(i=0;i<index;i++){
        console.log(manuales[i]);
    }*/
    var id = req.session.user_id;
    //var sentencia=("call IUD_grupo(0,%s,'%s',%s,'%s,'%s',%s,%s,%s,'%s','%s','INSERT')",req.session.user_id,new_group.g_name,new_group.g_limite_miembros,hora_inicio,hora_final,new_group.zona,new_group.dias,new_group.mod,new_group.desc,new_group.rules);
    try {
        const logged = await pool.query("call IUD_grupo(0,?,?,?,?,?,?,?,?,?,?,'INSERT')",[id,new_group.g_name,new_group.g_limite_miembros,hora_inicio,hora_final,new_group.zona,new_group.dias,new_group.mod,new_group.desc,new_group.rules]);
        const group = await pool.query("select *from grupo order by grupo_id desc limit 1");
        const g_id = group[0].grupo_id;
        console.log(g_id);
        const joinG = await pool.query("call Join_Group(?,?)",[g_id,id]);
        try {
            for(i=0;i<index;i++){
                var g = await pool.query("insert into grupo_manual(grupo_id,manual_id) values(?,?)",[g_id,manuales[i]]);
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


module.exports = router;