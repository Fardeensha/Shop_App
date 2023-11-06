const express = require("express");
const mongoose = require("mongoose");
const port = process.env.PORT || 3000;
const app = express();
const dotenv = require('dotenv');

dotenv.config();





mongoose.connect(`mongodb+srv://fardeenshakn10:${process.env.mongodbPassword}@cluster0.eyeqi4c.mongodb.net/?retryWrites=true&w=majority`);

const connection = mongoose.connection;
connection.once("open",()=> {
    console.log("MongoDb connected");
});



app.route("/").get((req,res)=>{
    res.json("Hello")
});


app.listen(port, "0.0.0.0",()=>{
    console.log("welcome we are running server at port:",port);
})