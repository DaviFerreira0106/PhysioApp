import 'package:flutter/material.dart';

enum FormSchedule {
  firstForm,
  secondForm,
}

class ScheduleAppointmentForm with ChangeNotifier{
  FormSchedule _currentForm = FormSchedule.firstForm;

  FormSchedule get currentForm => _currentForm;

  void toggleForm({required FormSchedule valueForm}) {
    _currentForm = valueForm;
    notifyListeners();
  }
}