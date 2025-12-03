-- join 4 tabel 
SELECT 
    o.id_order,
    c.nama AS nama_customer,
    p.nama_product,
    d.qty,
    d.harga_satuan,
    d.subtotal,
    o.tanggal_order
FROM orders o
JOIN customers c ON o.id_customer = c.id_customer
JOIN orders_detail d ON o.id_order = d.id_order
JOIN products p ON d.id_product = p.id_product;


SELECT 
	d.id_order,
	d.qty,
	d.harga_satuan,
	d.subtotal,
	c.nama,
	prd.nama_product,
	o.total_harga
FROM orders o
JOIN customers c ON o.id_customer = c.id_customer
JOIN orders_detail d ON o.id_order = d.id_order
JOIN products prd ON d.id_product = prd.id_product;



-- join 3 tabel menampilkan data belanja per-customer
SELECT 
    c.nama,
    SUM(d.subtotal) AS total_pembelian
FROM customers c
JOIN orders o ON c.id_customer = o.id_customer
JOIN orders_detail d ON o.id_order = d.id_order
GROUP BY c.nama;