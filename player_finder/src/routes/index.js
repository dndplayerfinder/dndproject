const express = require('express');
const { Session } = require('express-session');
const router = express.Router();
const { session } = require('passport');

router.get('/',(req,res)=>{
    console.log("Rainbow in The Dark");
    console.log(req.session);
    res.render("index");
});

module.exports = router;