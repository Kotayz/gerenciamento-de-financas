import 'package:flutter/material.dart';
import 'package:gerenciar_financas_app/app/pages/Splash/splash_view.dart';
import 'app/pages/InitialUserInfo/initial_user_info_view.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BuildMain();
  }
}

class BuildMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App para gerenciamento de finanças pessoais',
      theme:
          ThemeData().copyWith(appBarTheme: AppBarTheme(color: Colors.black)),
//      home: InitialUserInfoPage(),
      home: SplashPage(),
    );
  }
}
