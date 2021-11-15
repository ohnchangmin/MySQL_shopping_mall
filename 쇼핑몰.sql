﻿CREATE TABLE `MEMBER` (
	`MEMBER_IDX`	INT				NOT NULL	AUTO_INCREMENT,	
	`NAME`		VARCHAR(10)			NOT NULL,
	`EMAIL`		VARCHAR(30)			NOT NULL,
	`PASSWORD`	VARCHAR(15)			NOT NULL,
	`GENDER`		ENUM('M, 'F')			NOT NULL,
	`BIRTH`		CHAR(10)				NOT NULL,
	`TEL`		CHAR(12)				NOT NULL,
	`REG_DATE`	TIMESTAMP			NOT NULL,
	`REGSTRANT`	VARCHAR(30)			NOT NULL,
	`GRADE`		ENUM('A', 'B', 'C', 'D', 'E', '관리자')	NOT NULL	DEFAULT 'E',
	`POINT`	INT	NOT NULL
);

CREATE TABLE `QNA_PRODUCT` (
	`QNA_IDX`	INT		NOT NULL	AUTO_INCREMENT,
	`CATEGORY`	VARCHAR(10)	NOT NULL,
	`TITLE`		VARCHAR(20)	NOT NULL,
	`CONTENT`	TEXT		NOT NULL,
	`REG_DATE`	TIMESTAMP	NOT NULL,
	`WRITER`		VARCHAR(30)	NOT NULL,
	`MEMBER_IDX`	INT		NOT NULL,
	`PRODUCT_IDX`	INT		NOT NULL,
	`SECRET`		ENUM('Y', 'N')	NOT NULL	DEFAULT 'N'
);

CREATE TABLE `MEMBER_HISTORY` (
	`HISTORY_IDX`		INT		NOT NULL	AUTO_INCREMENT,
	`MODIFIED_COLUMN`	VARCHAR(10)	NOT NULL,
	`CONTENT_BEFORE`		VARCHAR(30)	NOT NULL,
	`CONTENT_AFTER`		VARCHAR(30)	NOT NULL,
	`MODIFIER`		VARCHAR(30)	NOT NULL,
	`MODIFICATION_DATE`	TIMESTAMP	NOT NULL,
	`MEMBER_IDX`		INT		NOT NULL
);

CREATE TABLE `PRODUCT` (
	`PRODUCT_IDX`	INT		NOT NULL	AUTO_INCREMENT,
	`BRAND`		VARCHAR(15)	NOT NULL,
	`CODE`		VARCHAR(30)	NOT NULL,
	`NAME`		VARCHAR(30)	NOT NULL,
	`IMAGE`		BLOB		NOT NULL,
	`PRICE`		INT		NOT NULL,
	`STOCK`		SHORT		NOT NULL,
	`DISCOUNT_RATE`	INT		NOT NULL	DEFAULT 0,
	`POINT`		INT		NOT NULL	DEFAULT 0
);

CREATE TABLE `QNA_PRODUCT_COMMENT` (
	`COMMENT_IDX`	INT		NOT NULL	AUTO_INCREMENT,
	`CONTENT`	TINYTEXT		NOT NULL,
	`REG_DATE`	TIMESTAMP	NOT NULL,
	`WRITER`		VARCHAR(10)	NOT NULL,
	`QNA_IDX`	INT		NOT NULL
);

CREATE TABLE `SHIPPING_ADDRESS` (
	`SHIP_IDX`		INT		NOT NULL	AUTO_INCREMENT,
	`NAME`			VARCHAR(10)	NOT NULL,
	`TEL`			CHAR(12)		NOT NULL,
	`ZIP_CODE`		CHAR(5)		NOT NULL,
	`ADDRESS`		VARCHAR(30)	NOT NULL,
	`DETAIL_ADDRESS`		VARCHAR(20)	NOT NULL,
	`DEFAULT_ADDRESS`	ENUM('Y', 'N')	NOT NULL	DEFAULT 'N',
	`MEMBER_IDX`		INT		NOT NULL
);

CREATE TABLE `ORDER` (
	`ORDER_IDX`	INT	NOT NULL	AUTO_INCREMENT,
	`PRODUCT_IDX`	INT	NOT NULL,
	`MEMBER_IDX`	INT	NOT NULL,
	`NUMBER`	INT	NOT NULL,
	`STATUS`		ENUM('결제', '배송중', '배송', '구매확정', '교환', '교환완료', '환불', '환불완료')	NOT NULL
);

ALTER TABLE `MEMBER` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`MEMBER_IDX`
);

ALTER TABLE `QNA_PRODUCT` ADD CONSTRAINT `PK_QNA_PRODUCT` PRIMARY KEY (
	`QNA_IDX`
);

ALTER TABLE `MEMBER_HISTORY` ADD CONSTRAINT `PK_MEMBER_HISTORY` PRIMARY KEY (
	`HISTORY_IDX`
);

ALTER TABLE `PRODUCT` ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
	`PRODUCT_IDX`
);

ALTER TABLE `QNA_PRODUCT_COMMENT` ADD CONSTRAINT `PK_QNA_PRODUCT_COMMENT` PRIMARY KEY (
	`COMMENT_IDX`
);

ALTER TABLE `SHIPPING_ADDRESS` ADD CONSTRAINT `PK_SHIPPING_ADDRESS` PRIMARY KEY (
	`SHIP_IDX`
);

ALTER TABLE `ORDER` ADD CONSTRAINT `PK_ORDER` PRIMARY KEY (
	`ORDER_IDX`
);

ALTER TABLE `QNA_PRODUCT` ADD CONSTRAINT `FK_MEMBER_TO_QNA_PRODUCT_1` FOREIGN KEY (
	`MEMBER_IDX`
)
REFERENCES `MEMBER` (
	`MEMBER_IDX`
);

ALTER TABLE `QNA_PRODUCT` ADD CONSTRAINT `FK_PRODUCT_TO_QNA_PRODUCT_1` FOREIGN KEY (
	`PRODUCT_IDX`
)
REFERENCES `PRODUCT` (
	`PRODUCT_IDX`
);

ALTER TABLE `MEMBER_HISTORY` ADD CONSTRAINT `FK_MEMBER_TO_MEMBER_HISTORY_1` FOREIGN KEY (
	`MEMBER_IDX`
)
REFERENCES `MEMBER` (
	`MEMBER_IDX`
);

ALTER TABLE `QNA_PRODUCT_COMMENT` ADD CONSTRAINT `FK_QNA_PRODUCT_TO_QNA_PRODUCT_COMMENT_1` FOREIGN KEY (
	`QNA_IDX`
)
REFERENCES `QNA_PRODUCT` (
	`QNA_IDX`
);

ALTER TABLE `SHIPPING_ADDRESS` ADD CONSTRAINT `FK_MEMBER_TO_SHIPPING_ADDRESS_1` FOREIGN KEY (
	`MEMBER_IDX`
)
REFERENCES `MEMBER` (
	`MEMBER_IDX`
);

ALTER TABLE `ORDER` ADD CONSTRAINT `FK_PRODUCT_TO_ORDER_1` FOREIGN KEY (
	`PRODUCT_IDX`
)
REFERENCES `PRODUCT` (
	`PRODUCT_IDX`
);

ALTER TABLE `ORDER` ADD CONSTRAINT `FK_MEMBER_TO_ORDER_1` FOREIGN KEY (
	`MEMBER_IDX`
)
REFERENCES `MEMBER` (
	`MEMBER_IDX`
);

