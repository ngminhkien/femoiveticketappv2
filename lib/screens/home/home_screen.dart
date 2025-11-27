import 'package:flutter/material.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/promo_slider.dart';
import 'widgets/movie_card_slider.dart';
import 'widgets/custom_bottom_appbar.dart';
import 'widgets/voucher_slider.dart';
import '../../models/movie.dart';
import '../../models/promotion.dart';
import '../../models/voucher.dart';

// Dữ liệu mẫu cho Movie
final List<Promotion> mockPromotions = [
  Promotion(title: 'Phim Hot: Siêu Anh Hùng', color: Colors.redAccent),
  Promotion(title: 'Ưu Đãi: Giảm 20% Vé', color: Colors.green),
  Promotion(title: 'Phim Hot: Tình Yêu Vượt Thời Gian', color: Colors.blueAccent),
  Promotion(title: 'Ưu Đãi: Mua 1 Tặng 1', color: Colors.orange),
  Promotion(title: 'Phim Hot: Phiêu Lưu Kì Thú', color: Colors.purple),
];

final List<Movie> mockMovies = [
  const Movie(
    MaPhim: 'MV002',
    TenPhim: 'Hành Tinh Lửa: Khởi Nguồn',
    NgayCongChieu: '01/11/2025',
    ThoiLuong: 140,
    MoTa: 'Cuộc chiến sinh tồn trên hành tinh xa lạ bị bao phủ bởi lửa.',
    DienVien: 'Matt Damon, Jessica Chastain',
    AnhURL: 'https://placeholder.com/image/mv002.jpg',
    TrailerURL: 'https://youtube.com/trailer/mv002',
    DoTuoi: 13,
    TrangThai: 'NOW SHOWING',
    posterColor: Color(0xFFE65100), // Màu cam đậm
  ),
  const Movie(
    MaPhim: 'MV003',
    TenPhim: 'Bí Mật Đêm Trăng: Phần 3',
    NgayCongChieu: '20/12/2025',
    ThoiLuong: 120,
    MoTa: 'Chương cuối của loạt phim kinh dị siêu nhiên, khám phá bí ẩn dưới ánh trăng.',
    DienVien: 'Jenna Ortega, David Harbour',
    AnhURL: 'https://placeholder.com/image/mv003.jpg',
    TrailerURL: 'https://youtube.com/trailer/mv003',
    DoTuoi: 0,
    TrangThai: 'COMING SOON',
    posterColor: Color(0xFF388E3C), // Màu xanh lá đậm
  ),
  const Movie(
    MaPhim: 'MV004',
    TenPhim: 'Thám Tử Mới: Vụ Án Đồng Xu',
    NgayCongChieu: '25/11/2025',
    ThoiLuong: 110,
    MoTa: 'Một thám tử trẻ tuổi đối mặt với vụ án hóc búa liên quan đến đồng xu cổ.',
    DienVien: 'Ryan Gosling, Ana de Armas',
    AnhURL: 'https://placeholder.com/image/mv004.jpg',
    TrailerURL: 'https://youtube.com/trailer/mv004',
    DoTuoi: 18,
    TrangThai: 'NOW SHOWING',
    posterColor: Color(0xFF303030), // Màu xám đậm
  ),
  // Bổ sung 7 phim mới
  const Movie(
    MaPhim: 'MV005',
    TenPhim: 'Nữ Hoàng Băng Giá: Hồi Sinh',
    NgayCongChieu: '05/01/2026',
    ThoiLuong: 95,
    MoTa: 'Hành trình mới của nữ hoàng Elsa để cứu vương quốc khỏi mối đe dọa băng giá.',
    DienVien: 'Idina Menzel, Kristen Bell',
    AnhURL: 'https://placeholder.com/image/mv005.jpg',
    TrailerURL: 'https://youtube.com/trailer/mv005',
    DoTuoi: 0,
    TrangThai: 'COMING SOON',
    posterColor: Color(0xFF29B6F6), // Màu xanh dương nhạt
  ),
  const Movie(
    MaPhim: 'MV006',
    TenPhim: 'Lưới Điện Tử: Cuộc Chiến Ảo',
    NgayCongChieu: '10/12/2025',
    ThoiLuong: 130,
    MoTa: 'Một hacker bị mắc kẹt trong thế giới ảo và phải chiến đấu để thoát ra.',
    DienVien: 'Keanu Reeves, Carrie-Anne Moss',
    AnhURL: 'https://placeholder.com/image/mv006.jpg',
    TrailerURL: 'https://youtube.com/trailer/mv006',
    DoTuoi: 16,
    TrangThai: 'NOW SHOWING',
    posterColor: Color(0xFF7B1FA2), // Màu tím đậm
  ),
  const Movie(
    MaPhim: 'MV007',
    TenPhim: 'Đường Đến Ngôi Sao: Ước Mơ',
    NgayCongChieu: '28/11/2025',
    ThoiLuong: 115,
    MoTa: 'Câu chuyện về những người trẻ theo đuổi ước mơ trở thành ca sĩ nổi tiếng.',
    DienVien: 'Emma Stone, Ryan Gosling',
    AnhURL: 'https://placeholder.com/image/mv007.jpg',
    TrailerURL: 'https://youtube.com/trailer/mv007',
    DoTuoi: 13,
    TrangThai: 'NOW SHOWING',
    posterColor: Color(0xFFEF6C00), // Màu cam sáng
  ),
  const Movie(
    MaPhim: 'MV008',
    TenPhim: 'Kẻ Săn Đêm: Ánh Sáng Cuối Đường',
    NgayCongChieu: '03/01/2026',
    ThoiLuong: 125,
    MoTa: 'Một sát thủ chuyên nghiệp phải đối mặt với lương tâm khi nhận nhiệm vụ cuối cùng.',
    DienVien: 'Denzel Washington, Angelina Jolie',
    AnhURL: 'https://placeholder.com/image/mv008.jpg',
    TrailerURL: 'https://youtube.com/trailer/mv008',
    DoTuoi: 18,
    TrangThai: 'COMING SOON',
    posterColor: Color(0xFFB71C1C), // Màu đỏ đậm
  ),
  const Movie(
    MaPhim: 'MV009',
    TenPhim: 'Cậu Bé Thiên Tài',
    NgayCongChieu: '18/12/2025',
    ThoiLuong: 105,
    MoTa: 'Câu chuyện cảm động về một cậu bé với trí thông minh siêu việt.',
    DienVien: 'Chris Evans, Mckenna Grace',
    AnhURL: 'https://placeholder.com/image/mv009.jpg',
    TrailerURL: 'https://youtube.com/trailer/mv009',
    DoTuoi: 0,
    TrangThai: 'NOW SHOWING',
    posterColor: Color(0xFF00796B), // Màu xanh ngọc đậm
  ),
  const Movie(
    MaPhim: 'MV010',
    TenPhim: 'Thế Giới Cổ Đại: Mùa Hè Biến Mất',
    NgayCongChieu: '07/01/2026',
    ThoiLuong: 110,
    MoTa: 'Một nhóm nhà khoa học du hành về quá khứ để chứng kiến sự kiện lịch sử.',
    DienVien: 'Leonardo DiCaprio, Scarlett Johansson',
    AnhURL: 'https://placeholder.com/image/mv010.jpg',
    TrailerURL: 'https://youtube.com/trailer/mv010',
    DoTuoi: 13,
    TrangThai: 'COMING SOON',
    posterColor: Color(0xFFFDD835), // Màu vàng
  ),
  const Movie(
    MaPhim: 'MV011',
    TenPhim: 'Bí Ẩn Hành Lang Thứ 7',
    NgayCongChieu: '30/11/2025',
    ThoiLuong: 100,
    MoTa: 'Một bộ phim kinh dị tâm lý lấy bối cảnh tại một bệnh viện bỏ hoang.',
    DienVien: 'Cillian Murphy, Anne Hathaway',
    AnhURL: 'https://placeholder.com/image/mv011.jpg',
    TrailerURL: 'https://youtube.com/trailer/mv011',
    DoTuoi: 16,
    TrangThai: 'NOW SHOWING',
    posterColor: Color(0xFF455A64), // Màu xám xanh
  ),
];

final List<Voucher> mockVouchers = [
  const Voucher(
    MaVoucher: 'VC001',
    TenVoucher: 'Giảm giá cuối tuần',
    GiaGiam: '10.000 VNĐ',
    MoTa: 'Áp dụng cho mọi loại vé từ 17h thứ 6 đến hết chủ nhật.',
    NgayTao: '20/11/2025',
    NgayHet: '30/11/2025',
    SoLuong: 150,
    TrangThai: 'Active',
    backgroundColor: Color(0xFFFBC02D), // Màu vàng đậm
  ),
  const Voucher(
    MaVoucher: 'VC002',
    TenVoucher: 'Miễn phí giao hàng',
    GiaGiam: 'Miễn Phí Giao Hàng',
    MoTa: 'Áp dụng cho đơn hàng trên 200.000 VNĐ.',
    NgayTao: '10/11/2025',
    NgayHet: '05/12/2025',
    SoLuong: 500,
    TrangThai: 'Active',
    backgroundColor: Color(0xFF00ACC1), // Màu xanh ngọc
  ),
  const Voucher(
    MaVoucher: 'VC003',
    TenVoucher: 'Ưu đãi Đêm Khuya',
    GiaGiam: '50% Giá Vé',
    MoTa: 'Giảm 50% cho suất chiếu sau 22h.',
    NgayTao: '01/11/2025',
    NgayHet: '29/11/2025',
    SoLuong: 80,
    TrangThai: 'Hết hạn',
    backgroundColor: Color(0xFFE53935), // Màu đỏ
  ),
  const Voucher(
    MaVoucher: 'VC004',
    TenVoucher: 'Đón thành viên mới',
    GiaGiam: '30% Đơn Đầu',
    MoTa: 'Giảm 30% cho lần đặt vé đầu tiên của thành viên mới.',
    NgayTao: '25/11/2025',
    NgayHet: '25/12/2025',
    SoLuong: 1000,
    TrangThai: 'Active',
    backgroundColor: Color(0xFF8E24AA), // Màu tím
  ),
  const Voucher(
    MaVoucher: 'VC005',
    TenVoucher: 'Giờ vàng ưu đãi',
    GiaGiam: 'Tặng 1 Nước',
    MoTa: 'Tặng kèm 1 chai nước ngọt khi mua bắp rang bơ cỡ lớn.',
    NgayTao: '15/11/2025',
    NgayHet: '15/12/2025',
    SoLuong: 300,
    TrangThai: 'Active',
    backgroundColor: Color(0xFF43A047), // Màu xanh lá
  ),
];

class BookingHomePage extends StatefulWidget {
  const BookingHomePage({super.key});

  @override
  State<BookingHomePage> createState() => _BookingHomePageState();
}

class _BookingHomePageState extends State<BookingHomePage> {
  int _selectedIndex = 0; // State để theo dõi mục được chọn

  // Hàm xử lý khi nhấn vào một mục
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('Selected Index: $index');
      // Logic điều hướng (nếu có) sẽ được thêm vào đây sau
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SỬ DỤNG WIDGET APP BAR TÙY CHỈNH
      appBar: const CustomAppBar(),
      
      // NỘI DUNG CHÍNH (Sử dụng Column để sắp xếp theo chiều dọc)
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Widget trượt ngang (Promotions Slider)
            PromotionsSlider(promotions: mockPromotions), // TRUYỀN DỮ LIỆU

            const Text(
              'Phim Đang Chiếu',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            
            // 2. Movie Card (Chiếm ~1/2 Body và có hiệu ứng Scale)
            MovieCard(movies: mockMovies), // TRUYỀN DỮ LIỆU

            // 2. Widget trượt ngang cho Voucher
            VoucherSlider(vouchers: mockVouchers), // TRUYỀN DỮ LIỆU MẪU VOUCHER

            // 3. Khu vực nội dung còn lại của trang
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(24.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Thông tin chi tiết khác',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Phần này nằm bên dưới Movie Card.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      
      // BOTTOM NAVIGATION BAR (SỬ DỤNG WIDGET TÙY CHỈNH)
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}