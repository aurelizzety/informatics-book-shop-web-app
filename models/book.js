const conn = require('../config.js');

module.exports = function Book() {    
    this.getDeals = function(callback) {
        let sql = "SELECT * FROM book INNER JOIN deals ON book.id = deals.book_id";  
        conn.query(sql, callback);
    };
    this.getDetail = function(id, callback){
        let sql = "SELECT * FROM (select * from book where id ="+id+") as b LEFT JOIN deals ON b.id = deals.book_id AND b.id ="+id;  
        conn.query(sql, callback);
    };
    this.getProducts = function(category, callback){
        let sql = "SELECT * FROM (select * from book where category = '"+category+"') as b LEFT JOIN deals ON b.id = deals.book_id";  
        conn.query(sql, callback);
    };
    
    this.getProduct = function(bookId, callback){
        let sql = "SELECT * FROM (select * from book where id ="+bookId+") as b LEFT JOIN deals ON b.id = deals.book_id AND b.id ="+bookId;  
        conn.query(sql, callback);
    };
    
};