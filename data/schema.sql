-- Drop Tables if exist so no error
DROP TABLE IF EXISTS card_holder;
DROP TABLE IF EXISTS credit_card;
DROP TABLE IF EXISTS merchant_category;
DROP TABLE IF EXISTS merchant;
DROP TABLE IF EXISTS transaction;

--Create each table
-- Create card_holder table
CREATE TABLE card_holder (
	id INT,
	name VARCHAR(50)
);

-- Create credit_card table
CREATE TABLE credit_card (
	card VARCHAR(20),
	cardholder_id INT
	
);

select * from credit_card

-- Create merchant_category table
CREATE TABLE merchant_category (
	id INT,
	name VARCHAR(30)
);

-- Create merchant table
CREATE TABLE merchant (
	id INT,
	name VARCHAR(50),
	id_merchant_category INT
);

-- Create transaction table
CREATE TABLE transaction (
	id INT,
	date TIMESTAMP,
	amount FLOAT,
	card VARCHAR(20),
	id_merchant INT
);

select * from transaction

