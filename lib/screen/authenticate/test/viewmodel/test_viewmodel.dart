import 'package:mobx/mobx.dart';
part 'test_viewmodel.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;


abstract class _TestViewModelBase with Store {

  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNUmber() {
    number++;
  }
}