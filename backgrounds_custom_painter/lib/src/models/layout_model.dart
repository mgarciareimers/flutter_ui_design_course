import 'package:flutter/material.dart';

// Pages.
import 'package:backgrounds_design/src/pages/slideshow_page.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = SlideShowPage();

  Widget get currentPage => this._currentPage;

  set currentPage(Widget page) {
    this._currentPage = page;
    notifyListeners();
  }
}