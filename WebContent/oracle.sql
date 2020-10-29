create table boardUp(
idx int primary key,
name varchar(10),
email varchar(50),
homepage varchar(50),
title varchar(50),
content varchar(2000),
pwd varchar(10),
wdate date,
filename varchar(50) default NULL,
filesize int default NULL,
hit int
);

create sequence boardUp_idx_seq increment by 1 start with 1;

drop sequence boardUp_idx_seq;

select * from boardUp;

delete from boardUp;

drop table boardUp;