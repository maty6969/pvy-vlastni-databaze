CREATE TABLE `Customer` (
  `customer_id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(30),
  `last_name` varchar(30),
  `email` varchar(50) UNIQUE NOT NULL,
  `phone` varchar(20) UNIQUE,
  `birth_date` date,
  `registered_at` datetime NOT NULL
);

CREATE TABLE `Room` (
  `room_id` int PRIMARY KEY AUTO_INCREMENT,
  `room_number` int UNIQUE NOT NULL,
  `capacity` int NOT NULL,
  `price_per_night` decimal(10,2) NOT NULL,
  `room_type` ENUM ('single', 'double', 'suite') NOT NULL,
  `description` text
);

CREATE TABLE `Reservation` (
  `reservation_id` int PRIMARY KEY AUTO_INCREMENT,
  `customer_id` int,
  `room_id` int,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `reservation_status` ENUM ('pending', 'confirmed', 'cancelled') NOT NULL,
  `payment_method_id` int,
  `created_at` datetime NOT NULL
);

CREATE TABLE `Service` (
  `service_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text
);

CREATE TABLE `Reservation_Service` (
  `reservation_id` int,
  `service_id` int,
  `quantity` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`reservation_id`, `service_id`)
);

CREATE TABLE `PaymentMethod` (
  `payment_method_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` ENUM ('card', 'cash', 'transfer') NOT NULL,
  `description` text
);

CREATE UNIQUE INDEX `Customer_index_0` ON `Customer` (`email`);

CREATE UNIQUE INDEX `Customer_index_1` ON `Customer` (`phone`);

CREATE INDEX `Reservation_index_2` ON `Reservation` (`check_in`);

CREATE INDEX `Reservation_index_3` ON `Reservation` (`check_out`);

CREATE INDEX `Reservation_index_4` ON `Reservation` (`check_in`, `check_out`);

ALTER TABLE `Reservation` ADD FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`);

ALTER TABLE `Reservation` ADD FOREIGN KEY (`room_id`) REFERENCES `Room` (`room_id`);

ALTER TABLE `Reservation` ADD FOREIGN KEY (`payment_method_id`) REFERENCES `PaymentMethod` (`payment_method_id`);

ALTER TABLE `Reservation_Service` ADD FOREIGN KEY (`reservation_id`) REFERENCES `Reservation` (`reservation_id`);

ALTER TABLE `Reservation_Service` ADD FOREIGN KEY (`service_id`) REFERENCES `Service` (`service_id`);
