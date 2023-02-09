-- QUERIES FOR MODULE 7

-- Some fraudsters hack a credit card by making several small transactions (generally less than $2.00), which are typically ignored by cardholders.
-- 		1.  How can you isolate (or group) the transactions of each cardholder?
--			--> join cardholder and card by id transactions by id being common
-- 		2.  Count the transactions that are less than $2.00 per cardholder.
-- 			--> query transactions less than 2.00
-- 		3.  Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
-- 			--> if find transactions less than 2.00 it could potentiall be fraud

-- 1. 

select * from transaction
-- First rename the id column in card_holder to cardholder_id so can join on that
-- ALTER TABLE card_holder
-- RENAME COLUMN id TO cardholder_id;

-- Join card_holder & credit_card by cardholder_id
SELECT 
a.name,
a.id,
b.card,
c.amount
FROM card_holder as a
INNER JOIN credit_card as b ON a.id = b.cardholder_id
INNER JOIN transaction as c ON b.card = c.card

-- order by name
ORDER BY a.name


-- NEW
SELECT 
a.name,
a.id,
b.card,
c.amount
FROM card_holder as a
INNER JOIN credit_card as b ON a.id = b.cardholder_id
INNER JOIN transaction as c ON b.card = c.card
WHERE c.amount < 2.00


-- 
select * from transaction
WHERE date_part('hour', date) > 7 and date_part('hour', date) < 9
ORDER BY amount desc 
limit 100

--
select * from transaction
WHERE date_part('hour', date) > 7 
and date_part('hour', date) < 9
and amount < 2.00