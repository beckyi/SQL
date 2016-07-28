--insert
insert into author values(1,'박경리','토지작가');

--insert2 (컬럼 지정) 순서 몰라도 사용 가능
insert into author (no,name) values(2,'이훈');

insert into author (name,no) values('공자',3);

--insert3
insert into book values (1,'토지',null,1);

insert into book (no,title,author_no) values (2,'칼의노래',2);

--insert4 (Subquery)
insert into book (select 3, '논어',null,3 from dual);


--update
update book set title = '토지3판', rate = 5, author_no=3 where no=1;

commit;
rollback;

select * from author;
select * from book;

--update2
update  book set rate = 5 where author_no =(select no from author where name = '이훈');

--delete
delete from book where no = 3;

--delete2
delete from book where author_no = (select no from author where name = '이훈');

--pseudo column (테이블 내 없는 컬럼 출력)
select user from book;


