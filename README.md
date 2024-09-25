# Inventory-Order-Management-SQL
"SQL-based system for managing suppliers, products, stock, customers, and orders with stored procedures, triggers, and real-time stock updates."
# Automated Inventory and Order Management System

This project is a SQL-based system designed to manage suppliers, products, stock, customers, and orders. It implements stored procedures, triggers, and sequences for automated data handling.

## Features
- **Product and Supplier Management**: Automatically generates unique IDs for products and suppliers using custom sequences.
- **Stock Management**: Updates stock in real-time with triggers that check availability before order confirmation.
- **Customer and Order Handling**: Manages customer information and processes orders with checks on stock quantity.
- **Data Integrity**: Foreign key relationships and constraints ensure data consistency and accuracy.

## SQL Components
- **Table Creation Scripts**: Defines the structure of `Supplier`, `Product`, `Stock`, `Customer`, and `Orders` tables.
- **Stored Procedures**: Automates inserting data and managing IDs for suppliers, products, customers, and orders.
- **Triggers**: Ensures stock quantity is updated based on orders.
- **Test Data**: Includes sample suppliers, products, customers, and orders for testing the system.

## Getting Started
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/Inventory-Order-Management-SQL.git

CREATE PROCEDURE InProd @PD AS VARCHAR(100), @P AS INT, @C AS CHAR(2), @SID AS CHAR(5)
AS
BEGIN
    DECLARE @ID AS CHAR(5);
    DECLARE @I AS INT;

    SET @I = (NEXT VALUE FOR s3);
    SET @ID = dbo.CID('P', @I);
   
    INSERT INTO Product 
    VALUES (@ID, @PD, @P, @C, @SID);

    SELECT * FROM Product;
END;


