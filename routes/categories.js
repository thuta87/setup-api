const express = require("express");
const Router = express.Router();
const mysqlCon=require("../connection");

//get all categories
Router.get("/",(req,res)=>{
	mysqlCon.query("SELECT *,null as child FROM categories",(err, rows, fields)=>{
		var cat_obj={};
		var tmp_obj={};

		function nestedItems(narrary,parent_id){
			var out=[]
			for (var i in narrary){
				
				if (narrary[i].parent_id==parent_id){
					var children=nestedItems(narrary,narrary[i].category_id)

					if(children.length){
						narrary[i].child=children
					}
					out.push(narrary[i]);
				}
			}
			return out
		}

		cat_obj=nestedItems(rows,0);

		if (!err) {
			res.send(cat_obj);
		}else{
			console.log(err); 
		}
	});
})


// get category by id
Router.get("/:category_id",(req,res)=>{
	mysqlCon.query("SELECT * FROM categories where category_id=?",[req.params.category_id],(err, rows, fields)=>{
		if (!err) {
			if (!rows.length){
				res.status(404).send("The category with the given ID was not found.");
			}else{
				res.send(rows);
			}
		}else{
			console.log(err); 
		}
	});
})

// remove category by id
Router.delete("/remove/:category_id",(req,res)=>{
	mysqlCon.query("DELETE FROM categories where category_id=?",[req.params.category_id],(err, rows, fields)=>{
		if (!err) {
			res.send("Removed successfully");
		}else{
			console.log(err); 
		}
	});
})

//edit category
Router.put("/edit",(req,res)=>{
	mysqlCon.query("Update categories set category_code='"+req.body.category_code+"',"
		+"category_name='"+req.body.category_name+"',"
		+"description='"+req.body.description+"',"
		+"category_image='"+req.body.category_image+"',"
		+"Where category_id="+req.body.category_id,
	(err,rows,fields)=>{
		if (!err) {
			res.send("Edit category successfully.");
		}else{
			console.log(err); 
		}
	});
})


//add new category
Router.post("/add",(req,res)=>{
	mysqlCon.query("Insert Into categories(category_code,category_name,description,category_image)"+
		"Values('"+req.body.category_code+"',"
		+"'"+req.body.category_name+"',"
		+"'"+req.body.description+"',"
		+"'"+req.body.category_image+"')",(err,rows,fields)=>{

		if (!err) {
			res.send("Add new category successfully.");
		}else{
			console.log(err); 
		}
	});
})

module.exports=Router;
