import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomAppBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        // Trang chủ
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        // Phim rạp
        BottomNavigationBarItem(
          icon: Icon(Icons.theaters),
          label: 'Phim rạp',
        ),
        // Thông báo
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Thông báo',
        ),
        // Khác
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Khác',
        ),
      ],
      currentIndex: selectedIndex, // Mục hiện tại được chọn (truyền từ State)
      selectedItemColor: Colors.indigo, // Màu khi được chọn
      unselectedItemColor: Colors.grey, // Màu khi không được chọn
      onTap: onItemTapped, // Xử lý khi nhấn (truyền từ State)
      type: BottomNavigationBarType.fixed, // Giữ cho các mục không bị nhảy khi nhấn
      backgroundColor: Colors.white,
      elevation: 8.0, // Thêm độ nổi cho thanh điều hướng dưới
    );
  }
}