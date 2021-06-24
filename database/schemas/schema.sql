CREATE DATABASE products;

USE products;

DROP TABLE IF EXISTS `product`, `related_products`, `features`, `styles`, `photos`, `skus`;

CREATE TABLE `product` (
  `id` SMALLINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `slogan` VARCHAR(120) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `category` VARCHAR(30) NOT NULL,
  `default_price` DECIMAL(11,2) NOT NULL,
  `created_at` DATE DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATE DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (`id`),
);

CREATE TABLE `related_products` (
  `id` SMALLINT NOT NULL AUTO_INCREMENT,
  `current_product_id` SMALLINT NOT NULL,
  `related_product_id` SMALLINT NOT NULL,

  PRIMARY KEY (`id`),
  -- INDEX (`product_id`),
);

CREATE TABLE `features` (
  `id` SMALLINT NOT NULL AUTO_INCREMENT,
  `product_id` SMALLINT NOT NULL,
  `feature` VARCHAR(30) NOT NULL,
  `value` VARCHAR(30) DEFAULT NULL,

  PRIMARY KEY (`id`),
  -- INDEX (`product_id`),
);

CREATE TABLE `styles` (
  `id` SMALLINT NOT NULL AUTO_INCREMENT,
  `product_id` SMALLINT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `sale_price` DECIMAL(11,2) DEFAULT NULL,
  `original_price` DECIMAL(11,2) NOT NULL,
  `default_style` BOOL DEFAULT 0,

  PRIMARY KEY (`id`),
  -- INDEX (`product_id`),
);

CREATE TABLE `photos` (
  `id` SMALLINT NOT NULL AUTO_INCREMENT,
  `style_id` SMALLINT NOT NULL,
  `url` VARCHAR(500) NOT NULL,
  `thumbnail_url` VARCHAR(500) NOT NULL,

  PRIMARY KEY (`id`),
  -- INDEX (`style_id`),
);

CREATE TABLE `skus` (
  `id` SMALLINT NOT NULL AUTO_INCREMENT,
  `style_id` SMALLINT NOT NULL,
  `size` VARCHAR(10) NOT NULL,
  `quantity` SMALLINT NOT NULL,

  PRIMARY KEY(`id`),
  -- INDEX (`style_id`, `size`),
);

-- ALTER TABLE `related_products` ADD FOREIGN KEY (current_product_id) REFERENCES `product` (`id`);
-- ALTER TABLE `features` ADD FOREIGN KEY (product_id) REFERENCES `product` (`id`);
-- ALTER TABLE `styles` ADD FOREIGN KEY (product_id) REFERENCES `product` (`id`);
-- ALTER TABLE `photos` ADD FOREIGN KEY (style_id) REFERENCES `styles` (`id`);
-- ALTER TABLE `skus` ADD FOREIGN KEY (style_id) REFERENCES `styles` (`id`);

-- LOAD DATA
--   INFILE 'product.csv'
--   INTO TABLE `product`
--   FIELDS TERMINATED BY ','
--   ENCLOSED BY '"'
--   LINES TERMINATED BY '\r\n'
--   IGNORE 1 ROWS;

-- LOAD DATA
--   INFILE 'related.csv'
--   INTO TABLE `related_products`
--   FIELDS TERMINATED BY ','
--   ENCLOSED BY '"'
--   LINES TERMINATED BY '\r\n'
--   IGNORE 1 ROWS;

-- LOAD DATA
--   INFILE 'features.csv'
--   INTO TABLE `features`
--   FIELDS TERMINATED BY ','
--   ENCLOSED BY '"'
--   LINES TERMINATED BY '\r\n'
--   IGNORE 1 ROWS;

-- LOAD DATA
--   INFILE 'styles.csv'
--   INTO TABLE `styles`
--   FIELDS TERMINATED BY ','
--   ENCLOSED BY '"'
--   LINES TERMINATED BY '\r\n'
--   IGNORE 1 ROWS;

-- LOAD DATA
--   INFILE 'photos.csv'
--   INTO TABLE `photos`
--   FIELDS TERMINATED BY ','
--   ENCLOSED BY '"'
--   LINES TERMINATED BY '\r\n'
--   IGNORE 1 ROWS;

-- LOAD DATA
--   INFILE 'skus.csv'
--   INTO TABLE `skus`
--   FIELDS TERMINATED BY ','
--   ENCLOSED BY '"'
--   LINES TERMINATED BY '\r\n'
--   IGNORE 1 ROWS;
