/*
============================================
Create databases and schemas
============================================
Script Purpose: 
  This script creates the new database named "DataWarehouse" after checking if it already exists.
  If it exists, It is dropped and recreated. Additionally, the script sets up 3 schemas within the database: 'bronze', 'silver' and 'gold'.

Warnings:
  Running this script will drop the entire "DataWarehouse" database if it exists.
  All data in database will be deleted permanently. Proceed with caution and ensure you have proper backups before running this script.

*/


USE MASTER;
GO;
--- Drop and recreate the "DataWarehouse" database ---
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO;

-- Create database DataWarehouse ---
CREATE DATABASE DataWarehouse;
GO;

USE DataWarehouse;
GO;

-- Create schemas --
CREATE SCHEMA bronze;
GO;

CREATE SCHEMA silver;
GO;

CREATE SCHEMA gold;
GO;
