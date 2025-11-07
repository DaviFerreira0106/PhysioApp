import 'package:flutter/material.dart';
import 'package:physioapp/model/user/patient/patient_user.dart';

class PairWithPatient with ChangeNotifier {
  static final List<PatientUser> _listPatientPair = [];

  List<PatientUser> get listPatientPair => [..._listPatientPair];

  void addPairPatient({required PatientUser userPatient}) {
    _listPatientPair.add(userPatient);
    notifyListeners();
  }

  void removePairPatient({required PatientUser user}) {
    _listPatientPair.removeWhere(
      (element) => element.id == user.id,
    );
    notifyListeners();
  }
}
