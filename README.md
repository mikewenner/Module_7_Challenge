# Module_7_Challenge

## This is the module 7 challenge examining potential credit card fraud.
***
#### The data folder of this repo has the following files to examine:
* schema.sql - this file contains the table creation info for all tables used in this project
* queries.sql - this file contains all the queries used in the project
* visual_data_analysis.ipynb - jupyter notebook file used for visual data analysis
##
#### The images folder contains a .png file of the ERD schematic for the project.
##
#### The resources folder contains .csv and .sql files of the data and seed code for the project.
#

### Data Analysis Report
***
***

* Some fraudsters hack a credit card by making several small transactions (generally less than $2.00), which are typically ignored by cardholders. 

  * How can you isolate (or group) the transactions of each cardholder?
    * Here I ran a query joining the card_holder, credit_card and transaction tables.  See queries.sql file in the data folder of this repo for this query.
***

  * Count the transactions that are less than $2.00 per cardholder. 
    * Again a query was ran to get the data that was less than 2.00 per transaction. It was also ordered by name as a follow-on to get a feel for the possible fraudulent transactins by name.  See queries.sql file in the data folder of this repo for this query.
  ***

  * Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
    * If we define several as anything greater than 3 transactions, then yes based on just having several transactions less than 2.00 there is evidence of credit cards being hacked for all customers except Elizabeth Sawyer and Laurie Gibbs	who each had only 3 transactions less than 2.00.
***

* Take your investigation a step futher by considering the time period in which potentially fraudulent transactions are made. 

  * What are the top 100 highest transactions made between 7:00 am and 9:00 am?
    * See queries.sql file in the data folder of this repo for this query.

  * Do you see any anomalous transactions that could be fraudulent?
    * According to this query there are no transactions in the top 100 that are less than 2.00 so I would not consider these as potentially fraudulent

  * Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?
    * Here 2 queries were run and compared.  First was counting the transactions between 7 and 9 less tha 2.00 and comparing to all transactions less than 2.00. See queries.sql file in the data folder of this repo for this query.  There is 15 transactions between 7 and 9 am less than 2.00 and 350 total transactions less than 2.00.  So that means there is 335 transactions during the rest of the day that are less than 2.00 and could be considered fraud.  So no, there isn't a higher number of transactions between 7 and 9

  * If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.
***

* What are the top 5 merchants prone to being hacked using small transactions?
    * Based on the query, the top 5 merchants prone to being hacked based on transactions being less thn 2.00 are: Wood-Ramirez (7), Hood-Phillips (6), Baker Inc (6), Greene-Wood (5) & Jarvis-Turner (5).

* Create a view for each of your queries.
    * see queries.sql file in the data folder