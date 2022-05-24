-- Gerado por Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   em:        2022-05-23 20:42:29 BRT
--   site:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE Customers 
    (
     customercode INTEGER NOT NULL , 
     customerName VARCHAR (50) , 
     contactLastName VARCHAR (50) , 
     contactFirstName VARCHAR (50) , 
     phone VARCHAR (50) , 
     addressLine1 VARCHAR (50) , 
     addressLine2 VARCHAR (50) , 
     city VARCHAR (50) , 
     state VARCHAR (50) , 
     Postal_code INTEGER , 
     country VARCHAR (50) , 
     salesRepEmployeeNumber VARCHAR (50) , 
     creditlimit VARCHAR (20) , 
     Employeescode INTEGER 
    )
GO

ALTER TABLE Customers ADD CONSTRAINT Customers_PK PRIMARY KEY CLUSTERED (customercode)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Employees 
    (
     Employeescode INTEGER NOT NULL , 
     lastName VARCHAR (50) , 
     firstName VARCHAR (50) , 
     extension VARCHAR (10) , 
     email VARCHAR (100) , 
     officeCode VARCHAR (15) , 
     reportsTocode INTEGER , 
     jobTitle VARCHAR (50) , 
     occupationcode INTEGER 
    )
GO

ALTER TABLE Employees ADD CONSTRAINT Employees_PK PRIMARY KEY CLUSTERED (Employeescode)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Employees_credit 
    (
     Employees_creditcode INTEGER NOT NULL , 
     salesRepEmployeeNumber INTEGER , 
     creditLimit INTEGER , 
     customercode INTEGER NOT NULL 
    )
GO

ALTER TABLE Employees_credit ADD CONSTRAINT Employees_credit_PK PRIMARY KEY CLUSTERED (Employees_creditcode)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Occupation 
    (
     occupationcode INTEGER NOT NULL , 
     occupation_employees VARCHAR (200) , 
     reporte_management VARCHAR (100) , 
     occupation_management VARCHAR (100) 
    )
GO

ALTER TABLE Occupation ADD CONSTRAINT Occupation_PK PRIMARY KEY CLUSTERED (occupationcode)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Offices 
    (
     officeCode VARCHAR (15) NOT NULL , 
     city VARCHAR (50) , 
     phone VARCHAR (50) , 
     addressLine1 VARCHAR (50) , 
     addressLine2 VARCHAR (50) , 
     state VARCHAR (50) , 
     country VARCHAR (50) , 
     Postal_postalCode VARCHAR (50) , 
     territory VARCHAR (10) , 
     Office_postalcode INTEGER 
    )
GO

ALTER TABLE Offices ADD CONSTRAINT Offices_PK PRIMARY KEY CLUSTERED (officeCode)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE OrderDetails 
    (
     orderdetailscode INTEGER NOT NULL , 
     orderscode INTEGER NOT NULL , 
     productCode VARCHAR (15) NOT NULL , 
     quantityOrdered INTEGER , 
     priceEach VARCHAR (50) , 
     orderLineNumber VARCHAR (50) 
    )
GO

ALTER TABLE OrderDetails ADD CONSTRAINT OrderDetails_PK PRIMARY KEY CLUSTERED (orderdetailscode)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Orders 
    (
     orderscode INTEGER NOT NULL , 
     orderDate DATE , 
     requiredDate DATE , 
     shippedDate VARCHAR (20) , 
     status VARCHAR (15) , 
     comments TEXT , 
     customercode INTEGER 
    )
GO

ALTER TABLE Orders ADD CONSTRAINT Orders_PK PRIMARY KEY CLUSTERED (orderscode)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Payments 
    (
     customercode INTEGER NOT NULL , 
     checkNumber VARCHAR (50) NOT NULL , 
     paymentDate DATE , 
     amount VARCHAR (20) 
    )
GO

ALTER TABLE Payments ADD CONSTRAINT Payments_PK PRIMARY KEY CLUSTERED (checkNumber)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Postal 
    (
     Postal_code INTEGER NOT NULL , 
     officeCode VARCHAR (15) , 
     city VARCHAR (50) , 
     state VARCHAR (50) , 
     postalCode VARCHAR (15) NOT NULL , 
     country VARCHAR (50) 
    )
GO

ALTER TABLE Postal ADD CONSTRAINT Postal_PK PRIMARY KEY CLUSTERED (Postal_code)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ProductLines 
    (
     productLineCode INTEGER NOT NULL , 
     textDescription VARCHAR (4000) , 
     htmlDescription TEXT , 
     image IMAGE 
     productLine_Code varchar(20)
    )
GO

ALTER TABLE ProductLines ADD CONSTRAINT ProductLines_PK PRIMARY KEY CLUSTERED (productLineCode)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Products 
    (
     productCode VARCHAR (15) NOT NULL , 
     productName VARCHAR (70) , 
     productLineCode INTEGER , 
     productScale VARCHAR (10) , 
     productVendor VARCHAR (50) , 
     productDescription TEXT , 
     quantityInStock VARCHAR (50) , 
     buyPrice VARCHAR (10) , 
     MSRP VARCHAR (10) 
    )
GO

ALTER TABLE Products ADD CONSTRAINT Products_PK PRIMARY KEY CLUSTERED (productCode)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE reportsTo 
    (
     reportsTocode INTEGER NOT NULL , 
     jobTitle VARCHAR (50) 
    )
GO

ALTER TABLE reportsTo ADD CONSTRAINT reportsTo_PK PRIMARY KEY CLUSTERED (reportsTocode)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Customers 
    ADD CONSTRAINT Customers_Employees_FK FOREIGN KEY 
    ( 
     Employeescode
    ) 
    REFERENCES Employees 
    ( 
     Employeescode 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Customers 
    ADD CONSTRAINT Customers_Postal_FK FOREIGN KEY 
    ( 
     Postal_code
    ) 
    REFERENCES Postal 
    ( 
     Postal_code 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Employees_credit 
    ADD CONSTRAINT Employees_credit_Customers_FK FOREIGN KEY 
    ( 
     customercode
    ) 
    REFERENCES Customers 
    ( 
     customercode 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Employees 
    ADD CONSTRAINT Employees_Occupation_FK FOREIGN KEY 
    ( 
     occupationcode
    ) 
    REFERENCES Occupation 
    ( 
     occupationcode 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Employees 
    ADD CONSTRAINT Employees_Offices_FK FOREIGN KEY 
    ( 
     officeCode
    ) 
    REFERENCES Offices 
    ( 
     officeCode 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Employees 
    ADD CONSTRAINT Employees_reportsTo_FK FOREIGN KEY 
    ( 
     reportsTocode
    ) 
    REFERENCES reportsTo 
    ( 
     reportsTocode 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE OrderDetails 
    ADD CONSTRAINT OrderDetails_Orders_FK FOREIGN KEY 
    ( 
     orderscode
    ) 
    REFERENCES Orders 
    ( 
     orderscode 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE OrderDetails 
    ADD CONSTRAINT OrderDetails_Products_FK FOREIGN KEY 
    ( 
     productCode
    ) 
    REFERENCES Products 
    ( 
     productCode 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Orders 
    ADD CONSTRAINT Orders_Customers_FK FOREIGN KEY 
    ( 
     customercode
    ) 
    REFERENCES Customers 
    ( 
     customercode 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Payments 
    ADD CONSTRAINT Payments_Customers_FK FOREIGN KEY 
    ( 
     customercode
    ) 
    REFERENCES Customers 
    ( 
     customercode 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Postal 
    ADD CONSTRAINT Postcard_Record_Offices_FK FOREIGN KEY 
    ( 
     officeCode
    ) 
    REFERENCES Offices 
    ( 
     officeCode 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Products 
    ADD CONSTRAINT Products_ProductLines_FK FOREIGN KEY 
    ( 
     productLineCode
    ) 
    REFERENCES ProductLines 
    ( 
     productLineCode 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             24
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
