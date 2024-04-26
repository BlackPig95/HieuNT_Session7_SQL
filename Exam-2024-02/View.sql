# Yêu cầu 2 ( Sử dụng lệnh SQL tạo View )
# 1.	View v_getBookInfo thực hiện lấy ra danh sách các
# Book được mượn nhiều hơn 3 cuốn
use quanlymuonsach;
create view v_getBookInfo
as
select b.name
from book b
         join ticketdetail t on b.id = t.bookId
group by t.bookId
having count(t.bookId) >= 3;
select *
from v_getBookInfo;
# 2.	View v_getTicketList hiển thị danh sách Ticket gồm:
# Id, TicketDate, Status, CusName, Email, Phone,TotalAmount
# (Trong đó TotalAmount là tổng giá trị tiện phải trả,
# cột Status nếu = 0 thì hiển thị Chưa trả,
# = 1 Đã trả, = 2 Quá hạn, 3 Đã hủy)
create view v_getTicketList
as
select t.Id,
       t.TicketDate,
       case t.Status
           when 0 then 'Chưa trả'
           when 1 then 'Đã trả'
           when 2 then 'Quá hạn'
           else 'Đã hủy'
           end                     status,
       c.name                      CusName,
       c.Email,
       c.Phone,
       (td.rentCost * td.quantity) TotalAmount
from ticket t
         join customer c on t.customerId = c.id
         join ticketdetail td on t.id = td.ticketId;
select * from v_getTicketList;