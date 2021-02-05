const dal = require("../data-access-layer/dal");

async function getAllProductsAsync() {
  const sql = `SELECT productId, C.categoryName, name, manufactureDate , expirationDate , price  
    FROM products  AS P 
    JOIN categories as C 
    on P.categoryId = C.categoryId`;

  const products = await dal.executeAsync(sql);
  return products;
}

async function addProductAsync(product) {
  const sql = `INSERT INTO products VALUES(
        DEFAULT,
        '${product.categoryId}',
        '${product.name}',
        '${product.manufactureDate}',
        '${product.expirationDate}',
        ${product.price})`;
    const info = await dal.executeAsync(sql);
    product.productId = info.insertId;

    // Add also the name of the furniture which resides in a different table:
    product.categoryName = await getCategoryName(product.categoryId)

    return product
}

async function getCategoryName(categoryId) {
    const sql = `SELECT DISTINCT categoryName 
    FROM categories 
    WHERE categoryId = ${categoryId}`;
    const categories = await dal.executeAsync(sql);
    console.log(categories[0].categoryName);
    return categories[0].categoryName
}

async function getAllCategoriesAsync() {
    const sql = `SELECT * FROM categories`
    const categories = await dal.executeAsync(sql);
    return categories
}

async function deleteProductAsync(id){
    const sql = `DELETE FROM products WHERE productId= ${id}`
    await dal.executeAsync(sql)
}
module.exports = {
    getAllProductsAsync,
    addProductAsync,
    getAllCategoriesAsync,
    deleteProductAsync

}