

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`uid`	bigint unsigned 	NOT NULL,
	`id`	varchar(11)	NOT NULL,
	`password`	varchar(100)	NOT NULL,
	`email`	varchar(30)	NOT NULL,
	`name`	varchar(30)	NOT NULL,
	`address`	VARCHAR(30)	NOT NULL,
	`sex`	char(1) 	NOT NULL check(sex IN('F','M')) COMMENT 'Female, Male',
	`reg_date`	datetime	NOT NULL
);
DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`uid`	bigint unsigned 	NOT NULL,
	`id`	varchar(11)	NOT NULL,
	`password`	varchar(100)	NOT NULL,
	`email`	varchar(30)	NOT NULL,
	`name`	varchar(30)	NOT NULL,
	`address`	VARCHAR(30)	NOT NULL,
	`sex`	char(1)	NOT NULL	COMMENT 'Female, Male',
	`reg_date`	datetime	NOT NULL
);

DROP TABLE IF EXISTS `productOrder`;

CREATE TABLE `productOrder` (
	`uid`	bigint unsigned 	NOT NULL,
	`mem_uid`	bigint unsigned 	NOT NULL,
	`order_date`	datetime	NOT NULL,
	`status`	varchar(10)	NOT NULL,
	`total_price`	int unsigned	NULL
);

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
	`uid`	bigint unsigned 	NOT NULL,
	`mem_uid`	bigint unsigned 	NOT NULL,
	`prod_code`	varchar(30)	NOT NULL,
	`cnt`	tinyint unsigned	NOT NULL,
	`reg_date`	datetime	NOT NULL	COMMENT '지정일수 지나면 제거'
);

DROP TABLE IF EXISTS `wish`;

CREATE TABLE `wish` (
	`uid`	bigint unsigned 	NOT NULL,
	`mem_uid`	bigint unsigned 	NOT NULL,
	`prod_code`	varchar(30)	NOT NULL,
	`reg_date`	datetime	NOT NULL	COMMENT '지정일수 지나면제거'
);

DROP TABLE IF EXISTS `orderPayment`;

CREATE TABLE `orderPayment` (
	`order_uid`	bigint unsigned 	NOT NULL,
	`pay_date`	datetime	NOT NULL,
	`type`	varchar(10)	NOT NULL,
	`status`	varchar(10)	NOT NULL,
	`price`	int unsigned	NOT NULL
);

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
	`uid`	bigint unsigned 	NOT NULL,
	`top_ctg_uid`	bigint unsigned 	NULL	COMMENT '상위 카테고리 UID',
	`name`	varchar(30)	NOT NULL
);

DROP TABLE IF EXISTS `productDetail`;

CREATE TABLE `productDetail` (
	`prod_uid`	bigint unsigned 	NOT NULL,
	`color`	varchar(10)	NOT NULL,
	`size`	varchar(10)	NOT NULL,
	`cnt`	tinyint unsigned	NULL	COMMENT '재고관련 테이블 따로 관리할 필요성있음'
);

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
	`uid`	bigint unsigned 	NOT NULL,
	`ctg_uid`	bigint unsigned 	NOT NULL,
	`name`	varchar(30)	NOT NULL,
	`desc`	varchar(100)	NOT NULL,
	`price`	int unsigned	NOT NULL,
	`maker`	varchar(100)	NOT NULL
);

DROP TABLE IF EXISTS `orderDetail`;

CREATE TABLE `orderDetail` (
	`order_uid`	bigint unsigned 	NOT NULL,
	`prod_code`	varchar(30)	NOT NULL,
	`cnt`	tinyint unsigned	NOT NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`uid`
);

ALTER TABLE `productOrder` ADD CONSTRAINT `PK_PRODUCTORDER` PRIMARY KEY (
	`uid`
);

ALTER TABLE `cart` ADD CONSTRAINT `PK_CART` PRIMARY KEY (
	`uid`
);

ALTER TABLE `wish` ADD CONSTRAINT `PK_WISH` PRIMARY KEY (
	`uid`
);

ALTER TABLE `orderPayment` ADD CONSTRAINT `PK_ORDERPAYMENT` PRIMARY KEY (
	`order_uid`
);

ALTER TABLE `category` ADD CONSTRAINT `PK_CATEGORY` PRIMARY KEY (
	`uid`
);

ALTER TABLE `productDetail` ADD CONSTRAINT `PK_PRODUCTDETAIL` PRIMARY KEY (
	`prod_uid`
);

ALTER TABLE `product` ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
	`uid`
);

ALTER TABLE `orderDetail` ADD CONSTRAINT `PK_ORDERDETAIL` PRIMARY KEY (
	`order_uid`
);

ALTER TABLE `productOrder` ADD CONSTRAINT `FK_member_TO_productOrder_1` FOREIGN KEY (
	`mem_uid`
)
REFERENCES `member` (
	`uid`
);

ALTER TABLE `cart` ADD CONSTRAINT `FK_member_TO_cart_1` FOREIGN KEY (
	`mem_uid`
)
REFERENCES `member` (
	`uid`
);

ALTER TABLE `wish` ADD CONSTRAINT `FK_member_TO_wish_1` FOREIGN KEY (
	`mem_uid`
)
REFERENCES `member` (
	`uid`
);

ALTER TABLE `orderPayment` ADD CONSTRAINT `FK_productOrder_TO_orderPayment_1` FOREIGN KEY (
	`order_uid`
)
REFERENCES `productOrder` (
	`uid`
);

ALTER TABLE `category` ADD CONSTRAINT `FK_category_TO_category_1` FOREIGN KEY (
	`top_ctg_uid`
)
REFERENCES `category` (
	`uid`
);

ALTER TABLE `productDetail` ADD CONSTRAINT `FK_product_TO_productDetail_1` FOREIGN KEY (
	`prod_uid`
)
REFERENCES `product` (
	`uid`
);

ALTER TABLE `product` ADD CONSTRAINT `FK_category_TO_product_1` FOREIGN KEY (
	`ctg_uid`
)
REFERENCES `category` (
	`uid`
);

ALTER TABLE `orderDetail` ADD CONSTRAINT `FK_productOrder_TO_orderDetail_1` FOREIGN KEY (
	`order_uid`
)
REFERENCES `productOrder` (
	`uid`
);

#테이블 확인
show tables;

#제약조건 확인
SELECT TABLE_NAME, CONSTRAINT_TYPE, CONSTRAINT_NAME FROM information_schema.table_constraints;


