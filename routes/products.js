const express = require("express");
const Router = express.Router();
const mysqlCon=require("../connection");

//get all products
Router.get("/",(req,res)=>{
	mysqlCon.query("SELECT * FROM products",(err, rows, fields)=>{
		if (!err) {
			res.send(rows);
		}else{
			console.log(err); 
		}
	});
})
// get product by id
Router.get("/:product_id",(req,res)=>{
	mysqlCon.query("SELECT * FROM products where product_id=?",[req.params.product_id],(err, rows, fields)=>{
		if (!err) {
			if (!rows.length){
				res.status(404).send("The product with the given ID was not found.");
			}else{
				res.send(rows);
			}
		}else{
			console.log(err); 
		}
	});
})

// remove product by id
Router.delete("/remove/:product_id",(req,res)=>{
	mysqlCon.query("DELETE FROM products where product_id=?",[req.params.product_id],(err, rows, fields)=>{
		if (!err) {
			res.send("Removed successfully");
		}else{
			console.log(err); 
		}
	});
})

Router.put("/edit",(req,res)=>{
	mysqlCon.query("Update products set product_name='"+req.body.product_name+"',"
		+"description='"+req.body.description+"',"
		+"image='"+req.body.image+"',"
		+"category_id="+req.body.category_id+","
		+"collection_id="+req.body.collection_id+","
		+"tags='"+req.body.tags+"',"
		+"original_price="+req.body.original_price+","
		+"retail_price="+req.body.retail_price+","
		+"sku='"+req.body.sku+"',"
		+"barcode='"+req.body.barcode+"',"
		+"negative_qty="+req.body.negative_qty+","
		+"is_physical="+req.body.is_physical+","
		+"weight="+req.body.weight+" Where product_id="+req.body.product_id,
	(err,rows,fields)=>{
		if (!err) {
			res.send("Edit product successfully.");
		}else{
			console.log(err); 
		}
	});
})


//add new product
Router.post("/add",(req,res)=>{
	//console.log(req.body);
	
	mysqlCon.query("Insert Into products(product_name,description,image,category_id,collection_id,tags,original_price,retail_price,sku,barcode,negative_qty,is_physical,weight)"+
		"Values('"+req.body.product_name+"',"
		+"'"+req.body.description+"',"
		+"'"+req.body.image+"',"+
		req.body.category_id+","+
		req.body.collection_id+","
		+"'"+req.body.tags+"',"+
		req.body.original_price+","+
		req.body.retail_price+","
		+"'"+req.body.sku+"',"
		+"'"+req.body.barcode+"',"+
		req.body.negative_qty+","+
		req.body.is_physical+","+
		req.body.weight+")",(err,rows,fields)=>{

		if (!err) {
			res.send("success");
		}else{
			console.log(err); 
		}
	});
	
})

module.exports=Router;
