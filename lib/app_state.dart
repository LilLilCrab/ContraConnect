import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  /// Tracks whether the search is active
  bool _searchIsActive = false;
  bool get searchIsActive => _searchIsActive;
  set searchIsActive(bool value) {
    _searchIsActive = value;
  }
}
