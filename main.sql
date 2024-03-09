-- Items table
CREATE TABLE Items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(255),
    price DECIMAL(10, 2),
    invoice_id INT,
    FOREIGN KEY (invoice_id) REFERENCES Invoices(invoice_id)
);

INSERT INTO Items (item_id, item_name, price, invoice_id)
VALUES
    (1, 'Coffee', 3.50, 1),
    (2, 'Tea', 2.50, 1),
    (3, 'Croissant', 2.00, 2),
    (4, 'Sandwich', 5.50, 2),
    (5, 'Cake', 4.00, 3),
    (6, 'Salad', 6.50, 3),
    (7, 'Smoothie', 4.50, 4),
    (8, 'Muffin', 2.50, 4),
    (9, 'Bagel', 3.00, 5),
    (10, 'Soup', 4.50, 5);

-- Invoices table
CREATE TABLE Invoices (
    invoice_id INT PRIMARY KEY,
    order_date DATETIME,
    customer_id INT,
    item_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (item_id) REFERENCES Items(item_id)
);

INSERT INTO Invoices (invoice_id, order_date, customer_id, item_id, quantity)
VALUES
    (1, '2023-01-01 08:30:00', 1, 1, 2),
    (2, '2023-01-02 12:45:00', 2, 3, 1),
    (3, '2023-01-03 10:15:00', 3, 5, 3),
    (4, '2023-01-04 09:00:00', 4, 2, 1),
    (5, '2023-01-05 11:30:00', 5, 4, 2),
    (6, '2023-01-06 14:00:00', 1, 6, 1),
    (7, '2023-01-07 16:45:00', 2, 8, 3),
    (8, '2023-01-08 13:20:00', 3, 10, 2),
    (9, '2023-01-09 18:00:00', 4, 7, 1),
    (10, '2023-01-10 20:30:00', 5, 9, 2),
    (11, '2023-01-11 11:15:00', 6, 5, 1),
    (12, '2023-01-12 15:00:00', 7, 4, 3),
    (13, '2023-01-13 17:45:00', 8, 3, 2),
    (14, '2023-01-14 14:30:00', 9, 1, 1),
    (15, '2023-01-15 10:00:00', 10, 2, 2),
    (16, '2023-01-16 12:45:00', 1, 8, 1),
    (17, '2023-01-17 09:30:00', 2, 6, 3),
    (18, '2023-01-18 14:15:00', 3, 9, 2),
    (19, '2023-01-19 16:00:00', 4, 7, 1),
    (20, '2023-01-20 11:45:00', 5, 10, 2);

-- Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    email VARCHAR(255),
    birthdate DATE,
    member_date DATE
);

INSERT INTO Customers (customer_id, email, birthdate, member_date)
VALUES
    (1, 'customer1@example.com', '1990-01-15', '2022-01-01'),
    (2, 'customer2@example.com', '1985-05-20', '2022-02-05'),
    (3, 'customer3@example.com', '1988-08-10', '2022-03-10'),
    (4, 'customer4@example.com', '1995-03-25', '2022-04-15'),
    (5, 'customer5@example.com', '1980-12-05', '2022-05-20'),
    (6, 'customer6@example.com', '1993-09-18', '2022-06-25'),
    (7, 'customer7@example.com', '1987-06-30', '2022-07-30'),
    (8, 'customer8@example.com', '1994-02-14', '2022-08-05'),
    (9, 'customer9@example.com', '1982-04-22', '2022-09-10'),
    (10, 'customer10@example.com', '1998-07-08', '2022-10-15');

-- RUN PREVIEW
.print #######################
.print #### SQL Challenge ####
.print #######################

.print \n Items table
.mode box
select * from Items limit 5;

.print \n Invoices table
.mode box
select * from Invoices limit 5;

.print \n Customers table
.mode box
select * from Customers limit 5;


