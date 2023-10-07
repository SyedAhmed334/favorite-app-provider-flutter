import 'package:flutter/cupertino.dart';

class FavoriteProvider extends ChangeNotifier {
  List<int> _selectedItem = [];
  List<int> get selectedItem => _selectedItem;

  void setSelectedItem(int item) {
    _selectedItem.add(item);
    notifyListeners();
  }
}
