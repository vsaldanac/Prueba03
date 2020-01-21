CREATE DATABASE prueba;
\C prueba;
CREATE TABLE categories(
id INT,
name VARCHAR(40),
description VARCHAR(100),
PRIMARY KEY(id)
);
CREATE TABLE products(
id SERIAL,
id_category INT,
name VARCHAR(40),
description VARCHAR(100),
price INT,
PRIMARY KEY(id),
FOREIGN KEY (id_category) REFERENCES categories(id)
);
CREATE TABLE clients(
id SERIAL,
name VARCHAR(40),
last_name VARCHAR(40),
rut VARCHAR(20),
address VARCHAR(80),
PRIMARY KEY(id)
);
CREATE TABLE bills(
bill_number INT,
id_client INT,
date DATE,
total_price INT,
PRIMARY KEY(bill_number),
FOREIGN KEY(id_client) REFERENCES clients(id)
);
CREATE TABLE purchases(
id SERIAL,
id_client INT,
id_product INT,
id_bill INT,
quantity INT,
FOREIGN KEY(id_client) REFERENCES clients(id),
FOREIGN KEY(id_product) REFERENCES products(id),
FOREIGN KEY(id_bill) REFERENCES bills(bill_number)
);
INSERT INTO clients (name, last_name, rut, address) VALUES ('NombreCliente1', 'ApellidoCliente1', '11.111.111-1','DirecciónCliente1');
INSERT INTO clients (name, last_name, rut, address) VALUES ('NombreCliente2', 'ApellidoCliente2', '22.222.222-2','DirecciónCliente2');
INSERT INTO clients (name, last_name, rut, address) VALUES ('NombreCliente3', 'ApellidoCliente3', '33.333.333-3','DirecciónCliente3');
INSERT INTO clients (name, last_name, rut, address) VALUES ('NombreCliente4', 'ApellidoCliente4', '44.444.444-4','DirecciónCliente4');
INSERT INTO clients (name, last_name, rut, address) VALUES ('NombreCliente5', 'ApellidoCliente5', '55.555.555-5','DirecciónCliente5');
INSERT INTO categories (id, name, description) VALUES (1, 'Categoría1', 'Soy una descripción de la categoría 1');
INSERT INTO categories (id, name, description) VALUES (2, 'Categoría2', 'Soy una descripción de la categoría 2');
INSERT INTO categories (id, name, description) VALUES (3, 'Categoría3', 'Soy una descripción de la categoría 3');
INSERT INTO products (id_category, name, description, price) VALUES (1, 'Producto1', 'Soy una descripción del producto 1', 10000);
INSERT INTO products (id_category, name, description, price) VALUES (1, 'Producto2', 'Soy una descripción del producto 2', 20000);
INSERT INTO products (id_category, name, description, price) VALUES (1, 'Producto3', 'Soy una descripción del producto 3', 30000);
INSERT INTO products (id_category, name, description, price) VALUES (2, 'Producto4', 'Soy una descripción del producto 4', 40000);
INSERT INTO products (id_category, name, description, price) VALUES (2, 'Producto5', 'Soy una descripción del producto 5', 50000);
INSERT INTO products (id_category, name, description, price) VALUES (2, 'Producto6', 'Soy una descripción del producto 6', 60000);
INSERT INTO products (id_category, name, description, price) VALUES (3, 'Producto7', 'Soy una descripción del producto 7', 70000);
INSERT INTO products (id_category, name, description, price) VALUES (3, 'Producto8', 'Soy una descripción del producto 8', 80000);
INSERT INTO bills (bill_number, id_client, date, total_price) VALUES (1, 1, '2020-01-21', 210000);
INSERT INTO bills (bill_number, id_client, date, total_price) VALUES (2, 1, '2020-01-21', 210000);
INSERT INTO bills (bill_number, id_client, date, total_price) VALUES (3, 2, '2020-01-21', 60000);
INSERT INTO bills (bill_number, id_client, date, total_price) VALUES (4, 2, '2020-01-21', 60000);
INSERT INTO bills (bill_number, id_client, date, total_price) VALUES (5, 2, '2020-01-21', 150000);
INSERT INTO bills (bill_number, id_client, date, total_price) VALUES (6, 3, '2020-01-21', 80000);
INSERT INTO bills (bill_number, id_client, date, total_price) VALUES (7, 4, '2020-01-21', 80000);
INSERT INTO bills (bill_number, id_client, date, total_price) VALUES (8, 4, '2020-01-21', 180000);
INSERT INTO bills (bill_number, id_client, date, total_price) VALUES (9, 4, '2020-01-21', 40000);
INSERT INTO bills (bill_number, id_client, date, total_price) VALUES (10, 4, '2020-01-21', 30000);
INSERT INTO purchases (id_client, id_product, id_bill, quantity) VALUES (1, 2, 1, 2);
INSERT INTO purchases (id_client, id_product, id_bill, quantity) VALUES (1, 8, 2, 3);
INSERT INTO purchases (id_client, id_product, id_bill, quantity) VALUES (2, 3, 3, 3);
INSERT INTO purchases (id_client, id_product, id_bill, quantity) VALUES (2, 4, 4, 2);
INSERT INTO purchases (id_client, id_product, id_bill, quantity) VALUES (2, 6, 5, 3);
INSERT INTO purchases (id_client, id_product, id_bill, quantity) VALUES (3, 9, 6, 1);
INSERT INTO purchases (id_client, id_product, id_bill, quantity) VALUES (4, 5, 7, 2);
INSERT INTO purchases (id_client, id_product, id_bill, quantity) VALUES (4, 7, 8, 3);
INSERT INTO purchases (id_client, id_product, id_bill, quantity) VALUES (4, 2, 9, 4);
INSERT INTO purchases (id_client, id_product, id_bill, quantity) VALUES (4, 4, 10, 1);

SELECT id, name FROM clients WHERE id IN (SELECT id_client FROM bills WHERE total_price > 100000);