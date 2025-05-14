 
CREATE TABLE `member` (
	`memberID`	varchar(8)	NOT NULL	COMMENT '회원id는 최대 8글자까지',
	`name`	varchar(255)	NULL	COMMENT '회원이름은 한글기준으로 255글자',
	`tel`	varchar(20)	NULL	COMMENT '연락처는 전화번호/집번호 다 허용함.'
);

CREATE TABLE `board` (
	`boardId`	int	NOT NULL	COMMENT '게시판id',
	`memberID`	varchar(8)	NOT NULL	COMMENT '회원id는 최대 8글자까지',
	`title`	varchar(100)	NULL,
	`content`	text	NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`memberID`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`boardId`,
	`memberID`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_member_TO_board_1` FOREIGN KEY (
	`memberID`
)
REFERENCES `member` (
	`memberID`
);





