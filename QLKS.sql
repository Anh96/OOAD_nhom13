create database QuanLyKhachSan
go
use QuanLyKhachSan
go

create table account
(	
	username nvarchar(100) primary key,
	displayname nvarchar(100) not null default N'MN',
	password nvarchar(1000) not null,
	type int not null  default 0 --0: staff, 1:admin
)
go

create table roomtype
(
	id int identity primary key,
	name nvarchar(100) not null default N'noname'
)
go
create table room
(
	id int identity primary key,
	name nvarchar (100)not null default N'noname',
	status nvarchar(100),
	idroomtype int not null,
	price float

	foreign key (idroomtype) references roomtype(id)
)
go
create table servicetype
(
	id int identity primary key,
	name nvarchar(100)not null default N'noname'
)
go
create table service 
(
	id int identity primary key,
	name nvarchar(100) not null,
	idsvtype int not null,
	price float not null default 0

	foreign key (idsvtype) references servicetype(id)
)
go
create table client
(
	id int identity primary key,
	name nvarchar(100) not null default N'noname',
	address nvarchar(100) not null,
	phonenumber int not null,
	sex nvarchar(100) 
)
go
create table staff
(
	id int identity primary key,
	name nvarchar(100) not null default N'noname',
	address nvarchar(100) not null,
	phonenumber int not null,
	sex nvarchar(100) 
)
go
create table bill
(
	id int identity primary key,
	datecheckin date default getdate(),
	datecheckout date,
	idroom int not null,
	idclient int not null,
	idstaff int not null,
	status int not null -- đã thanh toán :1, chưa thanh toán :0;

	foreign key (idclient) references client(id),
	foreign key (idstaff) references staff(id),
	foreign key (idroom) references room(id)
)

create table billinfo
(
	id int identity primary key,
	idbill int not null,
	idservice int not null,
	count int not null default 0

	foreign key (idbill) references bill(id),
	foreign key (idservice) references service(id)
)
go
