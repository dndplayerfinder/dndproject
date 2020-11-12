const express = require('express');
const router = express.Router();

router.get('/registro',(req,res)=>{
    res.render('cuenta/registro');
});
router.post('/registro',(req,res)=>{
});
module.exports = router;