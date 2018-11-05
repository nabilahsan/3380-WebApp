DROP TABLE Customer CASCADE CONSTRAINTS;
DROP TABLE Territory CASCADE CONSTRAINTS;
DROP TABLE SalesPerson CASCADE CONSTRAINTS;
DROP TABLE DoesBusinessIn CASCADE CONSTRAINTS;
DROP TABLE ProductLine CASCADE CONSTRAINTS;
DROP TABLE Product CASCADE CONSTRAINTS;
DROP TABLE Orderr CASCADE CONSTRAINTS;
DROP TABLE OrderLine CASCADE CONSTRAINTS;
DROP TABLE PriceUpdate CASCADE CONSTRAINTS;
DROP PROCEDURE ProductLineSale;
DROP TRIGGER StandardPriceUpdate;

-- Customers
CREATE TABLE Customer (
    c_id CHAR(30) NOT NULL,
    c_name CHAR(30),
    c_address CHAR(30),
    c_city CHAR(30),
    c_state CHAR(2),
    c_postalcode CHAR(30),
    c_email CHAR(30),
    c_username CHAR(30),
    c_password CHAR(30),
    PRIMARY KEY ( c_id ) );
INSERT INTO Customer VALUES ( 1, 'Contemporary Casuals', '1355 S Hines Blvd', 'Gainesville', 'FL', '32601-2871', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 2, 'Value Furnitures', '15145 S.W. 17th St.', 'Plano', 'TX', '75094-7734', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 3, 'Home Furnishings', '1900 Allard Ave', 'Albany', 'NY', '12209-1125', 'homefurnishings?@gmail.com', 'CUSTOMER1', 'CUSTOMER1#' );
INSERT INTO Customer VALUES ( 4, 'Eastern Furniture', '1925 Beltline Rd.', 'Carteret', 'NJ', '07008-3188', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 5, 'Impressions', '5585 Westcott Ct.', 'Sacramento', 'CA', '94206-4056', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 6, 'Furniture Gallery', '325 Flatiron Dr.', 'Boulder', 'CO', '80514-4432', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 7, 'New Furniture', 'Palace Ave', 'Farmington', 'NM', '', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 8, 'Dunkins Furniture', '7700 Main St', 'Syracuse', 'NY', '31590', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 9, 'A Carpet', '434 Abe Dr', 'Rome', 'NY', '13440', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 12, 'Flanigan Furniture', 'Snow Flake Rd', 'Ft Walton Beach', 'FL', '32548', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 13, 'Ikards', '1011 S. Main St', 'Las Cruces', 'NM', '88001', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 14, 'Wild Bills', 'Four Horse Rd', 'Oak Brook', 'Il', '60522', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 15, 'Janet''s Collection', 'Janet Lane', 'Virginia Beach', 'VA', '10012', NULL, NULL, NULL);
INSERT INTO Customer VALUES ( 16, 'ABC Furniture Co.', '152 Geramino Drive', 'Rome', 'NY', '13440', NULL, NULL, NULL );

-- Territory
CREATE TABLE Territory (
    t_id CHAR(30),
    t_name CHAR(30),
    PRIMARY KEY ( t_id ) );
INSERT INTO Territory VALUES ( 1, 'SouthEast' );
INSERT INTO Territory VALUES ( 2, 'SouthWest' );
INSERT INTO Territory VALUES ( 3, 'NorthEast' );
INSERT INTO Territory VALUES ( 4, 'NorthWest' );
INSERT INTO Territory VALUES ( 5, 'Central' );

-- SalesPerson
CREATE TABLE SalesPerson (
    sp_id CHAR(30) NOT NULL,
    sp_name CHAR(30),
    sp_phone CHAR(30),
    sp_email CHAR(30),
    sp_username CHAR(30),
    sp_password CHAR(30),
    t_id CHAR(30) NOT NULL,
    PRIMARY KEY ( sp_id ),
    FOREIGN KEY ( t_id ) REFERENCES Territory );
INSERT INTO SalesPerson VALUES ( 1, 'Doug Henny', '8134445555', 'salesperson?@gmail.com', 'SALESPERSON', 'SALESPERSON#', 1 );
INSERT INTO SalesPerson VALUES ( 2, 'Robert Lewis', '8139264006', '', '', '', 2 );
INSERT INTO SalesPerson VALUES ( 3, 'William Strong', '5053821212', '', '', '', 3 );
INSERT INTO SalesPerson VALUES ( 4, 'Julie Dawson', '4355346677', '', '', '', 4 );
INSERT INTO SalesPerson VALUES ( 5, 'Jacob Winslow', '2238973498', '', '', '', 5 );

-- DoesBusinessIn
CREATE TABLE DoesBusinessIn (
    c_id CHAR(30) NOT NULL,
    t_id CHAR(30) NOT NULL,
    PRIMARY KEY ( c_id, t_id ),
    FOREIGN KEY ( c_id ) REFERENCES Customer,
    FOREIGN KEY ( t_id ) REFERENCES Territory );
INSERT INTO DoesBusinessIn VALUES ( 1, 1 );
INSERT INTO DoesBusinessIn VALUES ( 2, 2 );
INSERT INTO DoesBusinessIn VALUES ( 3, 3 );
INSERT INTO DoesBusinessIn VALUES ( 4, 4 );
INSERT INTO DoesBusinessIn VALUES ( 5, 5 );
INSERT INTO DoesBusinessIn VALUES ( 6, 1 );
INSERT INTO DoesBusinessIn VALUES ( 7, 2 );

-- ProductLine
CREATE TABLE ProductLine (
    pl_id CHAR(30) NOT NULL,
    pl_name CHAR(30),
    PRIMARY KEY ( pl_id ) );
INSERT INTO ProductLine VALUES ( 1, 'Cherry Tree' );
INSERT INTO ProductLine VALUES ( 2, 'Scandinavia' );
INSERT INTO ProductLine VALUES ( 3, 'Country Look' );

-- Product
CREATE TABLE Product (
    p_id CHAR(30) NOT NULL,
    p_name CHAR(30),
    p_finish CHAR(30),
    p_standard_price DECIMAL(6,2),
    pl_id CHAR(30),
    p_photo CHAR(30),
    SalePrice DECIMAL(6,2),
    PRIMARY KEY ( p_id ),
    FOREIGN KEY ( pl_id ) REFERENCES ProductLine );
INSERT INTO Product VALUES ( 1, 'End Table', 'Cherry', 175, 1, 'table.jpg', NULL );
INSERT INTO Product VALUES ( 2, 'Coffee Table', 'Natural Ash', 200, 2, NULL, NULL );
INSERT INTO Product VALUES ( 3, 'Computer Desk', 'Natural Ash', 375, 2, NULL, NULL );
INSERT INTO Product VALUES ( 4, 'Entertainment Center', 'Natural Maple', 650, 3, NULL, NULL );
INSERT INTO Product VALUES ( 5, 'Writers Desk', 'Cherry', 325, 1, NULL, NULL );
INSERT INTO Product VALUES ( 6, '8-Drawer Desk', 'White Ash', 750, 2, NULL, NULL );
INSERT INTO Product VALUES ( 7, 'Dining Table', 'Natural Ash', 800, 2, NULL, NULL );
INSERT INTO Product VALUES ( 8, 'Computer Desk', 'Walnut', 250, 3, NULL, NULL );

-- Orderr
CREATE TABLE Orderr (
    o_id CHAR(30) NOT NULL,
    o_date DATE,
    c_id CHAR(30) NOT NULL, /* c_id is not a key, but has to reference a customer per Orderr */
    PRIMARY KEY ( o_id ),
    FOREIGN KEY ( c_id ) REFERENCES Customer );
INSERT INTO Orderr VALUES ( 1001, '21/Aug/16', 1 );
INSERT INTO Orderr VALUES ( 1002, '21/Jul/16', 8 );
INSERT INTO Orderr VALUES ( 1003, '22/Aug/16', 15 );
INSERT INTO Orderr VALUES ( 1004, '22/Oct/16', 5 );
INSERT INTO Orderr VALUES ( 1005, '24/Jul/16', 3 );
INSERT INTO Orderr VALUES ( 1006, '24/Oct/16', 2 );
INSERT INTO Orderr VALUES ( 1007, '27/Aug/16', 5 );
INSERT INTO Orderr VALUES ( 1008, '30/Oct/16', 12 );
INSERT INTO Orderr VALUES ( 1009, '05/Nov/16', 4 );
INSERT INTO Orderr VALUES ( 1010, '05/Nov/16', 1 );

-- OrderLine
CREATE TABLE OrderLine (
    o_id CHAR(30) NOT NULL,
    p_id CHAR(30) NOT NULL,
    quantity INTEGER,
    sale_price REAL,
    PRIMARY KEY ( o_id, p_id ),
    FOREIGN KEY ( o_id ) REFERENCES Orderr,
    FOREIGN KEY ( p_id ) REFERENCES Product );
INSERT INTO OrderLine VALUES ( 1001, 1, 2, NULL );
INSERT INTO OrderLine VALUES ( 1001, 2, 2, NULL );
INSERT INTO OrderLine VALUES ( 1001, 4, 1, NULL );
INSERT INTO OrderLine VALUES ( 1002, 3, 5, NULL );
INSERT INTO OrderLine VALUES ( 1003, 3, 3, NULL );
INSERT INTO OrderLine VALUES ( 1004, 6, 2, NULL );
INSERT INTO OrderLine VALUES ( 1004, 8, 2, NULL );
INSERT INTO OrderLine VALUES ( 1005, 4, 4, NULL );
INSERT INTO OrderLine VALUES ( 1006, 4, 1, NULL );
INSERT INTO OrderLine VALUES ( 1006, 5, 2, NULL );
INSERT INTO OrderLine VALUES ( 1006, 7, 2, NULL );
INSERT INTO OrderLine VALUES ( 1007, 1, 3, NULL );
INSERT INTO OrderLine VALUES ( 1007, 2, 2, NULL );
INSERT INTO OrderLine VALUES ( 1008, 3, 3, NULL );
INSERT INTO OrderLine VALUES ( 1008, 8, 3, NULL );
INSERT INTO OrderLine VALUES ( 1009, 4, 2, NULL );
INSERT INTO OrderLine VALUES ( 1009, 7, 3, NULL );
INSERT INTO OrderLine VALUES ( 1010, 8, 10, NULL );

-- PriceUpdate
CREATE TABLE PriceUpdate (
    p_id CHAR(30),
    pu_date DATE,
    pu_old_price DECIMAL(6,2),
    pu_new_price DECIMAL(6,2),
    PRIMARY KEY ( p_id, pu_date ),
    FOREIGN KEY ( p_id ) REFERENCES Product );

-- Question 1: Simple Stored Procedure
CREATE OR REPLACE PROCEDURE ProductLineSale AS
    BEGIN
        UPDATE Product P
            SET SalePrice = (P.p_standard_price - P.p_standard_price * 0.15)
                WHERE P.p_standard_price < 400;
        UPDATE Product P
            SET SalePrice = (P.p_standard_price - P.p_standard_price * 0.1)
                WHERE P.p_standard_price >= 400;
    END ProductLineSale;
/

-- Output
-- p_id                             p_name                          p_finish                        p_standard_price                    p_photo                         SalePrice
-- 1                             	End Table                     	Cherry                        	175	1                             	table.jpg                     	148.75
-- 2                             	Coffee Table                  	Natural Ash                   	200	2                             		                               170
-- 3                             	Computer Desk                 	Natural Ash                   	375	2                             		                            318.75
-- 4                             	Entertainment Center          	Natural Maple                 	650	3                                                            		585
-- 5                             	Writers Desk                  	Cherry                        	325	1                                                         		276.25
-- 6                             	8-Drawer Desk                 	White Ash                     	750	2                                                             		675
-- 7                             	Dining Table                  	Natural Ash                   	800	2                                                            		720
-- 8                             	Computer Desk                 	Walnut                        	250	3                                                            		212.5

-- Question 2: Trigger
-- TODO: Procedures ( CALL ProductLineSale(); ) cannot be called inside a trigger. Find a way?
CREATE OR REPLACE TRIGGER StandardPriceUpdate
    BEFORE UPDATE ON Product
    FOR EACH ROW
        BEGIN
            IF(:NEW.p_standard_price != :OLD.p_standard_price) THEN
                INSERT INTO PriceUpdate VALUES ( :OLD.p_id, SYSDATE, :OLD.p_standard_price, :NEW.p_standard_price );
            END IF;
        END StandardPriceUpdate;
/

-- This should not add a new row to PriceUpdate table since the p_standard_price is already 175 originally
UPDATE Product P
	SET P.p_standard_price = 175
    	WHERE P.p_id = 1;

-- p_id     pu_date         pu_old_price    pu_new_price

-- This should add a new row to PriceUpdate table since the p_standard_price is not the same as new value originally
UPDATE Product P
	SET P.p_standard_price = 155
    	WHERE P.p_id = 1;

-- p_id     pu_date         pu_old_price    pu_new_price
-- 1        04-NOV-18	    175	            155

-- This should add a multiple rows to PriceUpdate table since the p_standard_price is not the same for both Products originally
UPDATE Product P
	SET P.p_standard_price = 155
    	WHERE P.p_id = 2 OR P.p_id = 8;

-- p_id         pu_date         pu_old_price    pu_new_price
-- 1           04-NOV-18	        175	            155
-- 2           04-NOV-18	        200	            155
-- 8           04-NOV-18	        250	            155


-- This test for decimal precision
UPDATE Product P
	SET P.p_standard_price = 125.52342
    	WHERE P.p_id = 3;

-- p_id         pu_date         pu_old_price    pu_new_price
-- 1           04-NOV-18	        175	            155
-- 2           04-NOV-18	        200	            155
-- 8           04-NOV-18	        250	            155
-- 3           04-NOV-18	        375	            125.52