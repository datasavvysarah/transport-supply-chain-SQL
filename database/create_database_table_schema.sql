create database IF NOT EXISTS Supply_Chain_DB;
USE Supply_Chain_DB;

CREATE TABLE IF NOT EXISTS Supply_chain_dataanalysis(
	`Product type` VARCHAR(50),
	`SKU` VARCHAR(50),
	`Price` FLOAT,
	`Availability` INT,
	`Number of Product Sold` INT,
	`Revenue Generated` FLOAT,
	`Customer demographics` VARCHAR(50),
	`Stock levels` INT,
	`Lead times` INT,
	`Order quantities` INT,
	`Shipping times` INT,
	`Shipping costs` VARCHAR(50),
	`Supplier name` VARCHAR(50),
	`Location` VARCHAR(50),
    `Lead time` INT,
	`Production volume` INT,
	`Manufacturing lead time` INT,
	`Manufacturing costs` FLOAT,
	`Inspection results` varchar(50),
	`Defect rates` FLOAT,
	`Transportation mode` VARCHAR(50),
	`Routes` VARCHAR(50),
	`Costs` FLOAT

);
