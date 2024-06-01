INSERT INTO User (name, lastname, phone, birthday)
VALUES
('John', 'Doe', '123-456-7890', '1990-01-01'),
('Jane', 'Smith', '987-654-3210', '1995-05-15'),
('Alice', 'Johnson', '555-123-4567', '1988-12-30'),
('Bob', 'Brown', '444-555-6666', '1980-06-20'),
('Emily', 'Davis', '777-888-9999', '1999-09-25');

INSERT INTO Ticket (value, maturity, issuer, user_id)
VALUES
(50.00, '2024-06-01', 'ABC Corp', 1),
(100.00, '2024-06-02', 'XYZ Inc', 2),
(75.50, '2024-06-03', 'Acme Co', 3),
(200.00, '2024-06-04', 'Smith & Sons', 4),
(125.75, '2024-06-05', 'Johnson Enterprises', 5);

INSERT INTO Payment (value, pay_date, ticket_id)
VALUES
(100.00, '2024-05-01', 1),
(75.50, '2024-05-02', 2),
(200.00, '2024-05-03', 3),
(50.25, '2024-05-04', 4),
(150.75, '2024-05-05', 5);

INSERT INTO Bank (account, digit, type, sender, user_id, balance)
VALUES
('123456', '1', 'savings', 'NUBank', 1, 1500.00),
('987654', '2', 'checking', 'Caixa', 2, 2500.00),
('555555', '3', 'savings', 'Itau', 3, 1800.00),
('444444', '4', 'checking', 'Bradesco', 4, 3000.00),
('777777', '5', 'savings', 'Santander', 5, 2200.00);
