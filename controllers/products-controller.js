const { request, response } = require("express");
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
});

router.delete("/:id", async(request,response)=>{
    try{
const id = +request.params.id;
await productsLogic.deleteProductAsync(id)
response.sendStatus(204)
    }
    catch (err) {
        response.status(500).send(err.message);
    }
})

router.get("/products-by-category/:categoryName", async(request,response)=>{
    try{  
        const categoryName= request.params.categoryName
        const ProductsByCategoryName = await productsLogic.getProductsByCategoryNameAsync(categoryName);
        if(!ProductsByCategoryName) {
            response.status(404).send(`Category ${categoryName} not found.`);
            return;
        }
        response.json(ProductsByCategoryName) 
    }catch(err){
        response.status(500).send(err.message);
    }
})

module.exports = router;