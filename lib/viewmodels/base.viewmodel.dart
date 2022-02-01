// ViewModel
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:stacked/stacked.dart';

class MyBaseViewModel extends BaseViewModel {
  BuildContext viewContext;


  BehaviorSubject<bool> _refreshPageListener = BehaviorSubject<bool>();
  Stream<bool> get refreshPage => _refreshPageListener.stream;


  void setRefreshPage(bool show) {
    _refreshPageListener.add(show);
  }


}
