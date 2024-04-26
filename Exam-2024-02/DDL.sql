drop database if exists quanlymuonsach;
create database if not exists quanlymuonsach;
use quanlymuonsach;
create table if not exists Category
(
    id     int primary key auto_increment,
    name   varchar(100) not null,
    status tinyint default 1 check ( status in (0, 1) )
);
create table if not exists Author
(
    id        int primary key auto_increment,
    name      varchar(100) not null unique,
    totalBook int default 0
);
create table if not exists Book
(
    id          int primary key auto_increment,
    name        varchar(150) not null,
    status      tinyint default 1 check ( status in (0, 1) ),
    price       float        not null check ( price >= 100000 ),
    createdDate date    default (curdate()),
    categoryId  int          not null,
    authorId    int          not null
);
create table if not exists Customer
(
    id          int primary key auto_increment,
    name        varchar(150) not null,
    email       varchar(150) not null unique check ( email like '%@gmail.com'
        or email like '%@facebook.com' or email like '%@bachkhoa-aptech.edu.vn'),
    phone       varchar(50)  not null unique,
    address     varchar(255),
    createdDate date default (curdate()),
    gender      tinyint check ( gender in (0, 1, 2) ),
    birthday    date         not null
);
create table if not exists Ticket
(
    id         int primary key auto_increment,
    customerId int not null,
    status     tinyint  default 1 check ( status in (0, 1, 2, 3) ),
    ticketDate datetime default (curdate())
);
create table if not exists TicketDetail
(
    ticketId     int   not null,
    bookId       int   not null,
    quantity     int   not null check ( quantity > 0 ),
    depositPrice float not null,
    rentCost     float not null,
    constraint primary key (ticketId, bookId)
);
alter table book
    add constraint foreign key (categoryId) references category (id),
    add constraint foreign key (authorId) references author (id);
alter table ticket
    add constraint foreign key (customerId) references customer (id);
alter table ticketdetail
    add constraint foreign key (ticketId) references ticket (id),
    add constraint foreign key (bookId) references book (id);
DELIMITER //
create trigger when_insert_to_ticketdetail
    before insert
    on ticketdetail
    for each row
begin
    set new.depositPrice = (select price from book where new.bookId = book.id);
    set new.rentCost = 0.1 * (select price from book where new.bookId = book.id);
end //
DELIMITER ;

