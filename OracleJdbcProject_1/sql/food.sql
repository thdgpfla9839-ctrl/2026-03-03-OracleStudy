create table food (
no number primary key,
name varchar2(100),
type VARCHAR2(100),
phone VARCHAR2(30),
address VARCHAR2(260),
score number(2,1),
parking VARCHAR2(200),
poster VARCHAR2(260),
time VARCHAR2(50),
content CLOB,
theme VARCHAR2(4000),
price VARCHAR2(100)
);

desc food;