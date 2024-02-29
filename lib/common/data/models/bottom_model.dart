import 'package:flutter/material.dart';

class BottomModel {
  String label;
  Icon activeIcon;
  Icon nonActiveIcon;
  BottomModel(this.activeIcon, this.nonActiveIcon, this.label);
}

class DataBottomModel {
  DataBottomModel._();
  static List<BottomModel> listBottomModel = [
    BottomModel(Icon(Icons.home), Icon(Icons.home_outlined), 'home'),
    BottomModel(Icon(Icons.search), Icon(Icons.search_outlined), 'search'),
    BottomModel(Icon(Icons.library_books), Icon(Icons.library_books_outlined),
        'library')
  ];
}
