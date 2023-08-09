-- INFORMASI
-- XAMPP version = v3.3.0
-- https://www.phpmyadmin.net/


-- --------------------------------------------------------
-- TAHAP 1 : XAMPP
-- Start Apache dan MySQL
-- Buka Command Prompt dan ketikkan syntax berikut
C:\Users\User>cd\

C:\>cd xampp

C:\xampp>cd mysql

C:\xampp\mysql>cd bin

C:\xampp\mysql\bin>mysql -u root -p


-- --------------------------------------------------------
-- TAHAP 2 : DATABASE
-- Membuat Database dengan nama db_florist
CREATE DATABASE `db_kutika`;
USE `db_kutika`;

-- --------------------------------------------------------
-- TAHAP 3 : CREATE TABEL
-- Tabel deals
CREATE TABLE `deals` (
  `deals_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `discount_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabel book
CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(30) NOT NULL,
  `category` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabel book_order
CREATE TABLE `book_order` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabel recipient
CREATE TABLE `recipient` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `post_code` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------
-- TAHAP 4 INSERT DATA
-- Memasukkan data ke tabel deals
INSERT INTO `deals` (`deals_id`, `book_id`, `discount_price`) VALUES
(1, 1, 96000),
(2, 2, 120000),
(3, 3, 580000),
(4, 4, 1650000);

-- Memasukkan data ke tabel book
INSERT INTO `book` (`id`, `name`, `price`,  `stock`, `image`, `category`) VALUES
(1, 'Matematika Diskrit', 120000, 10, 'book1.jpg', 'bukucetak'),
(2, 'Kursus Mandiri PHP 8', 150000, 35, 'book2.jpg', 'bukucetak'),
(3, 'Designing Interface', 620000, 50, 'book3.jpg', 'bukucetak'),
(4, 'Big Java Early Objects', 1670000, 80, 'book4.jpg', 'bukucetak'),
(5, 'Automate the Boring Stuff with Python', 360000, 20, 'book5.jpg', 'bukucetak'),
(6, 'Pengantar Teknologi Informasi', 200000, 68, 'book6.jpg', 'bukucetak');

-- Memasukkan data ke tabel book_order
-- INSERT INTO `book_order` VALUES
-- (3, 2, 1, 1, 120000),
-- (4, 1, 2, 2, 192000);

-- Memasukkan data ke tabel recipient
-- INSERT INTO `recipient` (`id`, `name`, `phone`, `email`, `city`, `post_code`, `address`) VALUES
-- (1, 'nana', '081288237667', 'nana12@gmail.com', 'Jakarta', '10120', 'Jl kemakmuran no.22'),
-- (2, 'vale', '082256871244', 'valval@gmail.com', 'Bandung', '40511', 'Jl cintabumi no.18');


-- --------------------------------------------------------
-- TAHAP 5 : INDEX
-- Indexes table deals
ALTER TABLE `deals`
  ADD PRIMARY KEY (`deals_id`),
  ADD KEY `book_id` (`book_id`);

-- Indexes table book
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

-- Indexes table book_order
ALTER TABLE `book_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `recipient_id` (`recipient_id`);

-- Indexes table recipient
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`id`);


-- --------------------------------------------------------
-- TAHAP 6 : AUTO_INCREMENT
-- AUTO_INCREMENT table deals
ALTER TABLE `deals`
  MODIFY `deals_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

-- AUTO_INCREMENT table book
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

-- AUTO_INCREMENT table book_order
ALTER TABLE `book_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

-- AUTO_INCREMENT table recipient
ALTER TABLE `recipient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


-- --------------------------------------------------------
-- TAHAP 7 : CONSTRAINTS
-- Constraints table deals
ALTER TABLE `deals`
  ADD CONSTRAINT `book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

-- Constraints table book_order
ALTER TABLE `book_order`
  ADD CONSTRAINT `book_order_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `recipient` FOREIGN KEY (`recipient_id`) REFERENCES `recipient` (`id`);

COMMIT;