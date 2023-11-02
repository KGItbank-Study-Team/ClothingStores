create table member(
	uid 		int unsigned,
    id			varchar(30) NOT NULL,
    passwoard	varchar(100) NOT NULL,
    regDate		datetime NOT NULL,
    #제약조건#
    constraint PK_mem primary key(uid)
)member