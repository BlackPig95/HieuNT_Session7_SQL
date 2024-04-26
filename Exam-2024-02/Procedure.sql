# Yêu cầu 3 ( Sử dụng lệnh SQL tạo thủ tục Stored Procedure )
use quanlymuonsach;
# 1.	Thủ tục addBookInfo thực hiện thêm mới Book,
# khi gọi thủ tục truyền đầy đủ các giá trị của bảng Book
# ( Trừ cột tự động tăng )
DELIMITER //
create procedure addBookInfo(name_in varchar(150), status_in tinyint,
                             price_in float, date_in date, catId_in int, authorId_in int)
begin
    insert into book
        (name, status, price, createdDate, categoryId, authorId)
    VALUES (name_in, status_in, price_in, date_in, catId_in, authorId_in);
end //
DELIMITER ;
call addBookInfo('sach procedure', 1, 100000, curdate(), 2, 1);
# a.	Thủ tục getTicketByCustomerId hiển thị danh sách đơn hàng
# của khách hàng theo Id khách hàng gồm:
# Id, TicketDate, Status, TotalAmount
# (Trong đó cột Status nếu =0 Chưa trả, = 1  Đã trả, = 2 Quá hạn, 3 đã hủy ),
# Khi gọi thủ tục truyền vào id cuả khách hàng
DELIMITER //
create procedure getTicketByCustomerId(in cusId_in int)
begin
    select td.ticketId,
           t.TicketDate,
           case t.Status
               when 0 then 'Chưa trả'
               when 1 then 'Đã trả'
               when 2 then 'Quá hạn'
               else 'Đã hủy'
               end                     Status,
           (td.quantity * td.rentCost) TotalAmount
    from ticket t
             join ticketdetail td on t.id = td.ticketId
    where t.customerId = cusid_in;
end //
DELIMITER ;
call getTicketByCustomerId(1);
# 2.	Thủ tục getBookPaginate lấy ra danh sách sản phẩm
# có phân trang gồm:
# Id, Name, Price, Sale_price, Khi gọi thủ tuc truyền vào limit và page
DELIMITER //
create procedure getBookPaginate(page_in int, limit_in int)
begin
    declare offset int;
    set offset = (page_in-1) * limit_in;
    select b.Id, b.Name, b.Price from book b
    limit offset, limit_in;
end //
DELIMITER ;
call getBookPaginate(2,5);