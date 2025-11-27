import 'package:flutter/material.dart';

class Movie {
  final String MaPhim; // MaPhim
  final String TenPhim; // TenPhim
  final String NgayCongChieu; // NgayCongChieu
  final int ThoiLuong; // ThoiLuong
  final String MoTa; // MoTa
  final String DienVien; // DienVien
  final String AnhURL; // AnhURL (Placeholder URL)
  final String TrailerURL; // TrailerURL (Placeholder URL)
  final int DoTuoi; // DoTuoi
  final String TrangThai; // TrangThai
  final Color posterColor; // Dùng màu nền thay cho ảnh poster

  const Movie({
    required this.MaPhim,
    required this.TenPhim,
    required this.NgayCongChieu,
    required this.ThoiLuong,
    required this.MoTa,
    required this.DienVien,
    required this.AnhURL,
    required this.TrailerURL,
    required this.DoTuoi,
    required this.TrangThai,
    required this.posterColor,
  });
}