var Cart = require("../models/cart");
const Book = require("../models/book");

// Home page
exports.Home = (req, res) => {
    var cart = new Cart(req.session.cart ? req.session.cart : {});   
    var book = new Book();

    book.getDeals((err, results) => {
        if(err) throw err;
        res.render('index', { 
            books: results,
            total : cart.totalItems 
        });
    })        
}

exports.Detail = (req, res) => {
    var cart = new Cart(req.session.cart ? req.session.cart : {});
    var book = new Book();

    let id = req.params.id;     
    book.getDetail(id, (err, results) => {
        if(err) throw err;
        res.render('detail', { 
            results,
            total : cart.totalItems 
        });
    })   
}

exports.Products = (req, res) => {
    // Session cart
    var cart = new Cart(req.session.cart ? req.session.cart : {});

    var book = new Book();
    // Category
    let category = req.query.category;  

    book.getProducts(category, (err, results)=> {
        if(err) throw err;
        res.render('product', { 
            books : results,
            total : cart.totalItems 
        });
    })     
}