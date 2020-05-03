import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gerenciar_financas_app/app/pages/Home/home_controller.dart';
import 'package:gerenciar_financas_app/domain/models/user_info.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

const icons = {
  'ADD': Icons.add
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
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: ListTile(
                        title: Text('Limite diário disponível'),
                        subtitle: Text('Valor diário disponível: R\$200,00'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
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
                    ),
                    controller.isLoadingExpenses
                        ? CircularProgressIndicator()
                        : Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.all(8),
                              itemCount: controller.expenses?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                var expense = controller.expenses[index];
                                return ListTile(
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(LineAwesomeIcons.coffee, color: Colors.white,),
                                    ],
                                  ),
                                  title: Text(
                                    expense.title,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    DateFormat().add_Hm().format( expense.dateTime)
                                   ,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        expense.value.toString(),
                                        style: TextStyle(color: Colors.white),
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
            Flexible(
              flex: 1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  doneButton("Adicionar gastos", 15),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
