const express = require("express");
const Router = express.Router();
const mysqlCon=require("../connection");

//get all collections
Router.get("/",(req,res)=>{
	mysqlCon.query("SELECT *,null as child FROM collections",(err, rows, fields)=>{
		var col_obj={};
		var tmp_obj={};

		function nestedCollections(narrary,parent_id){
			var out=[]
			for (var i in narrary){
				
				if (narrary[i].parent_id==parent_id){
					var children=nestedCollections(narrary,narrary[i].collection_id)

					if(children.length){
						narrary[i].child=children
					}
					out.push(narrary[i]);
				}
			}
			return out
		}

		col_obj=nestedCollections(rows,0);

		if (!err) {
			res.send(col_obj);
		}else{
			console.log(err); 
		}
	});
})
// get collection by id
Router.get("/:collection_id",(req,res)=>{
	mysqlCon.query("SELECT * FROM collections where collection_id=?",[req.params.collection_id],(err, rows, fields)=>{
		if (!err) {
			if (!rows.length){
				res.status(404).send("The collection with the given ID was not found.");
			}else{
				res.send(rows);
			}
		}else{
			console.log(err); 
		}
	});
})

// remove collection by id
Router.delete("/remove/:collection_id",(req,res)=>{
	mysqlCon.query("DELETE FROM collections where collection_id=?",[req.params.collection_id],(err, rows, fields)=>{
		if (!err) {
			res.send("Removed successfully");
		}else{
			console.log(err); 
		}
	});
})

//edit collection
Router.put("/edit",(req,res)=>{
	mysqlCon.query("Update collections set collection_code='"+req.body.collection_code+"',"
		+"collection_name='"+req.body.collection_name+"',"
		+"description='"+req.body.description+"',"
		+"IsManual="+req.body.IsManual+","
		+"IsAuto="+req.body.IsAuto+","
		+"collection_image='"+req.body.collection_image+"',"
		+"Where collection_id="+req.body.collection_id,
	(err,rows,fields)=>{
		if (!err) {
			res.send("Edit collection successfully.");
		}else{
			console.log(err); 
		}
	});
})


//add new collection
Router.post("/add",(req,res)=>{
	mysqlCon.query("Insert Into collections(collection_code,collection_name,description,IsManual,IsAuto,collection_image)"+
		"Values('"+req.body.collection_code+"',"
		+"'"+req.body.collection_name+"',"
		+"'"+req.body.description+"',"+
		req.body.IsManual+","+
		req.body.IsAuto+","
		+"'"+req.body.collection_image+"')",(err,rows,fields)=>{

		if (!err) {
			res.send("Add new collection successfully.");
		}else{
			console.log(err); 
		}
	});
})

module.exports=Router;
