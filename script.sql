CREATE TABLE user_roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    role_id INTEGER NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    FOREIGN KEY (role_id) REFERENCES user_roles(id)
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE sizes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    category_id INTEGER NOT NULL,
    size_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (size_id) REFERENCES sizes(id)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO user_roles (name) VALUES 
('admin'),
('customer'),
('guest');

INSERT INTO users (role_id, username, password) VALUES 
(2, 'alicej', 'hashed_password_1'),
(1, 'bobsmith', 'hashed_password_2'),
(2, 'charlieb', 'hashed_password_3');

INSERT INTO categories (name) VALUES 
('Clothing'),
('Electronics'),
('Books');

INSERT INTO sizes (name) VALUES 
('small'),
('medium'),
('large');

INSERT INTO products (category_id, size_id, name, price) VALUES 
(1, 2, 'Cotton T-Shirt', 25.00),
(2, 2, 'Wireless Headphones', 150.00),
(3, 1, 'Programming Book', 45.00);

INSERT INTO orders (user_id, total) VALUES 
(1, 50.00),
(2, 150.00),
(1, 135.00);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES 
(1, 1, 2, 25.00),
(2, 2, 1, 150.00),
(3, 3, 3, 45.00);