# Yêu cầu dữ liệu mẫu ( Sử dụng lệnh SQL để thêm mới ):
use quanlymuonsach;
# 1.	Bảng Category ít nhất là 5 bản ghi dữ liệu phù hợp
insert into category (name, status)
VALUES ('Horror', 1),
       ('Fiction', 1),
       ('Psychological', 1),
       ('Adventure', 1),
       ('Mystery', 1),
       ('SelfHelp', 0),
       ('History', 0);
# 2.	Bảng Author ít nhất là 5 bản ghi dữ liệu phù hợp
insert into author (name, totalBook)
VALUES ('Alpha',5),
       ('Beta',3),
       ('Sigma',6),
       ('Chad',3),
       ('Omega',7),
       ('Delta',1);
# 3.	Bảng Book Ít nhất 15 bản ghi dữ liệu phù hợp
insert into book (name, status, price, createdDate, categoryId, authorId)
VALUES ('Harry Potter', 1, 200000, curdate(), 2, 1),
       ('Your name', 1, 150000, curdate(), 1, 1),
       ('Hotarubi no mori e', 1, 180000, curdate(), 3, 2),
       ('Hazy moon', 1, 190000, curdate(), 7, 2),
       ('Ghostwire Tokyo', 1, 300000, curdate(), 4, 3),
       ('Dragon Blood', 1, 100000, curdate(), 5, 3),
       ('A song of ice and fire', 1, 220000, curdate(), 3, 4),
       ('The non womanly face of war', 1, 200000, curdate(), 4, 4),
       ('Wuthering Heights', 1, 210000, curdate(), 1, 5),
       ('The great Gatsby', 1, 220000, curdate(), 5, 5),
       ('GTO', 1, 350000, curdate(), 3, 1),
       ('In the cafe of lost youth', 1, 200000, curdate(), 2, 3),
       ('Shadow of the wind', 1, 215000, curdate(), 1, 5),
       ('The lost symbol', 1, 200000, curdate(), 7, 5),
       ('Berserk', 1, 200000, curdate(), 3, 6);
# 4.	Bảng Customer ít nhất 3 bản ghi dữ liệu phù hợp
insert into customer (name, email, phone, address, createdDate, gender, birthday)
VALUES ('Khach hang 1', 'email1@gmail.com','phone1','add1',curdate(),1,'1990-12-12'),
       ('Customer 2', 'email2@facebook.com','phone2','add2','2024-1-1',1,'1992-2-2'),
       ('User 3', 'email3@bachkhoa-aptech.edu.vn','phone3','add3',curdate(),0,'1991-3-3'),
       ('Buyer 4', 'email4@gmail.com','phone4','add4','2023-1-2',2,'1994-4-4');
# 5.	Bảng Ticket ít nhất 3 bản ghi dữ liệu phù hợp,
# mỗi phiếu mượn có mượn ít nhất 2 cuốn sách với số lượng khác nhau
insert into ticket (customerId, status, ticketDate)
VALUES (1, 1, curdate()),
       (2, 2, '2024-3-1'),
       (3, 3, '2023-12-12'),
       (4, 0, '2024-3-4');
insert into ticketdetail (ticketId, bookId, quantity, depositPrice, rentCost)
VALUES (1, 1, 3, 100, 100),
       (1, 2, 2, 100, 100),
       (1, 3, 1, 100, 100),
       (2, 5, 6, 100, 100),
       (2, 6, 4, 100, 100),
       (2, 7, 1, 100, 100),
       (2, 10, 10, 100, 100),
       (3, 12, 2, 100, 100),
       (3, 15, 8, 100, 100),
       (3, 1, 4, 100, 100),
       (4, 4, 3, 100, 100),
       (4, 11, 3, 100, 100),
       (4, 1, 1, 100, 100),
       (4, 2, 2, 100, 100),
       (4, 3, 3, 100, 100);