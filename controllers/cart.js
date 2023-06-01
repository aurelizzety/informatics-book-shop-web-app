var Cart = require('../models/cart');
var Book = require('../models/book');

// Cart
exports.addToCart = (req, res) => {
    var bookId = req.params.id;
    var cart = new Cart(req.session.cart ? req.session.cart : {});
    var book = new Book();

    book.getProduct(bookId, (err, results)=> {
      if(err) throw err;

      cart.add(results[0], bookId);
      req.session.cart = cart;

      res.redirect('/detail/'+bookId);
    })   
}
  
exports.cart = (req, res) => {
    var cart = new Cart(req.session.cart ? req.session.cart : {});
    res.render('cart', {    
      products: cart.getItems(),
      total : cart.totalItems,
      totalPrice: cart.totalPrice
    });
}
  
exports.remove = (req, res) => {
    var bookId = req.params.id;
    var cart = new Cart(req.session.cart ? req.session.cart : {});
  
    cart.remove(bookId);
    req.session.cart = cart;
    res.redirect('/cart');
}