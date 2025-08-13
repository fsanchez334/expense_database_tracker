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