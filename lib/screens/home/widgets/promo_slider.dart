import 'package:flutter/material.dart';
import '../../../models/promotion.dart';

class PromotionsSlider extends StatelessWidget {
  final List<Promotion> promotions; // Nhận dữ liệu từ bên ngoài

  const PromotionsSlider({super.key, required this.promotions});

  @override
  Widget build(BuildContext context) {
    // Lấy chiều cao của màn hình để tính toán 1/6 body
    final screenHeight = MediaQuery.of(context).size.height;
    // Chiều cao mong muốn là khoảng 1/6 chiều cao tổng thể của Scaffold body
    final desiredHeight = screenHeight / 6;

    // Sử dụng PageController để điều khiển việc cuộn theo trang (snapping)
    final PageController pageController = PageController(
      viewportFraction: 0.85, // Mỗi trang chiếm 85% chiều rộng màn hình, để lộ thẻ kế tiếp
      initialPage: 0,
    );

    return SizedBox(
      height: desiredHeight + 20, // Chiều cao cho Slider
      child: PageView.builder( // Vẫn sử dụng PageView.builder cho tính năng snapping và căn giữa
        controller: pageController,
        itemCount: promotions.length,
        itemBuilder: (context, index) {
          final promo = promotions[index];
          
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () {
                  print('Clicked on: ${promo.title}');
                },
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  height: desiredHeight, // Đảm bảo chiều cao được giữ nguyên
                  decoration: BoxDecoration(
                    color: promo.color.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.movie_filter, color: Colors.white, size: 28),
                      const SizedBox(height: 10),
                      Text(
                        promo.title, // SỬ DỤNG MODEL
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}