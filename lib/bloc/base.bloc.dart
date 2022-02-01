import 'package:rxdart/subjects.dart';

enum UiState { idle, loading, done, error, redirect }
class BaseBloc{

  BehaviorSubject<UiState> _uiState = BehaviorSubject<UiState>.seeded(UiState.idle);
  Stream<UiState> get uiState => _uiState.stream;

  // Functions
  void setUiState(UiState uiState) {
    _uiState.add(uiState);
  }
  

}