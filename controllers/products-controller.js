const express = require("express");
const router = express.Router();
const productsLogic = require("../business-logic-layer/ampm-store-logic");

router.get("/", async (request, response) => {
  try {
    const products = await productsLogic.getAllProductsAsync();
    response.json(products);
  } catch (err) {
    response.status(500).send(err.message);
  }
});

router.post("/", async (request, response) => {
  try {
    const product = request.body;
    const addedProduct = await productsLogic.addProductAsync(product);
    response.status(201).send(addedProduct);
  } catch (err) {
    response.status(500).send(err.message);
  }
});

router.get("/categories", async(request,response)=>{
    try{
       const categories = await productsLogic.getAllCategoriesAsync();
       response.json(categories) 
    }catch(err){
        response.status(500).send(err.message);
    }
})

module.exports = router;