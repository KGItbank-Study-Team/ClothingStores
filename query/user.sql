#db생성
create database SLIMBEAR;

#유저생성
create user 'kgitbank'@'%' identified by 'kgitbank';

#권한부여
grant all privileges on SLIMBEAR.* to 'kgitbank'@'%';

#권한 반영
flush privileges;