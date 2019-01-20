-----------------------------------------
--- script to create Library database ---
-----------------------------------------
--drop fk
alter table Book drop constraint fk_book_publisherid;
go

alter table BookAuthor drop constraint fk_bookauthor_bookid;
go

alter table BookAuthor drop constraint fk_bookauthor_authorid;
go

alter table BookCategory drop constraint fk_bookcategory_bookid;
go

alter table BookCategory drop constraint fk_bookcategory_categoryid;
go

alter table BookLibrary drop constraint fk_booklibrary_libraryid;
go

alter table BookLibrary drop constraint fk_booklibrary_bookid;
go

alter table Library drop constraint fk_library_addressid;
go

alter table Member drop constraint fk_member_addressid;
go

alter table Request drop constraint fk_request_requestedby;
go

alter table Request drop constraint fk_request_bookid;
go

--drop tables
drop table Book;
go
drop table Author;
go
drop table BookAuthor;
go
drop table Category;
go
drop table BookCategory;
go
drop table Address;
go
drop table Library;
go
drop table BookLibrary;
go
drop table Member;
go
drop table Request;
go
drop table Publisher;
go

--create tables
create table Book (
	BookId int not null,
	Title varchar(50),
	PublisherId int,
	[Year] int,
	Price decimal,
	constraint pk_book primary key clustered (BookId) 
);
go

create table Author (
	AuthorId int not null,
	FirstName varchar(50),
	LastName varchar(50),
	BirthDate date,
	constraint pk_author primary key clustered (AuthorId)
);
go

create table BookAuthor (
	BookAuthorId int not null,
	BookId int,
	AuthorId int,
	constraint pk_bookauthor primary key clustered (BookAuthorId)
);
go

create table Category (
	CategoryId int not null,
	Name varchar(50),
	constraint pk_category primary key clustered (CategoryId)
);
go

create table BookCategory (
	BookCategoryId int not null,
	BookId int,
	CategoryId int,
	constraint pk_bookcategory primary key clustered (BookCategoryId)
);
go

create table Address (
	AddressId int not null,
	Street varchar(50),
	BuildingNumber int,
	BuildingName varchar(50),
	EntranceNumber varchar(10),
	[Floor] varchar(10),
	ApartmentNumber int,
	City  varchar(50),
	PostalCode int,
	Country  varchar(50),
	OtherDetails varchar(100),
	constraint pk_address primary key clustered (AddressId)
);
go

create table Library (
	LibraryId int not null,
	Name varchar(50),
	AddressId int,
	constraint pk_library primary key clustered (LibraryId)
);
go

create table BookLibrary (
	BookLibraryId int not null,
	LibraryId int, 
	BookId int,
	Quantity int, 
	constraint pk_booklibrary primary key clustered (BookLibraryId)
);
go


create table Member (
	MemberId int not null,
	FirstName varchar(50),
	LastName varchar(50),
	PermitNumber varchar(50), 
	AddressId int,
	Gender varchar(10),
	PhoneNumber varchar(20),
	EmailAddress varchar(50),
	constraint pk_member primary key clustered (MemberId)
);
go

create table Request (
	RequestId int not null,
	RequestedBy int,
	BookId int, 
	DateRequested date, 
	DateReturned date, 
	constraint pk_request primary key clustered (RequestId)
);
go

create table Publisher (
	PublisherId int not null,
	Name varchar(50),
	constraint pk_publisher primary key clustered (PublisherId)
);
go


--add foreign keys
alter table Book add constraint fk_book_publisherid foreign key ( PublisherId ) references Publisher(PublisherId) on delete cascade;
go

alter table BookAuthor add constraint fk_bookauthor_bookid foreign key ( BookId ) references Book(BookId) on delete cascade;
go

alter table BookAuthor add constraint fk_bookauthor_authorid foreign key ( AuthorId ) references Author(AuthorId) on delete cascade;
go

alter table BookCategory add constraint fk_bookcategory_bookid foreign key ( BookId ) references Book(BookId) on delete cascade;
go

alter table BookCategory add constraint fk_bookcategory_categoryid foreign key ( CategoryId ) references Category(CategoryId) on delete cascade;
go

alter table BookLibrary add constraint fk_booklibrary_libraryid foreign key ( LibraryId ) references Library(LibraryId) on delete cascade;
go

alter table BookLibrary add constraint fk_booklibrary_bookid foreign key ( BookId ) references Book(BookId) on delete cascade;
go

alter table Library add constraint fk_library_addressid foreign key ( AddressId ) references Address(AddressId) on delete cascade;
go

alter table Member add constraint fk_member_addressid foreign key ( AddressId ) references Address(AddressId) on delete cascade;
go

alter table Request add constraint fk_request_requestedby foreign key (RequestedBy) references Member(MemberId) on delete cascade;
go

alter table Request add constraint fk_request_bookid foreign key ( BookId ) references Book(BookId) on delete cascade;
go


--fill in some values
insert into Publisher (PublisherId, Name) values (1, 'Polirom');
go
insert into Publisher (PublisherId, Name) values (2, 'For you');
go
insert into Publisher (PublisherId, Name) values (3, 'Litera');
go
insert into Publisher (PublisherId, Name) values (4, 'Nemira');
go
insert into Publisher (PublisherId, Name) values (5, 'Rao');
go
insert into Publisher (PublisherId, Name) values (6, 'Trei');
go
insert into Publisher (PublisherId, Name) values (7, 'Asa');
go
insert into Publisher (PublisherId, Name) values (8, 'Art');
go



insert into Category (CategoryId, Name) values (1, 'Clasici');
go
insert into Category (CategoryId, Name) values (2, 'Fictiune');
go
insert into Category (CategoryId, Name) values (3, 'Fantasy');
go
insert into Category (CategoryId, Name) values (4, 'Crime, Thriller');
go
insert into Category (CategoryId, Name) values (5, 'Aventura');
go



insert into Book (BookId, Title, PublisherId, [Year], Price) values (1, 'De veghe in lanul de secara', 1, 2016, 17);
go
insert into Book (BookId, Title, PublisherId, [Year], Price) values (2, 'Fluturi', 2, 2016, 13);
go
insert into Book (BookId, Title, PublisherId, [Year], Price) values (3, 'Proza', 3, 2011, 8);
go
insert into Book (BookId, Title, PublisherId, [Year], Price) values (4, 'Portretul lui Dorian Grey', 1, 2013, 18);
go
insert into Book (BookId, Title, PublisherId, [Year], Price) values (5, 'Urzeala tronurilor', 4, 2017, 30);
go
insert into Book (BookId, Title, PublisherId, [Year], Price) values (6, 'Numele vantului', 5, 2017, 35);
go
insert into Book (BookId, Title, PublisherId, [Year], Price) values (7, 'Cartea vietii', 3, 2017, 24);
go
insert into Book (BookId, Title, PublisherId, [Year], Price) values (8, 'Chimista', 6, 2016, 33);
go
insert into Book (BookId, Title, PublisherId, [Year], Price) values (9, 'Baltagul', 7, 2014, 22);
go
insert into Book (BookId, Title, PublisherId, [Year], Price) values (10, 'Harry Potter vol. 5', 8, 2017, 64);
go
insert into Book (BookId, Title, PublisherId, [Year], Price) values (11, 'Puterea armelor', 6, 2017, 35);
go


insert into BookCategory (BookCategoryId, BookId, CategoryId) values (1, 1, 1);
go
insert into BookCategory (BookCategoryId, BookId, CategoryId) values (2, 2, 2);
go
insert into BookCategory (BookCategoryId, BookId, CategoryId) values (3, 3, 1);
go
insert into BookCategory (BookCategoryId, BookId, CategoryId) values (4, 4, 1);
go
insert into BookCategory (BookCategoryId, BookId, CategoryId) values (5, 5, 3);
go
insert into BookCategory (BookCategoryId, BookId, CategoryId) values (6, 6, 3);
go
insert into BookCategory (BookCategoryId, BookId, CategoryId) values (7, 7, 3);
go
insert into BookCategory (BookCategoryId, BookId, CategoryId) values (8, 8, 4);
go
insert into BookCategory (BookCategoryId, BookId, CategoryId) values (9, 9, 1);
go
insert into BookCategory (BookCategoryId, BookId, CategoryId) values (10, 10, 5);
go
insert into BookCategory (BookCategoryId, BookId, CategoryId) values (11, 11, 5);
go


insert into Author (AuthorId, FirstName, LastName, BirthDate) values (1, 'J.D.', 'Salinger', CONVERT(DATETIME, '1-JAN-1919') );
go
insert into Author (AuthorId, FirstName, LastName, BirthDate) values (2, 'Irina', 'Binder', CONVERT(DATETIME, '1-JAN-1978') );
go
insert into Author (AuthorId, FirstName, LastName, BirthDate) values (3, 'Mihai', 'Eminescu', CONVERT(DATETIME, '15-JAN-1850') );
go
insert into Author (AuthorId, FirstName, LastName, BirthDate) values (4, 'Oscar', 'Wilde', CONVERT(DATETIME, '16-OCT-1854') );
go
insert into Author (AuthorId, FirstName, LastName, BirthDate) values (5, 'George R.R.', 'Martin', CONVERT(DATETIME, '20-SEP-1948') );
go
insert into Author (AuthorId, FirstName, LastName, BirthDate) values (6, 'Patrick', 'Rothfuss', CONVERT(DATETIME, '6-JUN-1973') );
go
insert into Author (AuthorId, FirstName, LastName, BirthDate) values (7, 'Deborah', 'Harkness', CONVERT(DATETIME, '5-APR-1965') );
go
insert into Author (AuthorId, FirstName, LastName, BirthDate) values (8, 'Stephanie', 'Meyer', CONVERT(DATETIME, '24-DEC-1973') );
go
insert into Author (AuthorId, FirstName, LastName, BirthDate) values (9, 'Mihail', 'Sadoveanu', CONVERT(DATETIME, '5-NOV-1880') );
go
insert into Author (AuthorId, FirstName, LastName, BirthDate) values (10, 'J. K.', 'Rowling', CONVERT(DATETIME, '31-JUL-1965') );
go
insert into Author (AuthorId, FirstName, LastName, BirthDate) values (11, 'Joe', 'Abercrombie', CONVERT(DATETIME, '31-DEC-1974') );
go



insert into BookAuthor (BookAuthorId, BookId, AuthorId) values (1, 1, 1);
go
insert into BookAuthor (BookAuthorId, BookId, AuthorId) values (2, 2, 2);
go
insert into BookAuthor (BookAuthorId, BookId, AuthorId) values (3, 3, 3);
go
insert into BookAuthor (BookAuthorId, BookId, AuthorId) values (4, 4, 4);
go
insert into BookAuthor (BookAuthorId, BookId, AuthorId) values (5, 5, 5);
go
insert into BookAuthor (BookAuthorId, BookId, AuthorId) values (6, 6, 6);
go
insert into BookAuthor (BookAuthorId, BookId, AuthorId) values (7, 7, 7);
go
insert into BookAuthor (BookAuthorId, BookId, AuthorId) values (8, 8, 8);
go
insert into BookAuthor (BookAuthorId, BookId, AuthorId) values (9, 9, 9);
go
insert into BookAuthor (BookAuthorId, BookId, AuthorId) values (10, 10, 10);
go
insert into BookAuthor (BookAuthorId, BookId, AuthorId) values (11, 11, 11);
go



insert into Address (AddressId, Street, BuildingNumber, BuildingName, EntranceNumber, [Floor], ApartmentNumber, City, PostalCode, Country, OtherDetails)
	values (1, 'Strada Pacurari 4', null, null, null, null, null, 'Iasi', 700511, 'Romania', null);
go
insert into Address (AddressId, Street, BuildingNumber, BuildingName, EntranceNumber, [Floor], ApartmentNumber, City, PostalCode, Country, OtherDetails)
	values (2, 'Strada Pacurari 4B', 581, null, 'B', 2, 12, 'Iasi', 700531, 'Romania', null);
go
insert into Address (AddressId, Street, BuildingNumber, BuildingName, EntranceNumber, [Floor], ApartmentNumber, City, PostalCode, Country, OtherDetails)
	values (3, 'Bulevardul Independentei 2', 128, null, 'A', 1, 5, 'Iasi', 700540, 'Romania', null);
go
insert into Address (AddressId, Street, BuildingNumber, BuildingName, EntranceNumber, [Floor], ApartmentNumber, City, PostalCode, Country, OtherDetails)
	values (4, 'Strada Petre Tutea 9', null, null, null, null, null, 'Iasi', 700376, 'Romania', null);
go
insert into Address (AddressId, Street, BuildingNumber, BuildingName, EntranceNumber, [Floor], ApartmentNumber, City, PostalCode, Country, OtherDetails)
	values (5, 'Strada Clinicilor 2', null, null, null, null, null, 'Cluj-Napoca', 701400, 'Romania', null);
go


insert into Library (LibraryId, Name, AddressId) values (1, 'Biblioteca Centrala Universitara', 1);
go
insert into Library (LibraryId, Name, AddressId) values (2, 'Biblioteca Gheorghe Asachi', 4);
go
insert into Library (LibraryId, Name, AddressId) values (3, 'Biblioteca Centrala Universitara', 5);
go

insert into BookLibrary (BookLibraryId, LibraryId, BookId, Quantity) values (1, 1, 1, 5);
go
insert into BookLibrary (BookLibraryId, LibraryId, BookId, Quantity) values (2, 1, 2, 3);
go
insert into BookLibrary (BookLibraryId, LibraryId, BookId, Quantity) values (3, 1, 3, 10);
go
insert into BookLibrary (BookLibraryId, LibraryId, BookId, Quantity) values (4, 1, 4, 6);
go
insert into BookLibrary (BookLibraryId, LibraryId, BookId, Quantity) values (5, 1, 5, 25);
go
insert into BookLibrary (BookLibraryId, LibraryId, BookId, Quantity) values (6, 1, 6, 10);
go
insert into BookLibrary (BookLibraryId, LibraryId, BookId, Quantity) values (7, 1, 7, 4);
go
insert into BookLibrary (BookLibraryId, LibraryId, BookId, Quantity) values (8, 1, 8, 2);
go
insert into BookLibrary (BookLibraryId, LibraryId, BookId, Quantity) values (9, 2, 9, 5);
go
insert into BookLibrary (BookLibraryId, LibraryId, BookId, Quantity) values (10, 2, 10, 8);
go
insert into BookLibrary (BookLibraryId, LibraryId, BookId, Quantity) values (11, 2, 11, 4);
go
insert into BookLibrary (BookLibraryId, LibraryId, BookId, Quantity) values (12, 2, 2, 14);
go
insert into BookLibrary (BookLibraryId, LibraryId, BookId, Quantity) values (13, 2, 3, 7);
go
insert into BookLibrary (BookLibraryId, LibraryId, BookId, Quantity) values (14, 3, 11, 3);
go
insert into BookLibrary (BookLibraryId, LibraryId, BookId, Quantity) values (15, 3, 2, 5);
go


insert into Member (MemberId, FirstName, LastName, PermitNumber, AddressId, Gender, PhoneNumber, EmailAddress)
	values (1, 'Daniel', 'Ionescu', 'AGX-40194', 2, 'm', '0728406394', 'daniel.popescu@gmail.com');
go
insert into Member (MemberId, FirstName, LastName, PermitNumber, AddressId, Gender, PhoneNumber, EmailAddress)
	values (2, 'Mihai', 'Popescu', 'BCS-40329', 3, 'm', '0749281504', 'mihai.popescu@yahoo.com');
go

insert into Request (RequestId, RequestedBy, BookId, DateRequested, DateReturned) values (1, 1, 2, CONVERT(DATETIME, '15-MAY-2017'), CONVERT(DATETIME, '21-MAY-2017'));
go 
insert into Request (RequestId, RequestedBy, BookId, DateRequested, DateReturned) values (2, 1, 6, CONVERT(DATETIME, '21-SEP-2017'), CONVERT(DATETIME, '30-SEP-2017'));
go 
insert into Request (RequestId, RequestedBy, BookId, DateRequested, DateReturned) values (3, 1, 8, CONVERT(DATETIME, '18-DEC-2017'), null);
go 
insert into Request (RequestId, RequestedBy, BookId, DateRequested, DateReturned) values (4, 2, 5, CONVERT(DATETIME, '11-MAR-2017'), null);
go 
insert into Request (RequestId, RequestedBy, BookId, DateRequested, DateReturned) values (5, 2, 8, CONVERT(DATETIME, '14-JUN-2017'), CONVERT(DATETIME, '24-JUN-2017'));
go 

insert into Request (RequestId, RequestedBy, BookId, DateRequested, DateReturned) values (6, 1, 11, CONVERT(DATETIME, '12-AUG-2017'), CONVERT(DATETIME, '21-AUG-2017'));
go 
insert into Request (RequestId, RequestedBy, BookId, DateRequested, DateReturned) values (7, 1, 9, CONVERT(DATETIME, '13-OCT-2017'), null);
go 

/*
Biblioteca Centrala Universitara, Strada Pacurari 4, Iasi, 700511
1. ‘De veghe in lanul de secara’, J.D. Salinger,, Polirom, 2016 - Clasici; 17 lei; 5
copii
2. ‘Fluturi’, Irina Binder, For you, 2016 - Fictiune; 13 lei; 3 copii
3. ‘Proza’, Mihai Eminescu, Litera, 2011 - Clasici; 8 lei; Hardcover; 10 copii
4. ‘Portretul lui Dorian Grey’, Oscar Wilde, Polirom, 2013 - Clasici; 18 lei; 6 copii
5. ‘Urzeala tronurilor’, George R. R. Martin, Nemira, 2017 - Fantasy; 30 lei;
Hardcover; 25 copii
6. ‘Numele vantului’, Patrick Rothfuss, Rao, 2017 - Fantasy; 35 lei; 10 copii
7. ‘Cartea vietii’, Deborah Harkness, Litera, 2017 - Fantasy; 24 lei; 4 copii
8. ‘Chimista’, Stephanie Meyer, Trei, 2016 - Crime, Thriller; 33 lei; 2 copii
*/

/*
Members
1. Daniel Ionescu, Strada Pacurari 4B, bl. 581, sc. B, et. 2, ap. 12, Iasi,
0728406394, daniel.popescu@gmail.com; permis AGX-40194
a. Carti imprumutate
i. Fluturi; 15/05/2017 - 21/05/2017
ii. Numele vantului; 21/09/2017 - 30/09/2017
iii. Chimista; 18/12/2017 -
2. Mihai Popescu, Bulevardul Independentei 2, bl. 128, sc. A, et. 1, ap. 5, Iasi,
0749281504, mihai.popescu@yahoo.com; permis BCS-40329
a. Carti imprumutate
i. Urzeala tronurilor; 11/03/2017 -
ii. Chimista; 14/06/2017 - 24/06/2017
*/

/*
Biblioteca ‘Gheorghe Asachi’, Strada Petre Tutea 9, Iasi
1. ‘Baltagul’, Mihail Sadoveanu, Asa, 2014 - Clasici; 22 lei; 5 copii
2. ‘Harry Potter vol. 5’, J. K. Rowling, Art, 2017 - Aventura; 64 lei; 8 copii
3. ‘Puterea armelor’, Joe Abercrombie, Nemira, 2017, - Aventura; 35 lei; 4 copii
4. ‘Fluturi’, Irina Binder, For you, 2016 - Fictiune; 13 lei; 14 copii
5. ‘Proza’, Mihai Eminescu, Litera, 2011 - Clasici; 8 lei; Hardcover; 7 copii
*/

/*
Members
1. Daniel Ionescu, Strada Pacurari 4B, bl. 581, sc. B, et. 2, ap. 12, Iasi,
0728406394, daniel.popescu@gmail.com; permis FME-23043
a. Carti imprumutate
i. Puterea armelor; 12/08/2017 - 21/08/2017
ii. Baltagul; 13/10/2017 -
*/

/*
Biblioteca Centrala Universitara, Strada Clinicilor 2, Cluj Napoca
1. ‘Puterea armelor’, Joe Abercrombie, Nemira, 2017, - Aventura; 35 lei; 3 copii
2. ‘Fluturi’, Irina Binder, For you, 2016 - Fictiune; 13 lei; 5 copii
*/

