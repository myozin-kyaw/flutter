import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> carts = [];
  late String? selectedItem;

  void addItem(Map<String, dynamic> item) {
    carts.add(item);
    notifyListeners();
  }

  void removeItem(Map<String, dynamic> item) {
    carts.remove(item);
    notifyListeners();
  }

  void setSelectedItem(String selected) {
    selectedItem = selected;
    notifyListeners();
  }
}
