-- Create rental table in PostgreSQL
CREATE TABLE rental (
  id_rental SERIAL PRIMARY KEY,
  id_real_estate INTEGER NOT NULL,
  id_property INTEGER NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  price INTEGER NOT NULL,
  id_client INTEGER NOT NULL,
  id_transaction INTEGER NOT NULL
);

-- Insert data into rental table in PostgreSQL
INSERT INTO rental (id_real_estate, id_property, start_date, end_date, price, id_client, id_transaction)
VALUES
(1, 1, '2024-01-01', '2024-12-31', 1200, 1, 1),
(2, 2, '2024-02-01', '2024-11-30', 1500, 3, 3),
(3, 3, '2024-03-01', '2024-12-31', 1300, 4, 5),
(4, 4, '2024-04-01', '2025-03-31', 1800, 10, 10),
(5, 5, '2024-05-01', '2025-04-30', 1400, 9, 9),
(6, 6, '2024-06-01', '2025-05-31', 1600, 1, 2),
(7, 7, '2024-07-01', '2025-06-30', 1700, 7, 7),
(8, 8, '2024-08-01', '2025-07-31', 1100, 8, 8),
(9, 9, '2024-09-01', '2025-08-31', 1550, 3, 4),
(10, 10, '2024-10-01', '2025-09-30', 1250, 6, 6);

-- Create client table in PostgreSQL
CREATE TABLE client (
  id_client SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  warranty INTEGER,
  cuit BIGINT,
  id_client_type INTEGER
);

-- Insert data into client table in PostgreSQL
INSERT INTO client (id_client, first_name, last_name, warranty, cuit, id_client_type) VALUES
(1, 'franco', 'perex', 1, 2358473, 2),
(2, 'Juan', 'Franco', 1, 2345664, 2),
(3, 'Ana', 'Perez', 1, 3456789, 2),
(4, 'Carlos', 'Gomez', 1, 4567890, 2),
(5, 'Laura', 'Martinez', 1, 5678901, 2),
(6, 'Pedro', 'Sanchez', 0, 6789012, 1),
(7, 'Sofia', 'Lopez', 1, 7890123, 2),
(8, 'Marta', 'Diaz', 0, 8901234, 1),
(9, 'Luis', 'Garcia', 1, 9012345, 2),
(10, 'Elena', 'Rodriguez', 1, 1234567, 2);

-- Create cp table in PostgreSQL
CREATE TABLE postal_code (
  id_cp SERIAL PRIMARY KEY,
  id_province INTEGER NOT NULL,
  id_city INTEGER NOT NULL
);

-- Insert data into cp table in PostgreSQL
INSERT INTO postal_code (id_province, id_city, id_cp) VALUES
(105, 1000, 200),
(108, 1006, 201),
(104, 1002, 202),
(104, 1003, 203),
(105, 1004, 204),
(105, 1005, 205),
(107, 1006, 206),
(107, 1007, 207),
(108, 1008, 208),
(109, 1009, 209);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

-- Create states table in PostgreSQL
CREATE TABLE states (
  id_state INTEGER NOT NULL,
  type_name VARCHAR(50) NOT NULL
);

-- Insert data into states table in PostgreSQL
INSERT INTO states (id_state, type_name) VALUES
(1, 'Rented'),
(2, 'Vacant'),
(3, 'Suspended');

-- Create expenses table in PostgreSQL
CREATE TABLE expenses (
  tax DECIMAL(8,2) NOT NULL,
  expense_name VARCHAR(100) NOT NULL,
  price DECIMAL(12,2) NOT NULL,
  id_expense INTEGER NOT NULL,
  id_repair INTEGER DEFAULT NULL,
  id_property INTEGER NOT NULL,
  id_supplier INTEGER NOT NULL
);

--
-- Data dump for table `expenses`
--

-- Insert data into expenses table in PostgreSQL
INSERT INTO expenses (tax, expense_name, price, id_expense, id_repair, id_property, id_supplier) VALUES
(21.00, 'Building Materials', 1500.00, 11, 1, 1, 1),
(18.00, 'Labor', 2500.50, 12, 2, 2, 2),
(21.00, 'Paint', 3000.75, 13, 3, 1, 3),
(19.50, 'Tools', 1200.00, 14, 4, 2, 4),
(20.00, 'Electricity', 4500.00, 15, 5, 1, 5),
(18.75, 'Plumbing', 3200.25, 16, 6, 2, 6),
(21.00, 'Carpentry', 2200.00, 17, 7, 1, 7),
(20.50, 'Masonry', 1700.50, 18, 8, 2, 8),
(19.00, 'Gas', 2900.75, 19, 9, 1, 9),
(21.00, 'Locksmith', 3100.00, 20, 10, 2, 10);

-- Create real estate table in PostgreSQL
CREATE TABLE real_estate (
  id_real_estate SERIAL PRIMARY KEY,
  business_name VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL,
  cuit INTEGER NOT NULL
);

-- Insert data into real estate table in PostgreSQL
INSERT INTO real_estate (id_real_estate, business_name, location, cuit) VALUES
(1, 'Tatooine Realty', 'Tatooine', 12345678),
(2, 'Alderaan Homes', 'Alderaan', 87654321),
(3, 'Naboo Estates', 'Naboo', 23456789),
(4, 'Coruscant Properties', 'Coruscant', 98765432),
(5, 'Hoth Housing', 'Hoth', 34567890),
(6, 'Dagobah Dwellings', 'Dagobah', 45678901),
(7, 'Endor Residences', 'Endor', 56789012),
(8, 'Kashyyyk Condos', 'Kashyyyk', 67890123),
(9, 'Mustafar Mansions', 'Mustafar', 78901234),
(10, 'Jakku Apartments', 'Jakku', 89012345);



--- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE location (
  id_location SERIAL PRIMARY KEY,
  id_province INTEGER NOT NULL,
  id_postal_code INTEGER NOT NULL
);

INSERT INTO location (id_province, id_location, id_postal_code) VALUES
(100, 1000, 200),
(102, 1001, 201),
(103, 1002, 202),
(104, 1003, 203),
(107, 1004, 204),
(107, 1005, 205),
(100, 1006, 206),
(108, 1007, 207),
(108, 1008, 208),
(104, 1009, 209);

CREATE TABLE property (
  id_property int NOT NULL,
  id_state int DEFAULT NULL,
  price real NOT NULL,
  id_location int NOT NULL,
  PRIMARY KEY (id_property)
);

INSERT INTO property (id_property, id_state, price, id_location) VALUES
(1, 1, 150000, 3),
(2, 2, 250000, 2),
(3, 1, 200000, 4),
(4, 3, 300000, 8),
(5, 1, 180000, 9),
(6, 2, 220000, 10),
(7, 3, 275000, 5),
(8, 1, 160000, 7),
(9, 2, 190000, 4),
(10, 3, 210000, 1);


-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE suppliers (
  cuit bigint NOT NULL,
  business_name varchar(100) NOT NULL,
  id_supplier int NOT NULL,
  PRIMARY KEY (id_supplier)
);

INSERT INTO suppliers (cuit, business_name, id_supplier) VALUES
(12345678, 'Maintenance SIMA S.A', 1),
(12345678, 'ElectroSolutions SRL', 2),
(87654321, 'GasPlom S.A.', 3),
(87654321, 'GasPlom S.A.', 4),
(98765432, 'Quick Paints', 5),
(98765432, 'Quick Paints', 6),
(45678901, 'Maintenance Light SRL', 7),
(45678901, 'Maintenance Light SRL', 8),
(23456789, 'Express Plumbers', 9),
(23456789, 'Express Plumbers', 10);

CREATE TABLE province (
  id_province int NOT NULL,
  id_location int NOT NULL,
  id_postal_code int NOT NULL,
  PRIMARY KEY (id_province),
  FOREIGN KEY (id_location) REFERENCES location (id_location),
  FOREIGN KEY (id_postal_code) REFERENCES postal_code (id_postal_code)
);


INSERT INTO province (id_province, id_location, id_postal_code) VALUES
(100, 1001, 201),
(101, 1000, 202),
(102, 1009, 203),
(103, 1008, 204),
(104, 1002, 205),
(105, 1005, 206),
(106, 1006, 207),
(107, 1007, 208),
(108, 1007, 209),
(109, 1003, 200);



-- --------------------------------------------------------

--
-- Table structure for table `repairs`
--

CREATE TABLE repairs (
  id_repair int NOT NULL,
  repair_date date DEFAULT NULL,
  PRIMARY KEY (id_repair)
);

INSERT INTO repairs (id_repair, repair_date) VALUES
(1, '2024-01-15'),
(2, '2024-01-16'),
(3, '2024-01-17'),
(4, '2024-01-18'),
(5, '2024-01-19'),
(6, '2024-01-20'),
(7, '2024-01-21'),
(8, '2024-01-22'),
(9, '2024-01-23'),
(10, '2024-01-24');

CREATE TABLE payment_type (
  id_payment_type int NOT NULL,
  type_name varchar(255) NOT NULL,
  PRIMARY KEY (id_payment_type)
);

INSERT INTO payment_type (id_payment_type, type_name) VALUES
(1, 'Cash'),
(2, 'Credit card'),
(3, 'Bank transfer'),
(4, 'Check'),
(5, 'Mobile payment'),
(6, 'Bitcoin'),
(7, 'PayPal'),
(8, 'Postal order'),
(9, 'Cryptocurrency'),
(10, 'Electronic money');


-- --------------------------------------------------------

--
-- Table structure for table `currency_type`
--

CREATE TABLE currency_type (
  id_currency_type SERIAL PRIMARY KEY,
  type_name VARCHAR(255) NOT NULL
);

INSERT INTO currency_type (id_currency_type, type_name) VALUES
(1, 'US Dollar'),
(2, 'Euro'),
(3, 'British Pound'),
(4, 'Japanese Yen'),
(5, 'Swiss Franc'),
(6, 'Australian Dollar'),
(7, 'Canadian Dollar'),
(8, 'New Zealand Dollar'),
(9, 'Mexican Peso'),
(10, 'Argentine Peso');

CREATE TABLE customer_type (
  ID_customer_type SERIAL PRIMARY KEY,
  type_name VARCHAR(255) NOT NULL,
  birth_date DATE
);

INSERT INTO customer_type (ID_customer_type, type_name, birth_date) VALUES
(1, 'Primary', NULL),
(2, 'Co-Primary', NULL),
(3, 'Authorized Person', NULL);

CREATE TABLE transactions (
  id_transaction SERIAL PRIMARY KEY,
  id_payment_type INT NOT NULL,
  id_currency_type INT NOT NULL,
  transaction_date DATE NOT NULL
);

--
-- Data dump for table `transactions`
--

INSERT INTO transactions (id_transaction, id_payment_type, id_currency_type, transaction_date) VALUES
(1, 3, 5, '2024-06-06'),
(2, 5, 7, '2024-06-07'),
(3, 7, 9, '2024-06-08'),
(4, 9, 1, '2024-06-09'),
(5, 1, 3, '2024-06-10'),
(6, 2, 6, '2024-06-11'),
(7, 4, 8, '2024-06-12'),
(8, 6, 10, '2024-06-13'),
(9, 8, 2, '2024-06-14'),
(10, 10, 4, '2024-06-15');

CREATE TABLE location (
  id_province INT NOT NULL,
  id_locality INT NOT NULL,
  id_postal_code INT NOT NULL,
  street VARCHAR(255) NOT NULL,
  price FLOAT NOT NULL,
  functional_unit INT NOT NULL,
  id_location SERIAL PRIMARY KEY
);

INSERT INTO location (id_province, id_locality, id_postal_code, street, price, functional_unit, id_location) VALUES
(100, 1000, 200, 'lavalleja 135', 200020, 12345, 1),
(101, 1001, 201, 'acoyte 1350', 886900, 12346, 2),
(102, 1002, 202, 'frias 2020', 1701460, 12347, 3),
(103, 1003, 203, 'lavalle 2014', 1452370, 12348, 4),
(104, 1004, 204, 'florida 1214', 2569870, 12349, 5),
(105, 1005, 205, 'corrientes 2020', 356987, 12350, 6),
(106, 1006, 206, 'cordoba 1589', 245698, 12351, 7),
(107, 1007, 207, 'libertador 5454', 1452960, 12352, 8),
(108, 1008, 208, 'moron 475', 5008900, 12353, 9),
(109, 1009, 209, 'bogota 5656', 2006590, 12354, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rent`
--
ALTER TABLE rent
  ADD CONSTRAINT fk_id_real_estate FOREIGN KEY (id_real_estate) REFERENCES real_estate (id_real_estate),
  ADD CONSTRAINT fk_id_property FOREIGN KEY (id_property) REFERENCES property (id_property),
  ADD CONSTRAINT fk_id_customer FOREIGN KEY (id_customer) REFERENCES customer (id_customer),
  ADD CONSTRAINT fk_id_transaction FOREIGN KEY (id_transaction) REFERENCES transactions (id_transaction);


CREATE INDEX idx_id_real_estate ON rent (id_real_estate);
CREATE INDEX idx_id_property ON rent (id_property);
CREATE INDEX idx_id_customer ON rent (id_customer);
CREATE INDEX idx_id_transaction ON rent (id_transaction);


CREATE INDEX idx_fk_customer_type ON customer (id_customer_type);

ALTER TABLE cp
  ADD CONSTRAINT fk_cp_province FOREIGN KEY (id_province) REFERENCES province (id_province),
  ADD CONSTRAINT fk_cp_locality FOREIGN KEY (id_locality) REFERENCES locality (id_locality);

CREATE INDEX idx_fk_cp_province ON cp (id_province);
CREATE INDEX idx_fk_cp_locality ON cp (id_locality);

ALTER TABLE states
  ADD PRIMARY KEY (id_state);

CREATE INDEX idx_fk_id_repair ON expenses (id_repair);
CREATE INDEX idx_fk_id_supplier ON expenses (id_supplier);
CREATE INDEX idx_id_property_expenses ON expenses (id_property);

ALTER TABLE locality
  ADD CONSTRAINT fk_locality_province FOREIGN KEY (id_province) REFERENCES province (id_province),
  ADD CONSTRAINT fk_locality_cp FOREIGN KEY (id_cp) REFERENCES cp (id_cp);

CREATE INDEX idx_fk_locality_province ON locality (id_province);
CREATE INDEX idx_fk_locality_cp ON locality (id_cp);

ALTER TABLE property
  ADD CONSTRAINT fk_id_location FOREIGN KEY (id_location) REFERENCES location (id_location),
  ADD CONSTRAINT fk_id_state FOREIGN KEY (id_state) REFERENCES states (id_state);

CREATE INDEX idx_id_location ON property (id_location);
CREATE INDEX idx_id_state ON property (id_state);

ALTER TABLE location
  ADD CONSTRAINT fk_location_province FOREIGN KEY (id_province) REFERENCES province (id_province),
  ADD CONSTRAINT fk_location_locality FOREIGN KEY (id_locality) REFERENCES locality (id_locality),
  ADD CONSTRAINT fk_location_cp FOREIGN KEY (id_cp) REFERENCES cp (id_cp);


--
ALTER TABLE rent
  ADD CONSTRAINT rent_fk_id_real_estate FOREIGN KEY (id_real_estate) REFERENCES real_estate (id_real_estate),
  ADD CONSTRAINT rent_fk_id_property FOREIGN KEY (id_property) REFERENCES property (id_property),
  ADD CONSTRAINT rent_fk_id_customer FOREIGN KEY (id_customer) REFERENCES customer (id_customer),
  ADD CONSTRAINT rent_fk_id_transaction FOREIGN KEY (id_transaction) REFERENCES transactions (id_transaction);

--
-- Filters for table `customer`
--
ALTER TABLE customer
  ADD CONSTRAINT fk_customer_type FOREIGN KEY (id_customer_type) REFERENCES customer_type (ID_customer_type);

--
-- Filters for table `expenses`
--
ALTER TABLE expenses
  ADD CONSTRAINT fk_id_supplier FOREIGN KEY (id_supplier) REFERENCES suppliers (id_supplier),
  ADD CONSTRAINT fk_id_repair FOREIGN KEY (id_repair) REFERENCES repairs (id_repair),
  ADD CONSTRAINT expenses_ibfk_1 FOREIGN KEY (id_property) REFERENCES property (id_property);

--
-- Filters for table `property`
--
ALTER TABLE property
  ADD CONSTRAINT property_ibfk_1 FOREIGN KEY (id_location) REFERENCES location (id_location),
  ADD CONSTRAINT property_ibfk_2 FOREIGN KEY (id_state) REFERENCES states (id_state);

--
-- Filters for table `transactions`
--
ALTER TABLE transactions
  ADD CONSTRAINT fk_currency_type FOREIGN KEY (id_currency_type) REFERENCES currency_type (id_currency_type),
  ADD CONSTRAINT fk_payment_type FOREIGN KEY (id_payment_type) REFERENCES payment_type (id_payment_type);

--
-- Filters for table `location`
--
ALTER TABLE location
  ADD CONSTRAINT location_ibfk_1 FOREIGN KEY (id_province) REFERENCES province (id_province),
  ADD CONSTRAINT location_ibfk_2 FOREIGN KEY (id_cp) REFERENCES cp (id_cp),
  ADD CONSTRAINT location_ibfk_3 FOREIGN KEY (id_locality) REFERENCES locality (id_locality);
