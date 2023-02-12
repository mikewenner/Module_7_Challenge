-- QUERIES FOR MODULE 7

-- Some fraudsters hack a credit card by making several small transactions (generally less than $2.00), 
-- which are typically ignored by cardholders.
-- 		1.  How can you isolate (or group) the transactions of each cardholder?
-- 		2.  Count the transactions that are less than $2.00 per cardholder.
-- 		3.  Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
-- Take your investigation a step further by considering the time period in which potentially fraudulent transactions are made.
-- 		4.  What are the top 100 highest transactions made between 7:00 am and 9:00 am?
-- 		5.  Do you see any anomalous transactions that could be fraudulent?
-- 		6.  Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?
-- 		7.  If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.
-- What are the top 5 merchants prone to being hacked using small transactions?
-- Create a view for each of your queries

select * from transaction

-- 1.  How can you isolate (or group) the transactions of each cardholder?
SELECT 
a.name,
a.id,
b.card,
c.amount
FROM card_holder as a
INNER JOIN credit_card as b ON a.id = b.cardholder_id
INNER JOIN transaction as c ON b.card = c.card
ORDER BY a.name


-- 2.  Count the transactions that are less than $2.00 per cardholder.
SELECT 
a.name,
a.id,
b.card,
c.amount
FROM card_holder as a
INNER JOIN credit_card as b ON a.id = b.cardholder_id
INNER JOIN transaction as c ON b.card = c.card
WHERE c.amount < 2.00
ORDER BY a.name
-- GROUP BY a.name
-- ORDER BY count(*)

-- 3.  Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
--		If we define several as anything greater than 3, then yes based on just having several transactions less than 2.00 
-- 		then yes there is evidence of credit cards being hacked for all customerrs except Elizabeth Sawyer and Laurie Gibbs
-- 		who each had only 3 transactions less than 2.00

-- 4.  What are the top 100 highest transactions made between 7:00 am and 9:00 am?
select * from transaction
WHERE date_part('hour', date) > 7 and date_part('hour', date) < 9
ORDER BY amount desc 
limit 100

-- 5.  Do you see any anomalous transactions that could be fraudulent?
-- 		According to this query there are no transactions in the top 100 that are less than 2.00 so I would not consider these 
--		as potentially fraudulent

-- 6.  Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?
select count(amount) from transaction
WHERE date_part('hour', date) > 7 
and date_part('hour', date) < 9
and amount < 2.00

select count(amount) from transaction
WHERE amount < 2.00

-- no, there is 15 transactions between 7 and 9 am and 350 total trtansactions less than 2.00.  So that means there is 
-- 335 transactions during the rest of the day that are less than 2.00 and could be considered fraud

--select count(amount) from transaction
--WHERE date_part('hour', date) > 9 
--and date_part('hour', date) < 7
--and amount < 2.00

-- What are the top 5 merchants prone to being hacked using small transactions?
SELECT 
a.id,
a.name,
b.amount
FROM merchant as a
INNER JOIN transaction as b ON a.id = b.id_merchant
WHERE b.amount < 2.00
GROUP BY a.name
ORDER BY count(*) DESC;

-- PART 2
--cardholder IDs are 2 and 18.
SELECT 
a.name,
a.id,
b.card,
c.amount
FROM card_holder as a
INNER JOIN credit_card as b ON a.id = b.cardholder_id
INNER JOIN transaction as c ON b.card = c.card
WHERE c.amount < 2.00
AND a.id = 2
AND a.id = 18