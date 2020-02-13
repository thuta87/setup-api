
const mysql = require("mysql");

var mysqlCon=mysql.createConnection({
	host: "localhost",
	user: "root",
	password: "",
	database: "product",
	multipleStatements: true
});

mysqlCon.connect((err)=>{
	if (!err) {
		console.log("Connection success.");
	}else{
		console.log("Connection failed.")
	}

});

module.exports=mysqlCon;