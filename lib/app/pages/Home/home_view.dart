import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gerenciar_financas_app/app/pages/Home/home_controller.dart';
import 'package:gerenciar_financas_app/domain/models/user_info.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const icons = {
  'MERCADO': FontAwesomeIcons.shoppingBasket,
  'PETSHOP': FontAwesomeIcons.paw,
  'ALIMENTATION': FontAwesomeIcons.hamburger,
};

class HomePage extends View {
  final UserInfo userInfo;

  HomePage(this.userInfo);

  @override
  State<StatefulWidget> createState() => _HomePageState(userInfo);
}

class _HomePageState extends ViewState<HomePage, HomeController> {
  _HomePageState(userInfo) : super(HomeController(userInfo));

  @override
  void initState() {
    super.initState();
    controller.loadExpenses();
  }

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
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: ListTile(
                        title: Text('Limite diário disponível'),
                        subtitle: Text(
                            'Valor diário disponível: R\$${(controller.dailyLimit ?? 0).toStringAsFixed(2)}'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 9,
              child: Card(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Gastos de hoje',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      trailing: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {}),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount:
                            controller.userInfo?.additionalExpenses?.length ??
                                0,
                        itemBuilder: (BuildContext context, int index) {
                          var expense =
                              controller.userInfo.additionalExpenses[index];
                          return ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  icons[expense.category],
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            title: Text(
                              expense.title,
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              DateFormat().add_Hm().format(expense.dateTime),
                              style: TextStyle(color: Colors.white70),
                            ),
                            trailing: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.remove,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                Text(
                                  expense.value.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
