-- Customers table
/*CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(20),
    country VARCHAR(50),
    registration_date DATE DEFAULT CURRENT_DATE
);

-- Products table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    cost DECIMAL(10,2),
    stock_quantity INT DEFAULT 0,
    supplier_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Pending',
    total_amount DECIMAL(12,2),
    payment_method VARCHAR(50),
    shipping_address TEXT
);

-- Order items table
CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    discount DECIMAL(10,2) DEFAULT 0.00
);

-- Suppliers table
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address TEXT
);

-- Employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    hire_date DATE,
    position VARCHAR(50),
    salary DECIMAL(12,2),
    manager_id INT REFERENCES employees(employee_id)
);

-- Insert sample data
INSERT INTO customers (first_name, last_name, email, city, country) VALUES
('John', 'Doe', 'john.doe@email.com', 'New York', 'USA'),
('Jane', 'Smith', 'jane.smith@email.com', 'London', 'UK'),
('Robert', 'Johnson', 'robert.j@email.com', 'Chicago', 'USA'),
('Emily', 'Davis', 'emily.d@email.com', 'Sydney', 'Australia');

INSERT INTO products (product_name, category, price, cost, stock_quantity) VALUES
('Laptop Pro', 'Electronics', 999.99, 650.00, 50),
('Wireless Headphones', 'Electronics', 89.99, 45.00, 100),
('Desk Chair', 'Furniture', 149.99, 80.00, 30),
('Coffee Maker', 'Appliances', 49.99, 25.00, 75);

INSERT INTO orders (customer_id, total_amount, status) VALUES
(1, 999.99, 'Completed'),
(2, 239.98, 'Completed'),
(3, 149.99, 'Shipped'),
(1, 49.99, 'Pending');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 999.99),
(2, 2, 2, 89.99),
(3, 3, 1, 149.99),
(4, 4, 1, 49.99);

INSERT INTO suppliers (supplier_name, contact_person, email) VALUES
('TechGadgets Inc.', 'Mike Johnson', 'mike@techgadgets.com'),
('HomeEssentials Ltd.', 'Sarah Williams', 'sarah@homeessentials.com');

INSERT INTO employees (first_name, last_name, email, position, salary) VALUES
('David', 'Wilson', 'david@company.com', 'Manager', 75000.00),
('Lisa', 'Brown', 'lisa@company.com', 'Sales Associate', 45000.00);

SELECT * FROM customers;

SELECT
    c.first_name,
    c.last_name,
    o.order_id,
    o.total_amount
FROM
    customers AS c
INNER JOIN
    orders AS o ON c.customer_id = o.customer_id
ORDER BY
    o.order_date
LIMIT 1;

SELECT
    c.first_name,
    c.last_name,
    o.order_id,
    o.total_amount
FROM
    customers AS c
LEFT JOIN
    orders AS o ON c.customer_id = o.customer_id
ORDER BY
    c.last_name;
	SELECT
    c.first_name,
    c.last_name,
    o.order_id,
    o.total_amount
FROM
    customers AS c
RIGHT JOIN
    orders AS o ON c.customer_id = o.customer_id;
	SELECT
    product_name,
    price
FROM
    products
WHERE
    product_id IN (
        SELECT
            product_id
        FROM
            order_items
        WHERE
            order_id IN (
                SELECT
                    order_id
                FROM
                    orders
                WHERE
                    total_amount > 200
            )
    );SELECT
    SUM(price * stock_quantity) AS total_inventory_value,
    AVG(price) AS average_product_price
FROM
    products
WHERE
    category = 'Electronics';
	CREATE VIEW customer_order_summary AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name;*/
	CREATE INDEX idx_orders_customer_id ON orders (customer_id);