import 'package:flutter/widgets.dart';
import 'package:physioapp/model/schedule/schedule.dart';

class ScheduleAppointmentController with ChangeNotifier{
  List<Schedule> _listSchedule = [];

  List<Schedule> get listSchedule => [..._listSchedule];

  void addSchedule({required Schedule schedule}) {
    _listSchedule.add(schedule);
    notifyListeners();
  }
}