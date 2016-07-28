delete from book;
delete from author;
commit; --새 트래잭션 시작

select * from author;

insert into author values(1,'박경리','토지작가');
insert into author (no,name) values(2,'이훈');
insert into author (name,no) values('공자',3);

savepoint sp1;  --세이브 포인트 sp1

select * from author;

delete from author where no = 1;
delete from author where no = 2;
savepoint sp2;   --세이브 포인트 sp2

update author set name ='꽁자' where no =3;

--특정위치로 rollback할 수 있다.
rollback to sp1;

commit;

