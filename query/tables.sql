DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`uid`	bigint unsigned	NOT NULL ,
	`id`	varchar(11)	NOT NULL unique,
	`password`	varchar(100)	NOT NULL,
    `phone`	varchar(30)	NOT NULL,
	`email`	varchar(30)	NOT NULL unique,
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
	`total_price`	int unsigned	NOT NULL
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

DROP TABLE IF EXISTS `productReview`;

drop table productReview;

CREATE TABLE `productReview` (
	`uid`	bigint unsigned 	NOT NULL,
	`mem_id`	varchar(11)	NOT NULL,
	`prod_code`	varchar(30)	NOT NULL,
	`title`	varchar(100)	NOT NULL,
	`content`	varchar(100)	NOT NULL,
	`score`	tinyint	NOT NULL,
	`reg_date`	datetime	NOT NULL
);

DROP TABLE IF EXISTS `reviewComent`;

CREATE TABLE `reviewComent` (
	`uid`	bigint unsigned 	NOT NULL,
	`review_uid`	bigint unsigned 	NOT NULL,
	`title`	varchar(100)	NOT NULL,
	`content`	varchar(100)	NOT NULL,
	`mem_id`	varchar(11)	NOT NULL
);

DROP TABLE IF EXISTS `inquiry`;

CREATE TABLE `inquiry` (
	`uid`	bigint unsigned 	NOT NULL,
	`writer_id`	varchar(11)	NOT NULL,
	`title`	varchar(100)	NOT NULL,
	`content`	varchar(100)	NOT NULL,
	`reg_date`	datetime	NOT NULL,
	`status`	varchar(10)	NOT NULL,
	`type`	varchar(10)	NOT NULL,
	`prod_uid`	bigint unsigned 	NULL
);

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
	`uid`	bigint unsigned 	NOT NULL,
	`title`	varchar(100)	NOT NULL,
	`content`	varchar(100)	NOT NULL,
	`reg_date`	datetime	NOT NULL,
	`priority`	tinyint	NOT NULL	COMMENT '0 이상일경우 상단 고정',
	`type`	varchar(10)	NOT NULL,
	`writer`	varchar(30)	NOT NULL
);

DROP TABLE IF EXISTS `faq`;

CREATE TABLE `faq` (
	`uid`	bigint unsigned 	NOT NULL,
	`question`	varchar(100)	NOT NULL,
	`answer`	varchar(100)	NOT NULL,
	`type`	varchar(10)	NULL
);

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
	`uid`	bigint unsigned 	NOT NULL,
	`id`	varchar(11)	NULL,
	`password`	varchar(100)	NULL,
	`name`	varchar(30)	NULL
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
	`maker`	varchar(100)	NOT NULL,
	`main_image`	varchar(100)	NOT NULL
);

DROP TABLE IF EXISTS `orderDetail`;

CREATE TABLE `orderDetail` (
	`order_uid`	bigint unsigned 	NOT NULL,
	`prod_code`	varchar(30)	NOT NULL,
	`cnt`	tinyint unsigned	NOT NULL,
	`review_uid`	bigint unsigned 	NULL
);

DROP TABLE IF EXISTS `inquiryAnswer`;

CREATE TABLE `inquiryAnswer` (
	`uid`	bigint unsigned 	NOT NULL,
	`inqr_uid`	bigint unsigned 	NOT NULL,
	`title`	varchar(100)	NOT NULL,
	`content`	varchar(100)	NOT NULL,
	`mem_id`	varchar(11)	NOT NULL
);

ALTER TABLE `inquiryAnswer` ADD CONSTRAINT `PK_INQUIRYANSWER` PRIMARY KEY (
	`uid`
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

ALTER TABLE `productReview` ADD CONSTRAINT `PK_PRODUCTREVIEW` PRIMARY KEY (
	`uid`
);

ALTER TABLE `reviewComent` ADD CONSTRAINT `PK_REVIEWCOMENT` PRIMARY KEY (
	`uid`
);

ALTER TABLE `inquiry` ADD CONSTRAINT `PK_INQUIRY` PRIMARY KEY (
	`uid`
);

ALTER TABLE `notice` ADD CONSTRAINT `PK_NOTICE` PRIMARY KEY (
	`uid`
);

ALTER TABLE `faq` ADD CONSTRAINT `PK_FAQ` PRIMARY KEY (
	`uid`
);

ALTER TABLE `admin` ADD CONSTRAINT `PK_ADMIN` PRIMARY KEY (
	`uid`
);

ALTER TABLE `orderPayment` ADD CONSTRAINT `PK_ORDERPAYMENT` PRIMARY KEY (
	`order_uid`
);

ALTER TABLE `category` ADD CONSTRAINT `PK_CATEGORY` PRIMARY KEY (
	`uid`
);

ALTER TABLE `product` ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
	`uid`
);

CREATE TABLE `ProductBannerTop` (
	`uid`	bigint unsigned 	NOT NULL,
	`image`	varchar(100)	NOT NULL,
	`prod_uid`	bigint unsigned 	NOT NULL
);

ALTER TABLE `ProductBannerTop` ADD CONSTRAINT `PK_PRODUCTBANNERTOP` PRIMARY KEY (
	`uid`
);

CREATE TABLE `memberCoupon` (
	`uid`	bigint unsigned 	NOT NULL,
	`mem_uid`	bigint unsigned 	NOT NULL,
	`coup_uid`	bigint unsigned 	NOT NULL,
	`expi_date`	date	NOT NULL,
	`use_date`	date	NULL	COMMENT 'null이면 사용안함'
);

ALTER TABLE `memberCoupon` ADD CONSTRAINT `PK_MEMBERCOUPON` PRIMARY KEY (
	`uid`
);


CREATE TABLE `Coupon` (
	`uid`	bigint unsigned 	NOT NULL,
	`name`	varchar(30)	NOT NULL,
	`type`	varchar(10)	NOT NULL,
	`value`	int	NOT NULL	COMMENT 'type마다 용도다름',
	`expi_days`	int	NULL	COMMENT '쿠폰획득일 기준 + 될 일수',
	`min_price`	int unsigned	NOT NULL
);

ALTER TABLE `Coupon` ADD CONSTRAINT `PK_COUPON` PRIMARY KEY (
	`uid`
);

CREATE TABLE `memberOrderAddress` (
	`uid`	bigint unsigned 	NOT NULL,
	`mem_uid`	bigint unsigned 	NOT NULL,
	`name`	varchar(30)	NOT NULL,
	`phone`	varchar(30)	NULL,
	`nomal_phone`	varchar(30)	NOT NULL,
	`address`	varchar(100)	NOT NULL
);

ALTER TABLE `memberOrderAddress` ADD CONSTRAINT `PK_MEMBERORDERADDRESS` PRIMARY KEY (
	`uid`
);

