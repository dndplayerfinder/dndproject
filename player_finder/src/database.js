const mysql =require('mysql');
const {database}= require('.keys');

const pool=mysql.createPool(database);