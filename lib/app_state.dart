import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

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

  List<OfficeDatatypeStruct> _officeAppState = [];
  List<OfficeDatatypeStruct> get officeAppState => _officeAppState;
  set officeAppState(List<OfficeDatatypeStruct> value) {
    _officeAppState = value;
  }

  void addToOfficeAppState(OfficeDatatypeStruct value) {
    officeAppState.add(value);
  }

  void removeFromOfficeAppState(OfficeDatatypeStruct value) {
    officeAppState.remove(value);
  }

  void removeAtIndexFromOfficeAppState(int index) {
    officeAppState.removeAt(index);
  }

  void updateOfficeAppStateAtIndex(
    int index,
    OfficeDatatypeStruct Function(OfficeDatatypeStruct) updateFn,
  ) {
    officeAppState[index] = updateFn(_officeAppState[index]);
  }

  void insertAtIndexInOfficeAppState(int index, OfficeDatatypeStruct value) {
    officeAppState.insert(index, value);
  }

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? value) {
    _startDate = value;
  }

  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? value) {
    _endDate = value;
  }

  DateTime? _initdate;
  DateTime? get initdate => _initdate;
  set initdate(DateTime? value) {
    _initdate = value;
  }

  DateTime? _today;
  DateTime? get today => _today;
  set today(DateTime? value) {
    _today = value;
  }
}
