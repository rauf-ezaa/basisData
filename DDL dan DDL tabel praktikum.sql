
USE praktikum_basis_data;

CREATE TABLE customers (
    id_customer INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE products (
    id_product INT AUTO_INCREMENT PRIMARY KEY,
    nama_product VARCHAR(100) NOT NULL,
    harga DECIMAL(12,2) NOT NULL
);

CREATE TABLE orders (
    id_order INT AUTO_INCREMENT PRIMARY KEY,
    id_customer INT NOT NULL,
    tanggal_order DATE NOT NULL,
    total_harga DECIMAL(12,2) DEFAULT 0,

    CONSTRAINT fk_order_customer
      FOREIGN KEY (id_customer) REFERENCES customers(id_customer)
      ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE orders_detail (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_order INT NOT NULL,
    id_product INT NOT NULL,
    qty INT NOT NULL,
    harga_satuan DECIMAL(12,2) NOT NULL,
    subtotal DECIMAL(12,2) NOT NULL,

    CONSTRAINT fk_detail_order
      FOREIGN KEY (id_order) REFERENCES orders(id_order)
      ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT fk_detail_product
      FOREIGN KEY (id_product) REFERENCES products(id_product)
      ON DELETE CASCADE ON UPDATE CASCADE
);

-- INSERT DATA dummy

INSERT INTO customers (nama, email) VALUES
('Andi Saputra', 'andi@mail.com'),
('Budi Santoso', 'budi@mail.com'),
('Citra Dewi', 'citra@mail.com');

INSERT INTO products (nama_product, harga) VALUES
('Laptop Asus ROG', 26000000),
('Keyboard Mechanical', 750000),
('Mouse Wireless', 350000),
('Monitor 24 Inch', 1800000);

INSERT INTO orders (id_customer, tanggal_order, total_harga) VALUES
(1, '2025-01-01', 0),
(1, '2025-01-03', 0),
(2, '2025-01-10', 0);

-- insert details orders
INSERT INTO orders_detail (id_order, id_product, qty, harga_satuan, subtotal) VALUES
-- Order 1
(1, 1, 1, 26000000, 26000000),

-- Order 2
(2, 2, 2, 750000, 1500000),
(2, 3, 1, 350000, 350000),

-- Order 3
(3, 4, 1, 1800000, 1800000);

-- UPDATE harga di headers_orders
UPDATE orders 
SET total_harga = (
    SELECT SUM(subtotal) 
    FROM orders_detail 
    WHERE orders_detail.id_order = orders.id_order
);




