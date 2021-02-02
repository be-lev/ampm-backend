global.config = require("./config.json");
const express = require("express");
const cors = require("cors");
const productsController= require("./controllers/products-controller")

const server= express();

server.use(cors());
server.use(express.json());
server.use("/api/products", productsController);

server.listen(3003, ()=> console.log('Listing on 3003....'))