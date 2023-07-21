
SELECT * FROM boxes b;
SELECT * FROM brands b;
SELECT * FROM categorys b;
SELECT * FROM colleges b;
SELECT * FROM courses b;
SELECT * FROM currency b;
SELECT * FROM customers b;
SELECT * FROM customer_transactions b;
SELECT * FROM expenses b;
SELECT * FROM groups b;
SELECT * FROM login_logs b;
SELECT * FROM pos_register b;
SELECT * FROM pos_templates b;
SELECT * FROM pos_template_to_store b;
SELECT * FROM printer_to_store b;
SELECT * FROM printers b;
SELECT * FROM products b;
SELECT * FROM product_images b;
SELECT * FROM product_to_college b;
SELECT * FROM product_to_store b;
SELECT * FROM purchase_info b;
SELECT * FROM purchase_item b;
SELECT * FROM purchase_logs b;
SELECT * FROM purchase_payments b;
SELECT * FROM purchase_price b;
SELECT * FROM sell_logs b;
SELECT * FROM selling_info b;
SELECT * FROM selling_item b;
SELECT * FROM selling_price b;
SELECT * FROM shortcut_links b;
SELECT * FROM supplier_to_store b;
SELECT * FROM suppliers b;
SELECT * FROM users b;
SELECT * FROM user_to_store b;
SELECT * FROM settings s;


TRUNCATE TABLE colleges;
TRUNCATE TABLE login_logs;
TRUNCATE TABLE product_to_college;
TRUNCATE TABLE login_logs;
TRUNCATE TABLE purchase_info ;
TRUNCATE TABLE purchase_item ;
TRUNCATE TABLE purchase_logs ;
TRUNCATE TABLE purchase_payments ;
TRUNCATE TABLE purchase_price ;
TRUNCATE TABLE sell_logs ;
TRUNCATE TABLE selling_info ;
TRUNCATE TABLE selling_item ;
TRUNCATE TABLE selling_price ;

DELETE FROM product_to_store WHERE store_id>1;
UPDATE product_to_store pts SET pts.quantity_in_stock = 0;
ALTER TABLE product_to_store AUTO_INCREMENT = 1;

DELETE FROM customers WHERE customer_id>1;
ALTER TABLE customers AUTO_INCREMENT = 1;

DELETE FROM users WHERE id>4;
ALTER TABLE users AUTO_INCREMENT = 1;

DELETE FROM user_to_store WHERE store_id>1;
DELETE FROM user_to_store WHERE user_id>4;
ALTER TABLE user_to_store AUTO_INCREMENT = 1;


DELETE FROM pos_template_to_store WHERE pt2s>2;
ALTER TABLE pos_template_to_store AUTO_INCREMENT = 1;

DELETE FROM supplier_to_store WHERE s2s_id>1;
ALTER TABLE supplier_to_store AUTO_INCREMENT = 1;


DELETE FROM printer_to_store WHERE p2s_id>1;
ALTER TABLE printer_to_store AUTO_INCREMENT = 1;

DELETE FROM customer_to_store WHERE c2s_id>1;
ALTER TABLE customer_to_store AUTO_INCREMENT = 1;

DELETE FROM stores WHERE store_id>1;
ALTER TABLE stores AUTO_INCREMENT = 1;


SELECT * FROM language_translations l WHERE l.lang_key='label_usermane';