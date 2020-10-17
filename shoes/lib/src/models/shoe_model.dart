import 'package:flutter/material.dart';

class ShoeModel with ChangeNotifier {
  String _assetImage = 'assets/img/blue.png';
  double _size = 9;

  String get assetImage => this._assetImage;
  double get size => this._size;

  set assetImage(String value) {
    this._assetImage = value;

    notifyListeners();
  }

  set size(double value) {
    this._size = value;

    notifyListeners();
  }
}