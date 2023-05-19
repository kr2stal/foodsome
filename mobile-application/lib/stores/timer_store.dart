import 'package:mobx/mobx.dart';

// Include generated file
part 'timer_store.g.dart';

// This is the class used by rest of your codebase
class TimerStore = _TimerStore with _$TimerStore;

// The store-class
abstract class _TimerStore with Store {
  @observable
  DateTime now = DateTime.now();

  @observable
  DateTime test = DateTime.now();

  @action
  setRefreshTime(DateTime newDateTime) async {
    this.test = newDateTime;
  }
}