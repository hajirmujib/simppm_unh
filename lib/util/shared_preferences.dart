import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:simppm_unh/model/userModel.dart';

class UserPreferences {
  Future<bool> savUser(UserModel user) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("id_users", user.idUsers);
    preferences.setString("nama", user.nama);
    preferences.setString("nidn", user.nidn);
    preferences.setString("foto", user.foto);
    preferences.setString("email", user.email);
    preferences.setString("level", user.level);

    // ignore: deprecated_member_use
    return preferences.commit();
  }

  Future<UserModel> getUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String idUsers = preferences.getString("id_users");
    String nama = preferences.getString("nama");
    String nidn = preferences.getString("nidn");
    String foto = preferences.getString("foto");
    String email = preferences.getString("email");
    String level = preferences.getString("level");

    return UserModel(
      idUsers: idUsers,
      nama: nama,
      nidn: nidn,
      foto: foto,
      email: email,
      level: level,
    );
  }

  void removeUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.remove("id_users");
    // preferences.remove("nama");
    // preferences.remove("nidn");
    // preferences.remove("foto");
    // preferences.remove("email");
    // preferences.remove("level");
    preferences.setString("id_users", null);
    preferences.setString("nama", null);
    preferences.setString("nidn", null);
    preferences.setString("foto", null);
    preferences.setString("email", null);
    preferences.setString("level", null);

    // ignore: deprecated_member_use
    preferences.commit();
  }
}
