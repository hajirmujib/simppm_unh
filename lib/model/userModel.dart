class UserModel {
  UserModel({
    this.idUsers,
    this.nama,
    this.nidn,
    this.foto,
    this.email,
    this.level,
  });

  final String idUsers;
  final String nama;
  final String nidn;
  final String foto;
  final String email;
  final String level;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        idUsers: json['id_users'],
        nama: json['nama'],
        nidn: json['nidn'],
        foto: json['foto'],
        email: json['email'],
        level: json['level']);
  }
  Map<String, dynamic> toJson() => {
        "id_users": idUsers,
        "nama": nama,
        "nidn": nidn,
        "foto": foto,
        "email": email,
        "level": level,
      };
}
