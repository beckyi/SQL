commit;

set transaction read only;
set transaction read write;

select * from author order by no;
select * from book order by no;

insert into author values(4,'최재은',null);

update author set name = 'beckyi' where no= 4;

insert into author values(4,'최재은',null);
insert into author values(5,'옥수수',null);

rollback;

create sequence seq_book start with 1 increment by 1 maxvalue 1000000;

select seq_book.nextval from dual;  --부를때마다 자동으로 증가
select seq_book.currval from dual;

insert into author values(seq_author.nextval,'','');