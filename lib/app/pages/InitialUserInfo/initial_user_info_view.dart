import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'initial_user_info_controller.dart';

void run() => runApp(InitialUserInfoPage());

class InitialUserInfoPage extends View {
  @override
  State<StatefulWidget> createState() => InitialUserInfoPageState();
}

class InitialUserInfoPageState extends ViewState<InitialUserInfoPage, InitialUserInfoController> {
  InitialUserInfoPageState() : super(InitialUserInfoController());

  @override
  Widget buildPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem Vindo'),
      )
    );
  }
}
