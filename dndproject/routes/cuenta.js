var express = require('express');
var router = express.Router();
var pool = require('../database');
const app= express();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.render('cuenta');
});

router.post('/login',(req,res)=>{
  const {login,password} = req.body;
  const user={
    login,
    password
  };
   /* try{
      const logged =  pool.query('SELECT * from usuario where login=? and password=?',[user.login,user.password]);
      const usr = logged[0];
          var sess = req.session;
          sess.login = usr.login;
          sess.img = img;
      }
      catch(e){
          req.flash('success', 'Inicio de sesión no válido!');
          res.redirect('back');
      }*/
  });
function hidePanel(){
  window.location.href="http://www.youtube.com";
}

module.exports = router;
