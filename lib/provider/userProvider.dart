import 'package:flutter/material.dart';
import 'package:simppm_unh/model/userModel.dart';

class UserProvider with ChangeNotifier {
  UserModel _user = new UserModel();
  UserModel get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
