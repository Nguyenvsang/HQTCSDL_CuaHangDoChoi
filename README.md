
# Tên đề tài: QUẢN LÝ HÀNG HOÁ CỦA CỬA HÀNG ĐỒ CHƠI
#### TRƯỜNG ĐẠI HỌC SƯ PHẠM KỸ THUẬT TP.HỒ CHÍ MINH, KHOA CÔNG NGHỆ THÔNG TIN
#### BỘ MÔN: HỆ QUẢN TRỊ CƠ SỞ DỮ LIỆU, ĐỒ ÁN CUỐI KỲ
#### MÃ SỐ LỚP HP: DBMS330284_03, GVHD: NGUYỄN THÀNH SƠN, HỌC KỲ: I – NĂM HỌC: 2022 – 2023
#### NHÓM THỰC HIỆN: NHÓM 7
### DANH SÁCH THÀNH VIÊN THAM GIA ĐỀ TÀI
#### Phan Quan Huy	20110652
#### Hoàng Thị Mỹ Huyền  20110337
#### Nguyễn Văn Sang  20110711
#### Nguyễn Văn Thuận (Nhóm trưởng)	20110732 
### NỀN TẢNG THỰC HIỆN
Đồ án được thực hiện sử dụng:
-	Ngôn ngữ lập trình C#.
-	UI Framework Windows Forms.
-	Công nghệ ADO.NET
-	Cơ sở dữ liệu: SQL Server 
### MÔ HÌNH
Đồ án được triển khai trên C# sử dụng mô hình kiến trúc 3 lớp (Three-Tier Architecture):
-	Lớp Data Access Layer: kết nối và truy xuất cơ sở dữ liệu.
- Lớp Business Logic Layer: nhận yêu cầu từ lớp Presentation Layer và truy cập xuống lớp DataAccessLayer để lấy thông tin đưa lên Presentation Layer.
- Lớp Presentation Layer: hiển thị giao diện, tương tác với người dùng.
### GIỚI THIỆU ĐỀ TÀI
Một cửa hàng vừa mới được xây dựng chuyên buôn bán các loại đồ chơi. Cửa hàng tập trung kinh doanh một số mặt hàng, sản phẩm của các thương hiệu khác nhau. Với số lượng hàng hoá đa dạng, phong phú về thể loại và giá cả, việc quản lý cửa hàng là điều không hề đơn giản, thậm chí, nó có thể gây ra nhầm lẫn, sai sót và thất thoát hàng hoá lẫn tiền bạc. Do đó, để thực hiện quản lý, kiểm soát chặt chẽ và đạt được sự phục vụ tốt nhất, cần thiết kế một ứng dụng quản lý hàng hoá có trong cửa hàng. Sau khi tiến hành khảo sát, đây là những thông tin cửa hàng cần quản lý:
- Cửa hàng nhập về nhiều loại đồ chơi khác nhau được quản lý trong danh mục đồ chơi, mỗi loại đồ chơi sẽ có mã loại đồ chơi tương ứng với tên loại đồ chơi.
- Thông tin về mỗi đồ chơi bao gồm mã đồ chơi, tên đồ chơi, mã loại đồ chơi, mã nhà sản xuất, mã ngăn kệ và giá thành hiện tại bán ra.
- Các loại đồ chơi sẽ được nhập trực tiếp từ các hãng sản xuất. Mỗi hãng sản xuất sẽ có mã nhà sản xuất, tên nhà sản xuất và tên nước.
- Sau khi nhập hàng hoá xong, nhân viên sẽ sắp xếp hàng hoá theo từng vị trí trên các ngăn kệ. Cửa hàng có nhiều ngăn kệ được phân biệt với nhau thông qua mã ngăn kệ và vị trí cụ thể.
- Cửa hàng sẽ thuê các nhân viên thực hiện công việc kiểm kê, bán hàng. Mỗi nhân viên có duy nhất một mã nhân viên, CCCD hoặc CMND đồng thời có các thông tin cá nhân như tên nhân viên, năm sinh, quê quán, lương, ngày vào làm, trạng thái đang làm việc hay đã nghỉ.
- Việc quản lý buôn bán trong cửa hàng bao gồm việc nhập và bán sản phẩm thông qua hóa đơn nhập và hóa đơn bán. Mỗi hóa đơn nhập có duy nhất một mã hóa đơn và có thêm thông tin về ngày nhập, mã nhân viên nhập. Mỗi hóa đơn bán phân biệt thông qua mã hóa đơn, ngày xuất, mã nhân viên bán.
- Đồng thời để quản lý rõ ràng hơn, ứng với từng hóa đơn nhập là chi tiết hóa đơn nhập được phân biệt qua mã nhập và có thêm các thông tin mã hoá đơn nhập, mã đồ chơi, số lượng, giá nhập, tổng tiền. Tương tự vậy ứng với từng hóa đơn bán là chi tiết hóa đơn bán được phân biệt qua mã bán và có thêm các thông tin mã hoá đơn bán, mã đồ chơi, số lượng, giá bán, tổng tiền.
