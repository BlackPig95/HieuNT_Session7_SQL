# Yêu cầu truy vấn dữ liệu
use quanlymuonsach;
# Yêu cầu 1 ( Sử dụng lệnh SQL để truy vấn cơ bản ):
# 1.	Lấy ra danh sách Book có sắp xếp giảm dần theo Price gồm
# các cột sau:
# Id, Name, Price, Status, CategoryName, AuthorName, CreatedDate
select b.Id, b.Name, b.Price, b.Status, c.name CategoryName, a.name AuthorName, b.CreatedDate
from book b
         join category c on b.categoryId = c.id
         join author a on b.authorId = a.id
order by b.price desc;

# 2.	Lấy ra danh sách Category gồm:
# Id, Name, TotalProduct, Status
# (Trong đó cột Status nếu = 0, Ẩn, = 1 là Hiển thị )
select c.Id, c.Name, count(b.categoryId) TotalBook, c.Status
from category c
         join book b on c.id = b.categoryId
where c.status = 1
group by b.categoryId;
# 3.	Truy vấn danh sách Customer gồm:
# Id, Name, Email, Phone, Address, CreatedDate, Gender, BirthDay, Age
# (Age là cột suy ra từ BirthDay,
# Gender nếu = 0 là Nam, 1 là Nữ,2 là khác )
select Id,
       Name,
       Email,
       Phone,
       Address,
       CreatedDate,
       case Gender
           when 0 then 'nam'
           when 1 then 'nu'
           else 'khac'
           end                            Sex,
       BirthDay,
       (year(curdate()) - year(birthday)) Age
from customer;
# 4.	Truy vấn xóa Author chưa có sách nào
select author.name
from author
where totalBook = 0;
# 5.	Cập nhật Cột ToalBook trong bảng Auhor =
# Tổng số Book của mỗi Author theo Id của Author
update author join book
set author.totalBook = (select count(authorId)
                        from book
                        where author.id = book.authorId
                        group by authorId);