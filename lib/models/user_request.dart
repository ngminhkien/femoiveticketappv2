class UserRequest {
  String hoTen;
  String gioiTinh;
  String ngaySinh;
  String sdt;
  String email;
  String matKhau;
  String? anhURL;

  UserRequest({
    required this.hoTen,
    required this.gioiTinh,
    required this.ngaySinh,
    required this.sdt,
    required this.email,
    required this.matKhau,
    this.anhURL,
  });

  Map<String, dynamic> toJson() => {
    "hoTen": hoTen,
    "gioiTinh": gioiTinh,
    "ngaySinh": ngaySinh,
    "sdt": sdt,
    "email": email,
    "matKhau": matKhau,
    "anhURL": anhURL
  };
}
