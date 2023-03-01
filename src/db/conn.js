const mysql = require("mysql");
const conn = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'cricheros',
});
conn.connect((err)=>{
    if(err){
        throw err;
    }
    console.log("Conntect database");
})


module.exports = conn;