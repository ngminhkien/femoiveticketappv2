import 'package:flutter/material.dart';
import '/models/voucher.dart';

class VoucherSlider extends StatelessWidget {
  final List<Voucher> vouchers;

  const VoucherSlider({super.key, required this.vouchers});

  void _handleSeeAllClick() {
    print('Button Xem tất cả Voucher đã được nhấn!');
  }

  void _handleSaveVoucher(String maVoucher) {
    print('Button Lưu Voucher đã được nhấn: $maVoucher');
    // Thêm logic lưu voucher vào bộ sưu tập của người dùng tại đây
  }

  @override
  Widget build(BuildContext context) {
    // Lấy chiều cao của PromotionsSlider (~ screenHeight / 6) và chia đôi
    final screenHeight = MediaQuery.of(context).size.height;
    final desiredHeight = (screenHeight / 6) / 2; // Khoảng 1/12 body

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Tiêu đề Voucher và Nút Xem tất cả
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Voucher',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextButton(
                onPressed: _handleSeeAllClick,
                child: const Text(
                  'Xem tất cả',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Danh sách trượt ngang của Voucher
        SizedBox(
          height: desiredHeight + 10, // Cộng thêm chút khoảng đệm
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: vouchers.length,
            itemBuilder: (context, index) {
              final voucher = vouchers[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 16.0 : 8.0,
                  right: index == vouchers.length - 1 ? 16.0 : 8.0,
                ),
                child: InkWell(
                  onTap: () {
                    print('Clicked on Voucher: ${voucher.MaVoucher}');
                  },
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    width: 180.0, // Chiều rộng cố định cho voucher nhỏ
                    decoration: BoxDecoration(
                      color: voucher.backgroundColor.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: Stack( // Sử dụng Stack để đặt nút Lưu ở góc
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              voucher.GiaGiam, // SỬ DỤNG THUỘC TÍNH MỚI: GiaGiam
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Mã: ${voucher.MaVoucher}', // SỬ DỤNG THUỘC TÍNH MỚI: MaVoucher
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        
                        // --- Button Lưu (Save) ---
                        Positioned(
                          top: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () => _handleSaveVoucher(voucher.MaVoucher),
                            child: Icon(
                              Icons.bookmark_border, // Icon Lưu chưa được chọn
                              color: Colors.white.withOpacity(0.8),
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}