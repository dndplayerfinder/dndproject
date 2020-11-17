const express = require('express');
const router = express.Router();

router.get('/',(req,res)=>{
    console.log(req.session.login);
    res.render("index");
});

module.exports = router;