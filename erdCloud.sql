CREATE TABLE `member` (
	`memberId`	char(100)	NOT NULL,
	`pw`	char(10)	NULL,
	`name`	varchar(100)	NOT NULL	COMMENT '회원이름',
	`tel`	varchar(100)	NULL
);
-- 
CREATE TABLE `buy` (
	`Key`	int	NOT NULL,
	`memberId2`	char(100)	NOT NULL,
	`productName`	varchar(100)	NULL,
	`price`	int	NULL
);

CREATE TABLE `board` (
	`boardId`	int	NOT NULL	COMMENT '게시판id',
	`title`	varchar(100)	NULL,
	`content`	text	NULL,
	`memberId`	char(100)	NOT NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`memberId`
);

ALTER TABLE `buy` ADD CONSTRAINT `PK_BUY` PRIMARY KEY (
	`Key`,
	`memberId2`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`boardId`
);

ALTER TABLE `buy` ADD CONSTRAINT `FK_member_TO_buy_1` FOREIGN KEY (
	`memberId2`
)
REFERENCES `member` (
	`memberId`
);

