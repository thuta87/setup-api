
const express = require("express");
const bodyParser = require("body-parser");
const mysqlCon=require("./connection");
const productsRoutes= require("./routes/products")
const categoriesRoutes= require("./routes/categories")
const collectionsRoutes= require("./routes/collections")
const channelsRoutes= require("./routes/channels")

var app=express();
app.use(bodyParser.json());

app.use("/products", productsRoutes);
app.use("/categories", categoriesRoutes);
app.use("/collections", collectionsRoutes);
app.use("/channels", channelsRoutes);

app.listen(3000);