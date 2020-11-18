import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simppm_unh/model/artikelModel.dart';
import 'package:simppm_unh/model/userModel.dart';
import 'package:simppm_unh/provider/artikelProvider.dart';
import 'package:simppm_unh/provider/userProvider.dart';
import 'package:simppm_unh/services/apiServices.dart';
import 'dart:convert';

import 'package:simppm_unh/util/shared_preferences.dart';

enum Status { NotLoggedIn, LoggedIn }

class AuthProvider with ChangeNotifier {
  BaseUrl api = BaseUrl();
  Status _loggedStatus = Status.LoggedIn;

  ArtikelProvider artikelProvider = ArtikelProvider();

  Status get loggedInStatus => _loggedStatus;

  // BuildContext get context => null;

  statusLogin(int value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("value", value);
    notifyListeners();
    // ignore: deprecated_member_use
    return preferences.commit();
  }

  getLogin() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    var value = preferences.getInt("value");

    _loggedStatus = value == 1 ? Status.LoggedIn : Status.NotLoggedIn;
    notifyListeners();
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password
    };

    // notifyListeners();

    http.Response response = await http.post(
      api.url + "/login.php?",
      body: loginData,

      // body: {'email': email, 'password': password},
    );

    // int value = responseData['value'];
    // String message = responseData['message'];
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      // List<UserModel> data = [];
      // for (var i = 0; i < responseData.length; i++) {
      //   var user = UserModel.fromJson(responseData[i]);
      //   data.add(user);
      // }
      UserModel authUser = UserModel.fromJson(responseData);
      // Provider.of<UserProvider>(context).setUser(authUser);
      // _loggedStatus = Status.LoggedIn;
      UserProvider().setUser(authUser);
      UserPreferences().savUser(authUser);
      statusLogin(1);
      // print(responseData);

      notifyListeners();
      result = {'status': true, 'message': 'Succesfully', 'user': authUser};

      // print(data);
      print(responseData);
      print(_loggedStatus);
    } else {
      _loggedStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }

    return result;
  }

  Future logOut() async {
    UserPreferences().removeUser();
    _loggedStatus = Status.NotLoggedIn;
    notifyListeners();
  }

  Future<List<ArtikelModel>> fetchArtikel() async {
    final response = await http.get(api.url + "/readArtikel.php");

    // final Map<String,dynamic> responseData = json.decode(response.body);
    List responseData = json.decode(response.body);

    // ArtikelModel authArtikel = ArtikelModel.fromJson(responseData);
    // ArtikelProvider().setArtikel(authArtikel);
    // notifyListeners();

    List<ArtikelModel> data = [];
    for (var i = 0; i < responseData.length; i++) {
      var artikel = ArtikelModel.fromJson(responseData[i]);
      data.add(artikel);
    }
    artikelProvider.setlistArtikel(data);

    // ArtikelProvider().setlistArtikel(data);
    // print(artikelProvider.listArtikel[3].atk_judul);
    return artikelProvider.listArtikel;
  }
}
