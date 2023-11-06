#테이블 확인
show tables;
#제약조건 확인
SELECT TABLE_NAME, CONSTRAINT_TYPE, CONSTRAINT_NAME FROM information_schema.table_constraints;



### Member UID Auto increment ###
ALTER TABLE member MODIFY COLUMN uid bigint unsigned auto_increment;