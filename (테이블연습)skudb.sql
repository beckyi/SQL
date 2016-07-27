--테이블 생성
create table book(
  no        NUMBER,
  title     VARCHAR2 (100),
  author    VARCHAR2 (100),
  pub_date  DATE
);

desc book;

select * from book;

--예제 데이터 넣기
insert into book values(1,'어린왕자','앙투안 드 생텍쥐페리',to_date('1943-10-10','yyyy-mm-dd'));
insert into book values(2,'나무','베르나르 베르베르',to_date('2002-10-10','yyyy-mm-dd'));
insert into book values(3,'해리포터와 마법사의 돌','조앤 k 롤링',to_date('1997-06-26','yyyy-mm-dd'));

--데이터를 넣으면서 테이블 생성하기 (테이블 백업)
create table book_temp as (select * from book);

select * from book_temp;

--테이블 변경 (컬럼추가)
alter table book add (pubs VARCHAR(200));
desc book;
select * from book;

--테이블 변경 (컬럼 수정)
alter table book modify(pubs VARCHAR(500));
desc book;

--테이블 변경(컬럼 삭제)
alter table book drop(pubs);
desc book;

--테이블 변경(컬럼 Unused 설정)
alter table book set unused(author);
desc book;

--테이블 삭제
drop table book_temp;
select * from book_temp;

--테이블 데이터 삭제
truncate table book;
select * from book;

--comment(설명) 달기
comment on table book is 'this is comments';
select * from user_tab_comments;

--rename
rename book to article;
select * from article;

commit;

--제약조건 (constraint)
create table book(
  no        NUMBER NOT NuLL,
  title     VARCHAR2 (100) NOT NuLL,
  author    VARCHAR2 (100),
  pub_date  DATE
);

insert into book values(1,'앙투안 드 생텍쥐페리',null,null);

--error
insert into book values(1,null,null,null);

insert into book values(1,'',null,null);

drop table book;
drop table author;

--제약조건 (check)
create table book(
  no        NUMBER Primary key,
  title     VARCHAR2 (100) NOT NuLL,
  author    VARCHAR2 (100),
  pub_date  DATE
  rate      NUMBER NOT NULL
  check( rate in(1,2,3,4,5))
);

--author table 생성
create table author(
  no    number,
  name  varchar2(80) not null,
  description  varchar2(2000),
  primary key(no),
);

insert into author values(1,'최재은','다람쥐 쳇바퀴가 돌아간다');
insert into author values(2,'최솔빈','저 너머에서 꼬망꼬망 부른다');

--book table 생성
create table book(
  no    number,
  title varchar(100) not null,
  author varchar(100),
  pub_date  date,
  rate      NUMBER NOT NULL,
  author_no number,
  constraint c_book_pk primary key(no),
  constraint c_book_check_rate check( rate in(1,2,3,4,5)),
  constraint c_book_fk foreign key(author_no) references author(no)
  
    --삭제시 에러
  on delete set null --pk 삭제시 null로 세팅
                     --  on delete cascade pk  --함께 삭제
);

insert into book values(1,'어린왕자','앙투안 드 생텍쥐페리',to_date('1943-10-10','yyyy-mm-dd'),5,1);
insert into book values(2,'해리포터와 마법사의 돌','조앤 k 롤링',to_date('1997-06-26','yyyy-mm-dd'),4,1);

--사용자 스키마 객체 확인 (테이블)
SELECT object_name 
FROM user_objects
WHERE object_type = 'TABLE';

--제약조건 확인 
SELECT constraint_name, constraint_type,search_condition
FROM user_constraints
WHERE table_name = 'BOOK';

--제약조건 컬럼 확인
SELECT constraint_name, column_name
FROM user_cons_columns
WHERE table_name = 'BOOK';

