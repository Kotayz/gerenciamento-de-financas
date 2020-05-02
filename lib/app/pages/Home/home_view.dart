import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gerenciar_financas_app/app/pages/Home/home_controller.dart';

void run() => runApp(HomePage());

class HomePage extends View {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ViewState<HomePage, HomeController> {
  _HomePageState() : super(HomeController());

  Widget doneButton(String text, double fontSize) {
    return FlatButton(
      color: Colors.blueAccent,
      textColor: Colors.white,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.indigo,
      highlightColor: Colors.indigoAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Text(text, style: TextStyle(fontSize: fontSize)),
      onPressed: () {},
    );
  }

  @override
  Widget buildPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text('Limite diário disponível'),
                        subtitle: Text('Valor diário disponível: R\$200,00'),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text('Gastos de hoje'),
                      ),
                      Expanded(
                          child: ListView(
                            children: <Widget>[
                              ListTile(
                                title: Text('Mercado'),
                                subtitle: Text('12:45'),
                                trailing: Text('R\$10,00'),
                              ),
                              ListTile(
                                title: Text('Mercado'),
                                subtitle: Text('12:45'),
                                trailing: Text('R\$10,00'),
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  doneButton("Adicionar gastos", 15),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
