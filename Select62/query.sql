use quanlydiemsv;
# BÀI TẬP LUYỆN TẬP CÂU LỆNH TRUY VẤN
# 1. Liệt kê danh sách sinh viên, gồm các thông tin sau:
# Mã sinh viên, Họ sinh viên, Tên sinh viên, Học bổng.
# Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên tăng dần
select sv.MaSV, sv.HoSV, sv.TenSV, sv.HocBong
from dmsv sv
order by MaSV;
# 2. Danh sách các sinh viên gồm thông tin sau:
# Mã sinh viên, họ tên sinh viên, Phái, Ngày sinh.
# Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.
select sv.MaSV                        `Mã sinh viên`,
       concat(sv.HoSV, ' ', sv.TenSV) `họ tên sinh viên`,
       sv.Phai                        `Phái`,
       sv.NgaySinh                    `Ngày sinh`
from dmsv sv
order by Phai;
# 3. Thông tin các sinh viên gồm:
# Họ tên sinh viên, Ngày sinh, Học bổng. Thông tin sẽ được sắp xếp
# theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
select concat(sv.HoSV, ' ', sv.TenSV) `Họ tên sinh viên`,
       sv.NgaySinh                    `Ngày sinh`,
       sv.HocBong                     `Học bổng`
from dmsv sv
order by NgaySinh, HocBong desc;
# 4. Danh sách các môn học có tên bắt đầu bằng chữ T,
# gồm các thông tin: Mã môn, Tên môn, Số tiết.
select mh.MaMH, mh.TenMH, mh.SoTiet
from dmmh mh
where mh.TenMH like 'T%';
# 5. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là
# I, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Phái.
select concat(HoSV, ' ', TenSV) hoten, NgaySinh, Phai
from dmsv
where TenSV like '%I';
# 6. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N,
# gồm các thông tin: Mã khoa, Tên khoa.
select MaKhoa, TenKhoa
from dmkhoa
where TenKhoa like '_N%';
# 7. Liệt kê những sinh viên mà họ có chứa chữ Thị.
select *
from dmsv
where HoSV like '%thi%';
# 8. Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000,
# gồm các thông tin:
# Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng.
# Danh sách sẽ được sắp xếp theo thứ tự Mã khoa giảm dần
select MaSV, concat(HoSV, ' ', TenSV) hoten, MaKhoa, HocBong
from dmsv
where HocBong > 100000
order by MaKhoa desc;
# 9. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội,
# gồm các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.
select concat(HoSV, ' ', TenSV) hoten, MaKhoa, NoiSinh, HocBong
from dmsv
where NoiSinh = 'Ha Noi'
  and HocBong >= 150000;
# 10.Danh sách các sinh viên của khoa Anh văn và khoa Vật lý,
# gồm các thông tin: Mã sinh viên, Mã khoa, Phái.
select sv.MaSV, k.MaKhoa, sv.Phai
from dmsv sv
         join dmkhoa k on sv.MaKhoa = k.MaKhoa
where k.TenKhoa = 'Anh Van'
   or k.TenKhoa = 'Vat ly';
# 11.Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày
# 05/06/1992 gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học
# bổng.
select MaSV, NgaySinh, NoiSinh, HocBong
from dmsv
where NgaySinh between '1991-1-1' and '1992-6-5';
# 12.Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các
# thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.
select MaSV, NgaySinh, Phai, MaKhoa
from dmsv
where HocBong between '80000' and '150000';
# 13.Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45,
# gồm các thông tin: Mã môn học, Tên môn học, Số tiết.
select MaMH, TenMH, SoTiet
from dmmh
where SoTiet > 30
  and SoTiet < 45;
# 14.Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học,
# gồm các thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
select MaSV,
       concat(HoSV, ' ', TenSV) hoten,
       k.TenKhoa,
       sv.Phai
from dmkhoa k
         join dmsv sv on k.MaKhoa = sv.MaKhoa
where sv.Phai = 'nam'
  and k.TenKhoa in ('Anh van', 'Tin hoc');
# 15.Liệt kê những sinh viên nữ, tên có chứa chữ N
select *
from dmsv
where TenSV like '%N%'
  and Phai = 'nu';
# 16.Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02,
# gồm các thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
select HoSV, TenSV, NoiSinh, NgaySinh
from dmsv
where NoiSinh = 'ha noi'
  and month(NgaySinh) = 2;
# 17.Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm:
# Họ tên sinh viên, Tuổi,Học bổng.
select concat(HoSV, ' ', TenSV)           hoten,
       (year(curdate()) - year(NgaySinh)) tuoi,
       HocBong
from dmsv
where year(curdate()) - year(NgaySinh) > 20;
# 18.Danh sách những sinh viên có tuổi từ 20 đến 25,
# thông tin gồm: Họ tên sinh viên, Tuổi, Tên khoa.
select concat(HoSV + ' ' + TenSV)         hoten,
       (year(curdate()) - year(NgaySinh)) tuoi,
       TenKhoa
from dmsv
         join dmkhoa on dmsv.MaKhoa = dmkhoa.MaKhoa
where year(curdate()) - year(NgaySinh) between 20 and 25;
# 19.Danh sách sinh viên sinh vào mùa xuân năm 1990,
# gồm các thông tin: Họ tên sinh viên,Phái, Ngày sinh.
select concat(HoSV, ' ', TenSV) hoten,
       Phai,
       NgaySinh
from dmsv
where month(NgaySinh) between 2 and 4
  and year(NgaySinh) = 1990;
# 20.Cho biết thông tin về mức học bổng của các sinh viên, gồm:
# Mã sinh viên, Phái, Mã khoa, Mức học bổng.
# Trong đó, mức học bổng sẽ hiển thị là “Học bổng cao”
# nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển
# thị là “Mức trung bình”
select MaSV,
       Phai,
       MaKhoa,
       case
           when HocBong > 500000
               then 'Học bổng cao'
           else 'Mức trung bình'
           end muchocbong
from dmsv;
# 21.Cho biết tổng số sinh viên của toàn trường
select count(MaSV)
from dmsv;
# 22.Cho biết tổng sinh viên và tổng sinh viên nữ.
select count(MaSV)                           tongsinhvien,
       count(case Phai when 'nu' then 1 end) svnu
#         sum(if(phai = 'nu', 1, 0))
from dmsv;
# 23.Cho biết tổng số sinh viên của từng khoa.
select MaKhoa, count(MaSV)
from dmsv
group by MaKhoa;
# 24.Cho biết số lượng sinh viên học từng môn.
select kq.MaMH, count(kq.MaSV)
from dmsv sv
         join ketqua kq on sv.MaSV = kq.MaSV
group by kq.MaMH;
# 25.Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có
# trong bảng kq)
select count(distinct kq.MaMH)
from ketqua kq;
# 26.Cho biết tổng số học bổng của mỗi khoa.
select MaKhoa, count(HocBong)
from dmsv
where HocBong > 0
group by MaKhoa;
# 27.Cho biết học bổng cao nhất của mỗi khoa.
select MaKhoa, max(HocBong)
from dmsv
group by MaKhoa;
# 28.Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.
select MaKhoa, Phai, count(Phai)
from dmsv
group by MaKhoa, Phai
order by MaKhoa;
#Cach 2
select MaKhoa, sum(if(phai = 'nam', 1, 0)) nam, sum(if(phai = 'nu', 1, 0)) nu
from dmsv
group by MaKhoa, Phai;
# 29.Cho biết số lượng sinh viên theo từng độ tuổi.
select count(MaSV), year(curdate()) - year(NgaySinh) tuoi
from dmsv
group by tuoi;
# 30.Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường.
select year(NgaySinh) namsinh
from dmsv
group by year(NgaySinh)
having count(MaSV) >= 2;
# 31.Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường.
select NoiSinh namsinh
from dmsv
group by NoiSinh
having count(MaSV) >= 2;
# 32.Cho biết những môn nào có trên 3 sinh viên dự thi.
select MaMH
from ketqua
group by MaMH
having count(distinct MaSV) >= 3;
# 33.Cho biết những sinh viên thi lại trên 2 lần.
select distinct sv.MaSV, sv.TenSV, LanThi
from ketqua kq
         join dmsv sv on kq.MaSV = sv.MaSV
where LanThi >= 2;
# 34.Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0
select sv.TenSV, sv.Phai
from ketqua kq
         join dmsv sv on kq.MaSV = sv.MaSV
where LanThi = 1
  and Phai = 'nam'
group by sv.tensv
having avg(kq.Diem) >= 7.0;
# 35.Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.
select sv.MaSV, sv.TenSV
from ketqua kq
         join dmsv sv on kq.MaSV = sv.MaSV
where LanThi >= 2
group by sv.MaSV
having count(MaMH) >= 2;
# 36.Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam
select MaKhoa, count(case Phai when 'nam' then 1 end) sosvnam
from dmsv
group by MaKhoa
having sosvnam >= 1;
# 37.Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000.
select MaKhoa
from dmsv
where HocBong between 200000 and 300000
group by MaKhoa
having count(MaSV) >= 2;
# 38.Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn
# trong lần thi 1.
select MaMH, LanThi, sum(if(diem >= 5.0, 1, 0)) dau, sum(if(diem < 5.0, 1, 0)) rot
from ketqua
where LanThi = 1
group by MaMH;
#Cach 2
select distinct MaMH,
                LanThi,
                case
                    when diem >= 5.0 then 'dau'
                    when diem < 5.0 then 'rot' end status,
                count(Diem)                        soluong
from ketqua
where LanThi = 1
group by mamh, status
order by MaMH;
# 39.Cho biết sinh viên nào có học bổng cao nhất.
select max(TenSV), max(HocBong)
from dmsv;
select TenSV, HocBong
from dmsv
where HocBong >= ALL (select HocBong from dmsv);
# 40.Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất.
select max(sv.TenSV), max(kq.Diem)
from ketqua kq
         join dmsv sv on kq.MaSV = sv.MaSV
where LanThi = 1
  and kq.MaMH = 2;
select TenSV, Diem
from ketqua kq
         join dmsv sv on kq.MaSV = sv.MaSV
where kq.MaMH = 4
  and kq.Diem >= All (select Diem from ketqua where MaMH = kq.MaMH)
  and kq.LanThi = 1;
# 41.Cho biết sinh viên khoa anh văn có tuổi lớn nhất.
select max(TenSV), max(year(curdate()) - year(NgaySinh)) tuoi
from dmsv
where MaKhoa = 'av';
select TenSV, (year(curdate()) - year((NgaySinh))) tuoi
from dmsv
where (year(curdate()) - year(NgaySinh))
    >= all (select year(curdate()) - year(NgaySinh)
            from dmsv)
  and MaKhoa = 'av';
# 42.Cho biết khoa nào có đông sinh viên nhất.
select MaKhoa, count(MaKhoa)
from dmsv
group by MaKhoa;
# 43.Cho biết khoa nào có đông nữ nhất.
select sv.MaKhoa, count(Phai)
from dmsv sv
where Phai = 'nu'
group by MaKhoa
having count(Phai) >= all (select count(phai)
                           from dmsv
                           where phai = 'nu'
                           group by MaKhoa);
select max(MaKhoa), max(tongso)
from (select MaKhoa, count(dmsv.Phai) tongso
      from dmsv
      where Phai = 'nu'
      group by MaKhoa) sub;
# 44.Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất.
select max(MaMH), max(rot)
from (select MaMH, count(Diem) rot
      from ketqua
      where Diem < 5.0
        and LanThi = 1
      group by MaMH) sub;
select MaMH, count(Diem)
from ketqua
where Diem < 5.0
  and LanThi = 1
group by mamh
having count(diem) >= all
       (select count(Diem)
        from ketqua
        where Diem < 5.0
          and LanThi = 1
        group by MaMH);
# 45.Cho biết sinh viên không học khoa anh văn có điểm thi
# môn văn phạm lớn hơn điểm thi văn của sinh viên học khoa anh văn.
# select distinct sv.TenSV, sv.MaKhoa
# from dmsv sv
#          join dmkhoa k on sv.MaKhoa = k.MaKhoa
#          join ketqua kq on sv.MaSV = kq.MaSV
# where sv.MaKhoa <> 'av'
#   and kq.Diem >= All (select diem
#                       from ketqua
#                                join dmmh mh on mh.MaMH = ketqua.MaMH
#                       where mh.TenMH like 'van pham');
select distinct sv.TenSV, sv.MaKhoa
from dmsv sv
         join ketqua kq on sv.MaSV = kq.MaSV
         join dmmh mh on kq.MaMH = mh.MaMH
where sv.MaKhoa <> 'av'
  and mh.TenMH like 'van pham'
  and Diem >= Any (select subkq.diem
                   from ketqua subkq
                            join dmsv subsv
                                 on subkq.MaSV = subsv.MaSV
                            join dmmh submh on subkq.MaMH = submh.MaMH
                   where subsv.MaKhoa like 'av'
                     and submh.TenMH like 'van pham');
# 46.Cho biết sinh viên có nơi sinh cùng với Hải.
select TenSV, NoiSinh
from dmsv
where NoiSinh = (select NoiSinh from dmsv where TenSV = 'hai');
# 47.Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của
# sinh viên thuộc khoa anh văn
select TenSV, HocBong
from dmsv
where HocBong > all (select HocBong from dmsv where MaKhoa = 'av');
# 48.Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên
# học khóa anh văn
select TenSV, HocBong
from dmsv
where HocBong > any (select HocBong from dmsv where MaKhoa = 'av');
# 49. ho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2
# lớn hơn tất cả điểm thi lần 1 môn cơ sở dữ liệu của những sinh viên khác.
select TenSV, diem, LanThi
from ketqua kq
         join dmsv sv on kq.MaSV = sv.MaSV
where kq.diem >
    all (select Diem from ketqua where MaMH = 2 and LanThi = 1)
  and LanThi = 2;
# 50.Cho biết những sinh viên đạt điểm cao nhất trong từng môn.
select MaMH, TenSV, Diem
from dmsv sv
         join ketqua kq
              on sv.MaSV = kq.MaSV
where kq.diem >= all (select max(Diem)
                      from ketqua
                      where kq.MaMH = MaMH
                      group by MaMH);
# 51.Cho biết những khoa không có sinh viên học.
select k.MaKhoa, k.TenKhoa
from dmsv sv
         join dmkhoa k on sv.MaKhoa = k.MaKhoa
where k.MaKhoa not in (select MaKhoa from dmsv);
# 52.Cho biết sinh viên chưa thi môn cơ sở dữ liệu.
select distinct sv.MaSV, sv.TenSV
from ketqua kq
         join dmsv sv on kq.MaSV = sv.MaSV
where kq.MaMH <> 5
  and kq.MaSV not in (select MaSV
                      from ketqua
                      where MaMH = 5);
# 53.Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2.
select sv.MaSV, sv.TenSV, LanThi
from ketqua kq
         join dmsv sv on kq.MaSV = sv.MaSV
where LanThi = 2
  and LanThi <> 1;
# 54.Cho biết môn nào không có sinh viên khoa anh văn học.
select distinct MaMH
from ketqua kq
         join dmsv sv on kq.MaSV = sv.MaSV
where kq.MaMH not in (select distinct MaMH
                      from ketqua
                               join dmsv on ketqua.MaSV = dmsv.MaSV
                      where dmsv.MaKhoa like 'av');
# 55.Cho biết những sinh viên khoa anh văn chưa học môn văn phạm.
select TenSV
from dmsv
where MaKhoa like 'av'
  and tensv not in
      (select sv.TenSV
       from dmmh mh
                join ketqua kq on mh.MaMH = kq.MaMH
                join dmsv sv on kq.MaSV = sv.MaSV
       where mh.TenMH like 'van pham'
         and sv.MaKhoa like 'av');
# 56.Cho biết những sinh viên không rớt môn nào.
select TenSV
from dmsv
where tensv not in
      (select distinct sv.TenSV
       from ketqua kq
                join dmsv sv on kq.MaSV = sv.MaSV
       where kq.LanThi >= 2);
# 57.Cho biết những sinh viên học khoa anh văn có
# học bổng và những sinh viên chưa bao giờ rớt.
select MaKhoa, TenSV, HocBong
from dmsv
where tensv not in
      (select distinct sv.TenSV
       from ketqua kq
                join dmsv sv on kq.MaSV = sv.MaSV
       where kq.LanThi >= 2)
union
select MaKhoa, TenSV, HocBong
from dmsv
where MaKhoa like 'av'
  and dmsv.HocBong > 0;
# 58.Cho biết khoa nào có đông sinh viên nhận học bổng nhất
# và khoa nào khoa nào có ít sinh viên nhận học bổng nhất.
select MaKhoa, count(TenSV) as sohocbong
from dmsv
where HocBong > 0
group by makhoa
having sohocbong >= all
       (select count(TenSV)
        from dmsv sv
        where HocBong > 0
        group by sv.MaKhoa)
union
select MaKhoa, count(TenSV) as sohocbong
from dmsv
where HocBong > 0
group by makhoa
having sohocbong <= all
       (select count(TenSV)
        from dmsv sv
        where HocBong > 0
        group by sv.MaKhoa);
# 59.Cho biết 3 sinh viên có học nhiều môn nhất.
select distinct sv.masv, sv.TenSV, count(distinct kq.MaMH) somonhoc
from ketqua kq
         join dmsv sv on kq.MaSV = sv.MaSV
group by kq.MaSV
order by somonhoc desc
limit 3;
# 60.Cho biết những môn được tất cả các sinh viên theo học.
select dmmh.MaMH, TenMH
from ketqua
         join dmmh on ketqua.MaMH = dmmh.MaMH
group by MaMH
having count(distinct MaSV) = (select count(dmsv.MaSV) from dmsv);
# 61.Cho biết những sinh viên học những môn giống sinh viên
# có mã số A02 học.
select distinct sv.MaSV, sv.TenSV
from dmmh mh
         join ketqua kq on mh.MaMH = kq.MaMH
         join dmsv sv on kq.MaSV = sv.MaSV
where mh.MaMH in (select distinct MaMH
                  from ketqua
                  where MaSV = 'a02')
  and kq.MaSV <> 'a02';
# 62.Cho biết những sinh viên học những môn bằng đúng những môn mà sinh
# viên A02 học.
                        #chỉ đếm những môn học có xuất hiện trong a02
select distinct sv.MaSV, sv.TenSV, count(distinct kq.MaMH) somonhoc
from dmmh mh
         join ketqua kq on mh.MaMH = kq.MaMH
         join dmsv sv on kq.MaSV = sv.MaSV
where mh.MaMH in
      #Chọn ra danh sách các môn học của a02
      (select distinct MaMH
                  from ketqua
                  where MaSV = 'a02')
  and kq.MaSV <> 'a02'
group by sv.MaSV, sv.TenSV
#so sánh số đếm của 2 bên
having somonhoc = (select count(distinct MaMH)
                   from ketqua
                   where MaSV = 'a02');


