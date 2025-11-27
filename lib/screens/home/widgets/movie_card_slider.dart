import 'package:flutter/material.dart';
import '../../../models/movie.dart';

class MovieCard extends StatefulWidget {
  final List<Movie> movies; // **THAY ĐỔI: Nhận List<Movie>**

  const MovieCard({super.key, required this.movies});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  // Biến state để kiểm soát tỷ lệ thu phóng khi chạm (tap)
  double _tapScale = 1.0;
  
  // Controller để kiểm soát PageView và theo dõi vị trí cuộn
  late PageController _pageController;
  
  // Hằng số cho animation
  static const Duration duration = Duration(milliseconds: 150);
  static const double activeTapScale = 0.95; // Tỷ lệ thu nhỏ khi nhấn

  @override
  void initState() {
    super.initState();
    // Cấu hình PageController: 80% chiều rộng màn hình cho mỗi thẻ
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _tapScale = activeTapScale;
    });
  }

  void _onTapUp(TapUpDetails details) {
    // Đợi một chút rồi khôi phục tỷ lệ ban đầu
    Future.delayed(duration, () {
      if (mounted) {
        setState(() {
          _tapScale = 1.0;
        });
      }
    });
  }
  
  void _onTapCancel() {
    setState(() {
      _tapScale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Tính toán chiều cao: 1/2 Chiều cao tổng body (trừ AppBar và Padding)
    final bodyHeight = MediaQuery.of(context).size.height - kToolbarHeight - MediaQuery.of(context).padding.top;
    final cardHeight = bodyHeight / 2;
    const cardWidth = 300.0; // Chiều rộng cố định cho card dọc

    return SizedBox(
      height: cardHeight + 48, // Chiều cao bao ngoài
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          final movie = widget.movies[index]; // Lấy Movie hiện tại
          
          // AnimatedBuilder để tạo hiệu ứng phóng to/thu nhỏ khi cuộn
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double positionScale = 1.0;
              
              // Chỉ tính toán tỷ lệ khi PageController đã gắn vào vị trí
              if (_pageController.position.haveDimensions) {
                // Lấy vị trí trang hiện tại
                double page = _pageController.page ?? index.toDouble();
                double diff = index - page; // Khoảng cách từ thẻ đến trung tâm
                
                // Giới hạn diff trong khoảng [-1.0, 1.0] để chỉ ảnh hưởng đến các thẻ lân cận
                if (diff > 1.0) diff = 1.0;
                if (diff < -1.0) diff = -1.0;

                // Công thức scaling: 1.0 (ở trung tâm) giảm xuống 0.85 (ở hai bên)
                positionScale = 1.0 - (diff.abs() * 0.1);
                if (positionScale < 0.9) positionScale = 0.9;
              }

              // Kết hợp hiệu ứng cuộn (positionScale) và hiệu ứng chạm (_tapScale)
              final double finalScale = positionScale * _tapScale;

              return Center( // Đảm bảo card được căn giữa
                child: GestureDetector(
                  onTapDown: _onTapDown,
                  onTapUp: _onTapUp,
                  onTapCancel: _onTapCancel,
                  onTap: () {
                    print('Movie Card clicked: ${movie.TenPhim}');
                    // Thêm logic điều hướng đến trang chi tiết phim tại đây
                  },
                  child: Transform.scale( // Áp dụng tỷ lệ cuối cùng
                    scale: finalScale,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 2.0),
                      height: cardHeight,
                      width: cardWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // --- 1. Poster Image Placeholder (Chiếm toàn bộ không gian) ---
                            Container(
                              color: movie.posterColor, // SỬ DỤNG MODEL movie hiện tại
                              child: Center(
                                child: Icon(Icons.movie_creation, size: 80, color: Colors.white.withOpacity(0.8)),
                              ),
                            ),

                            // --- 2. Overlay Age Rating (Góc nhỏ bên phải) ---
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.red[700],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  "${movie.DoTuoi}+", // SỬ DỤNG MODEL movie hiện tại
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),

                            // --- 3. Movie Details and Button (Bottom Overlay, không che poster chính) ---
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                // Sử dụng Gradient để làm nền chuyển màu, làm nổi bật text
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.0),
                                      Colors.black.withOpacity(0.85),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      movie.TenPhim, // SỬ DỤNG MODEL movie hiện tại
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Thời lượng: ${movie.ThoiLuong}', // SỬ DỤNG MODEL movie hiện tại
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    // Button Đặt vé
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          print('Button Đặt vé clicked for: ${movie.TenPhim}');
                                        },
                                        icon: const Icon(Icons.confirmation_number_sharp),
                                        label: const Text(
                                          'ĐẶT VÉ NGAY',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Colors.pinkAccent,
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}