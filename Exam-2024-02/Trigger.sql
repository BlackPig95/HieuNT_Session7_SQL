# Yêu cầu 4 ( Sử dụng lệnh SQL tạo Trigger )
use quanlymuonsach;
# 1.	Tạo trigger tr_Check_total_book_author sao cho khi
# thêm Book nếu Author đang tham chiếu có tổng số sách > 5
# thì không cho thêm mưới và thông báo
# “Tác giả này có số lượng sách đạt tới giới hạn 5 cuốn,
# vui long chọn tác giả khác”
DELIMITER //
create trigger tr_Check_total_book_author
    before insert
    on book
    for each row
begin
    if ((select count(authorId) from book b where b.authorId = new.authorId group by authorId) >= 5)
    then
        signal sqlstate '45000' set message_text
            = 'Tác giả này có số lượng sách đạt tới giới hạn 5 cuốn,
vui long chọn tác giả khác';
    end if;
end //
DELIMITER ;
call addBookInfo('book trigger3',1,
                 150000, curdate()
     ,1,5);
# 2.	Tạo trigger tr_Update_TotalBook khi thêm mới Book thì cập nhật
# cột TotalBook rong bảng Author = tổng của Book theo AuthorId
DELIMITER //
create trigger tr_Update_TotalBook
    after insert
    on book
    for each row
begin
    update author join book
    set author.totalBook = (select count(authorId)
                            from book
                            where author.id = book.authorId
                            group by authorId);
end //
DELIMITER ;
call addBookInfo('book trigger author',1,150000, curdate()
    ,1,6);