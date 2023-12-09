import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  final List<String> _names = ['John', 'Alan', 'Joanne', 'Jamal', 'Joe']; // List
  final Map<String, String> _fullNames = { // Data Map Each Name
    'John': 'John Weak',
    'Alan': 'Alan Becker',
    'Joanne': 'Joanne Hellington',
    'Jamal': 'Jamal Hussein',
    'Joe': 'Joe Mama',
  };
  int _selectedIndex = 0; // Init index list

  List<String> get names => _names;
  String? get selectedFullName => _fullNames[_names[_selectedIndex]];

  void setSelectedIndex(int index) { // Selected index
    _selectedIndex = index;
    notifyListeners();
  }
}