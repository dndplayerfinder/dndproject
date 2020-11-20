const express = require('express');
const { Session } = require('express-session');
const router = express.Router();
const { session } = require('passport');

router.get('/',(req,res)=>{
    res.redirect("/grupo");
});

module.exports = router;