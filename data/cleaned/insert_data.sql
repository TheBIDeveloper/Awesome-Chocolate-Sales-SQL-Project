USE ChocolateSales;
GO

-- Products
INSERT INTO products VALUES
(1, 'Dark Chocolate Bar', 'Chocolate', 2.50),
(2, 'Milk Chocolate Bar', 'Chocolate', 2.00),
(3, 'Chocolate Truffle', 'Chocolate', 3.50),
(4, 'Chocolate Box', 'Gift', 10.00),
(5, 'White Chocolate Bar', 'Chocolate', 2.75);

-- Customers
INSERT INTO customers VALUES
(101, 'Akshay Kalamkar', 'Pune', 'Maharashtra'),
(102, 'Rahul Verma', 'Mumbai', 'Maharashtra'),
(103, 'Sneha Patil', 'Bangalore', 'Karnataka'),
(104, 'Amit Sharma', 'Delhi', 'Delhi'),
(105, 'Neha Joshi', 'Hyderabad', 'Telangana');

-- Stores
INSERT INTO stores VALUES
(201, 'ChocoHeaven Pune', 'Pune', 'Maharashtra'),
(202, 'SweetTreats Mumbai', 'Mumbai', 'Maharashtra'),
(203, 'ChocoLand Bangalore', 'Bangalore', 'Karnataka'),
(204, 'CandyWorld Delhi', 'Delhi', 'Delhi'),
(205, 'ChocoJoy Hyderabad', 'Hyderabad', 'Telangana');

-- Sales
INSERT INTO sales VALUES
(1001, 1, 101, 201, '2024-01-01', 3, 7.50),
(1002, 2, 102, 202, '2024-01-02', 5, 10.00),
(1003, 3, 103, 203, '2024-01-03', 2, 7.00),
(1004, 4, 104, 204, '2024-01-04', 1, 10.00),
(1005, 5, 105, 205, '2024-01-05', 4, 11.00),
(1006, 1, 102, 202, '2024-01-06', 6, 15.00),
(1007, 3, 101, 201, '2024-01-07', 3, 10.50),
(1008, 2, 104, 204, '2024-01-08', 2, 4.00),
(1009, 5, 103, 203, '2024-01-09', 5, 13.75),
(1010, 4, 105, 205, '2024-01-10', 2, 20.00);
