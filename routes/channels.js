const express = require("express");
const Router = express.Router();
const mysqlCon=require("../connection");

//get all channels
Router.get("/",(req,res)=>{
	mysqlCon.query("SELECT * FROM channels",(err, rows, fields)=>{
		if (!err) {
			res.send(rows);
		}else{
			console.log(err); 
		}
	});
})
// get channel by id
Router.get("/:channel_id",(req,res)=>{
	mysqlCon.query("SELECT * FROM channels where channel_id=?",[req.params.channel_id],(err, rows, fields)=>{
		if (!err) {
			if (!rows.length){
				res.status(404).send("The channel with the given ID was not found.");
			}else{
				res.send(rows);
			}
		}else{
			console.log(err); 
		}
	});
})

// remove channel by id
Router.delete("/remove/:channel_id",(req,res)=>{
	mysqlCon.query("DELETE FROM channels where channel_id=?",[req.params.channel_id],(err, rows, fields)=>{
		if (!err) {
			res.send("Removed successfully");
		}else{
			console.log(err); 
		}
	});
})

//edit channel
Router.put("/edit",(req,res)=>{
	mysqlCon.query("Update channels set channel_name='"+req.body.channel_name+"',"
		+"is_physical="+req.body.is_physical+","
		+"address='"+req.body.address+"',"
		+"township='"+req.body.township+"'"
		+"Where channel_id="+req.body.channel_id,
	(err,rows,fields)=>{
		if (!err) {
			res.send("Edit channel successfully.");
		}else{
			console.log(err); 
		}
	});
})


//add new channel
Router.post("/add",(req,res)=>{
	mysqlCon.query("Insert Into channels(channel_name,is_physical,address,township)"+
		"Values('"+req.body.channel_name+"',"
		+req.body.is_physical+","
		+"'"+req.body.address+"',"
		+req.body.township+"')",(err,rows,fields)=>{

		if (!err) {
			res.send("Add new channel successfully.");
		}else{
			console.log(err); 
		}
	});
})

module.exports=Router;
