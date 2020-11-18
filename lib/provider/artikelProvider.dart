import 'package:flutter/material.dart';
import 'package:simppm_unh/model/artikelModel.dart';

class ArtikelProvider with ChangeNotifier {
  // ArtikelModel _artikel = ArtikelModel();
  // ArtikelModel get artikel => _artikel;

  // void setArtikel(ArtikelModel artikel) {
  //   _artikel = artikel;
  //   notifyListeners();
  // }
  List<ArtikelModel> _artikel;
  List<ArtikelModel> get listArtikel => _artikel;

  void setlistArtikel(List<ArtikelModel> val) {
    _artikel = val;
    notifyListeners();
  }
}
