SELECT purchase_info.*, purchase_item.id, purchase_item.item_id, purchase_item.item_name, purchase_item.item_quantity, SUM(purchase_item.item_total) as purchase_price, SUM(purchase_item.item_quantity) as total_stock, 
SUM(item_selling_price * item_quantity) as paid_amount , item_purchase_price, item_selling_price, quantity_in_stock, selling_item.selling_quantity_item, (product_to_store.sell_price * product_to_store.quantity_in_stock) AS value_in_stock, category_id
FROM purchase_item 
      LEFT JOIN purchase_info ON (purchase_item.invoice_id = purchase_info.invoice_id)
      LEFT JOIN purchase_price ON (purchase_item.invoice_id = purchase_price.invoice_id)
      LEFT JOIN product_to_store ON (purchase_item.item_id = product_to_store.product_id AND purchase_item.store_id = product_to_store.store_id)
      LEFT JOIN (SELECT item_id, store_id, SUM(item_quantity- return_quantity) selling_quantity_item FROM selling_item GROUP BY item_id, store_id) AS selling_item ON (purchase_item.item_id = selling_item.item_id AND purchase_item.store_id = selling_item.store_id)
      WHERE purchase_info.inv_type != 'expense' AND purchase_item.store_id =1 AND purchase_item.item_id=165
      GROUP BY purchase_item.item_id
      ORDER BY total_stock DESC;
-- 
-- SELECT * FROM selling_item si WHERE si.item_id =1 AND si.store_id=2;
-- SELECT * FROM purchase_item p WHERE p.item_id=1 AND p.store_id=2;
-- SELECT * FROM products p WHERE p.p_name ='KIT EXPLORA Y APRENDE CON GUCHITO 3 - 4 AÑOS + PLATAFORMA'


SELECT purchase_info.*, categorys.category_name, purchase_item.id, purchase_item.category_id, purchase_item.item_quantity, SUM(purchase_item.item_total) as purchase_price, SUM(purchase_item.item_quantity) as total_stock, 
SUM(item_selling_price * purchase_item.item_quantity) as paid_amount, 0 unit_cost, (product_to_store.quantity_in_stock) AS quantity_in_stock, product_to_store.value_in_stock,selling_item.selling_quantity_item
FROM purchase_item 
LEFT JOIN categorys ON (purchase_item.category_id = categorys.category_id)
LEFT JOIN purchase_info ON (purchase_item.invoice_id = purchase_info.invoice_id)
LEFT JOIN purchase_price ON (purchase_item.invoice_id = purchase_price.invoice_id)
LEFT JOIN (SELECT category_id, store_id, SUM(product_to_store.quantity_in_stock) quantity_in_stock, SUM(product_to_store.sell_price * product_to_store.quantity_in_stock) value_in_stock 
FROM product_to_store LEFT JOIN products ON product_id = p_id  GROUP BY category_id, store_id) AS product_to_store ON (purchase_item.category_id = product_to_store.category_id AND purchase_item.store_id = product_to_store.store_id)
LEFT JOIN (SELECT category_id, store_id, SUM(item_quantity- return_quantity) selling_quantity_item FROM selling_item GROUP BY category_id, store_id) AS selling_item ON (purchase_item.category_id = selling_item.category_id AND purchase_item.store_id = selling_item.store_id)

WHERE purchase_info.inv_type != 'expense' AND purchase_item.store_id = 2-- AND item_id=1
GROUP BY purchase_item.category_id
ORDER BY total_stock DESC;


SELECT p.category_id, SUM(pts.quantity_in_stock)
 FROM product_to_store pts JOIN products p ON p.p_id = pts.product_id WHERE pts.store_id=2 GROUP BY p.category_id;


SELECT purchase_info.*, suppliers.sup_name, purchase_item.item_quantity, SUM(purchase_item.item_total) as purchase_price, SUM(purchase_item.item_quantity) as total_stock, 
SUM(item_selling_price * item_quantity) as paid_amount , 0 unit_cost, product_to_store.quantity_in_stock, value_in_stock, selling_item.selling_quantity_item
FROM purchase_info 
      LEFT JOIN suppliers ON (purchase_info.sup_id = suppliers.sup_id)
      LEFT JOIN purchase_item ON (purchase_info.invoice_id = purchase_item.invoice_id)
      LEFT JOIN purchase_price ON (purchase_info.invoice_id = purchase_price.invoice_id)
      LEFT JOIN (SELECT sup_id, store_id, SUM(product_to_store.quantity_in_stock) quantity_in_stock, SUM(product_to_store.sell_price * product_to_store.quantity_in_stock) value_in_stock 
                    FROM product_to_store LEFT JOIN products ON product_id = p_id  GROUP BY sup_id, store_id) AS product_to_store ON (purchase_info.sup_id = product_to_store.sup_id AND purchase_info.store_id = product_to_store.store_id)
      LEFT JOIN (SELECT sup_id, store_id, SUM(item_quantity- return_quantity) selling_quantity_item FROM selling_item GROUP BY sup_id, store_id) AS selling_item ON (purchase_info.sup_id = selling_item.sup_id AND purchase_info.store_id = selling_item.store_id)

WHERE purchase_info.inv_type != 'expense' AND purchase_item.store_id = 2-- AND item_id=1
      GROUP BY purchase_info.sup_id
      ORDER BY total_stock DESC;


SELECT * FROM stores s;
SELECT * FROM products p WHERE p.p_name LIKE '%PRESONITAS INICIAL 2%';
SELECT * FROM product_to_store p WHERE p.product_id =165;

SELECT * FROM purchase_item p WHERE p.item_id =165 AND p.store_id=1;
SELECT * FROM selling_item p WHERE p.item_id =165 AND p.store_id=1;
SELECT * FROM purchase_return_items p WHERE p.item_id =165 AND p.store_id=1;
SELECT * FROM return_items p WHERE p.item_id =165 AND p.store_id=1;
SELECT * FROM product_to_store p WHERE p.product_id =165 and p.store_id=1;
SELECT * FROM holding_item p WHERE p.item_id =165 AND p.store_id=1;
SELECT * FROM transfer_items p WHERE p.product_id =165 AND p.store_id=1;



SELECT * from sell_logs sl