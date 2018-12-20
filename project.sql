drop table customer cascade constraint;
drop table restaurant cascade constraint;
drop table resmenu cascade constraint;
drop table curseat cascade constraint;

create table Customer (
	Cnumber number not null,
	Cid VARCHAR(15) not null,
	passwd varchar(20) not null,
	nick varchar(20) not null,
	primary key(Cnumber)
);

create table Restaurant (
	Rid varchar(15) not null,
	passwd varchar(20) not null,
	resName varchar(100) not null,
	resNum varchar2(10) not null check (length(resNum) = 10),
	resType number not null check (resType < 6 and resType > 0),  -- 1,2,3,4,5 : ��,��,��,��,ǻ��
	primary key(resNum)
);

create table resMenu (
	menuNum number,
	resNum varchar2(10) not null check (length(resNum) = 10),
	menuName varchar(25),
	menuPrice number,
	primary key(menuNum),
	foreign key(resNum) references Restaurant(resNum)
);

create table curSeat (
	resNum varchar2(10) not null check (length(resNum) = 10),
	maxSeat number,
	curSeat number,
	primary key(resNum),
	foreign key(resNum) references Restaurant(resNum)
);

insert into customer values (1, 'hymi54', 'br0409', 'Bistro');

insert into restaurant values ('food1','food1','FoodCourt','1231212345', 5);
insert into restaurant values ('gonitable', 'gonitable', '��Ͻ�Ź', '5042207661', 1);
insert into restaurant values ('sunghwa','sunghwa','��ȭ�Ĵ�','9413588053',1);
insert into restaurant values ('jjammadam','jjammadam','«����','9440530534', 2);
insert into restaurant values ('myuntamjung','myuntamjung','��Ž��','2158386053',2);
insert into restaurant values ('masamasa','masamasa', '����','2476678053',3);
insert into restaurant values ('daimaru','daimaru','���̸���','9392233053',3);
insert into restaurant values ('moida','moida','���̴ٽ�Ź','9391097053',4);
insert into restaurant values ('subchipole','subchipole','����ġ����','9421333053',4);

insert into resMenu values (1, '1231212345', '������', 5000);
insert into resmenu values (2, '1231212345', '�����', 6000);
insert into resmenu values (3, '5042207661', '���ڵη�ġ��', 6000);
insert into resmenu values (4, '9413588053', '��������', 7000);
insert into resmenu values (5, '9440530534', '��������«��', 7900);
insert into resmenu values (6, '2158386053', '��ũ«��', 6500);
insert into resmenu values (7, '2476678053', '������', 10000);
insert into resmenu values (8, '9392233053', '���������', 6500);
insert into resmenu values (9, '9391097053', '���������캺����', 6000);
insert into resmenu values (10, '9421333053', '����긮��', 5500);
insert into resmenu values (11, '5042207661', '�����', 6000);
insert into resmenu values (12, '9413588053', 'Ư ����', 8000);
insert into resmenu values (13, '9413588053', '�̴ϼ���', 12000);
insert into resmenu values (14, '9440530534', '��ȭ����', 7900);
insert into resmenu values (15, '2158386053', '����«��', 5500);
insert into resmenu values (16, '2158386053', '����«��', 6000);
insert into resmenu values (17, '2476678053', '�����ʹ�', 12000);
insert into resmenu values (18, '9392233053', '�Ե�', 7000);
insert into resmenu values (19, '9392233053', '�������', 6500);
insert into resmenu values (20, '9391097053', '���ް�ⵤ��', 6000);
insert into resmenu values (21, '9421333053', '��ġ�긮��', 3500);
insert into resmenu values (22, '9421333053', '�Ź�', 3500);

insert into curSeat values ('1231212345', 30, 0);
insert into curSeat values ('5042207661', 40, 0);
insert into curSeat values ('9413588053', 40, 0);
insert into curSeat values ('9440530534', 0, 0);
insert into curSeat values ('2158386053', 0, 0);
insert into curSeat values ('2476678053', 0, 0);
insert into curSeat values ('9392233053', 0, 0);
insert into curSeat values ('9391097053', 0, 0);
insert into curSeat values ('9421333053', 0, 0);
