-- Drop Tables if exist so no error
DROP TABLE IF EXISTS card_holder;
DROP TABLE IF EXISTS credit_card;
DROP TABLE IF EXISTS merchant_category;
DROP TABLE IF EXISTS merchant;
DROP TABLE IF EXISTS transaction;

--Create each table
-- Create card_holder table
CREATE TABLE card_holder (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30)
);

-- Create card_holder table
CREATE TABLE credit_card (
	cardholder_id SERIAL PRIMARY KEY,
	card VARCHAR(20)
);

-- Create merchant_category table
CREATE TABLE merchant_category (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30)
);

-- Create merchant table
CREATE TABLE merchant (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30),
	id_merchant_category INT
);

-- Create transaction table
CREATE TABLE transaction (
	id SERIAL PRIMARY KEY,
	date TIMESTAMP,
	amount INT,
	card VARCHAR(20),
	id_merchant BIGINT
);

select * from merchant