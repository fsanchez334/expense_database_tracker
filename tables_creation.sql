CREATE TABLE `card_basic` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `card_name` varchar(60) DEFAULT NULL,
  `card_type` enum('Credit','Debit') DEFAULT NULL,
  PRIMARY KEY (`card_id`)
);

CREATE TABLE `credit_cards` (
  `card_id` int NOT NULL,
  `card_balance` float DEFAULT NULL,
  `credit_limit` float DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `interest_rate` float DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  CONSTRAINT `credit_cards_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `card_basic` (`card_id`)
);

CREATE TABLE `debit_cards` (
  `card_id` int NOT NULL,
  `balance` float DEFAULT NULL,
  PRIMARY KEY (`card_id`)
);

CREATE TABLE `expenses` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(6,3) DEFAULT NULL,
  `date_of_transaction` date DEFAULT NULL,
  `merchant` varchar(50) DEFAULT NULL,
  `card_id` int DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `card_id` (`card_id`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `card_basic` (`card_id`)
);

--- Let's populate the expenses table
INSERT INTO expenses (amount, date_of_transaction, merchant, card_id, category)
VALUES 
	(300, '2025-08-06', 'Rent', 1, 'Needs'),
    (300, '2025-08-06', 'Withdrawal', 1, 'Wants'),
    (210.65, '2025-08-07', 'Insurance', 1, 'Needs'),
    (60, '2025-08-07', 'Withdrawal', 1, 'Wants'),
    (500, '2025-08-08', 'Credit Card Payment', 1, 'Needs'),
    (600, '2025-08-08', 'Credit Card Payment', 1, 'Needs'),
    (145.21, '2025-08-08', 'Credit Card Payment', 1, 'Needs'),
    (250, '2025-08-08', 'Retirement Account', 1, 'Savings'),
    (1, '2025-08-06', 'Test Transaction', 1, 'Needs'),
    (100, '2025-08-11', 'HYSA', 1, 'Savings'),
    (27.21, '2025-08-11', 'Apple Subscription', 1, 'Wants'),
    (49.19, '2025-08-11', 'Food', 1, 'Wants'),
    (14.46, '2025-08-11', 'Food', 1, 'Wants'),
    (100, '2025-08-11', 'HYSA', 1, 'Savings'),
    (21.78, '2025-08-12', 'Medical', 1, 'Needs'),
    (21.78, '2025-08-11', 'Subscription', 1, 'Wants');

-- For verification, we can SELECT * on the table
SELECT * FROM expenses;

/* Some sample table may look like the following
# transaction_id	amount	date_of_transaction	merchant	card_id	category
1	674.120	2025-08-06	Chase	1	Needs
2	300.000	2025-08-06	Rent	1	Needs
3	300.000	2025-08-06	Withdrawal	1	Wants
4	210.650	2025-08-07	Insurance	1	Needs
5	60.000	2025-08-07	Withdrawal	1	Wants
6	500.000	2025-08-08	Credit Card Payment	1	Needs
7	600.000	2025-08-08	Credit Card Payment	1	Needs
8	145.210	2025-08-08	Credit Card Payment	1	Needs
9	250.000	2025-08-08	Retirement Account	1	Savings
10	1.000	2025-08-06	Test Transaction	1	Needs
11	100.000	2025-08-11	HYSA	1	Savings
12	27.210	2025-08-11	Apple Subscription	1	Wants
13	49.190	2025-08-11	Food	1	Wants
14	14.460	2025-08-11	Food	1	Wants
15	100.000	2025-08-11	HYSA	1	Savings
16	21.780	2025-08-12	Medical	1	Needs
17	21.780	2025-08-11	Subscription	1	Wants
*/

