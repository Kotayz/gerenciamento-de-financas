import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class InitialUserInfoController extends Controller {
  int radioValue = -1;

  InitialUserInfoController() : super();

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  void handleRadioChange(int value) {
    print(radioValue);
    radioValue = value;
    print(radioValue);
    refreshUI();
  }
}