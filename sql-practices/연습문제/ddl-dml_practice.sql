create table member (
	no int(11) not null auto_increment,
    email varchar(200) not null,
    password varchar(64) not null,
	name varchar(100) not null,
    department varchar(100),
    primary key(no)
);

desc member;
alter table member add jumin char(13) not null;
alter table member drop jumin;
alter table member add jumin char(13) not null after email;
alter table member change department department char(13) not null;
alter table member add self_intro text;
alter table member drop jumin;
-- insert
insert
  into member
  values (null, 'mmm01230@gmail.com', password('1234'), '이윤호1', '개발팀', null);

insert
	into member(no, email, name, password, department)
  value(null, 'mmm01230@gmail.com', '이윤호', '1234', '개발팀');
select * from member;
-- update
update member
   set email='dbsgh8379@naver.com', password = '1234'
   where no = 3;

delete member
   from member
   where no = 4;
   
select @@autocommit;
set autocommit=0;
