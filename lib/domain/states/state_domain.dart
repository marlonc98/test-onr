import 'package:flutter/material.dart';

class StateDomain with ChangeNotifier {
  notifyAll() {
    notifyListeners();
  }
}
