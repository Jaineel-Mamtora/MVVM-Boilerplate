import 'package:flutter/material.dart';

import '../locator.dart';
import '../enums/viewstate.dart';
import '../enums/connectivity_status.dart';
import '../services/connectivity_service.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  final _connectivityService = locator<ConnectivityService>();

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  void setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  void setupConnectivity() {
    _connectivityService.connectionStatusController.stream.listen((event) {
      if (event == ConnectivityStatus.Offline) {
        setState(ViewState.NoConnection);
      } else {
        setState(ViewState.Idle);
      }
    });
  }
}
