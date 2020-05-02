import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class InitialUserInfoController extends Controller {
  int radioValue = -1;
  CarouselController carouselController = CarouselController();
  int currentStep = 0;

  InitialUserInfoController() : super();

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  void handleRadioChange(int value) {
//    print(radioValue);
    radioValue = value;
//    print(radioValue);
    refreshUI();
  }

  void onStepChanged(index, reason) {
    currentStep = index;
    refreshUI();
  }

  void nextPage() {
    carouselController.nextPage();
    refreshUI();
  }
}