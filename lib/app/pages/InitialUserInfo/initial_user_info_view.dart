import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'initial_user_info_controller.dart';

void run() => runApp(InitialUserInfoPage());

class InitialUserInfoPage extends View {
  @override
  State<StatefulWidget> createState() => InitialUserInfoPageState();
}

class InitialUserInfoPageState
    extends ViewState<InitialUserInfoPage, InitialUserInfoController> {
  InitialUserInfoPageState() : super(InitialUserInfoController());

  @override
  Widget buildPage() {
    return Scaffold(
      body: Container(
        color: Color(0xfff5a623),
        child: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height - 100,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: false,
                enableInfiniteScroll: false,
                scrollPhysics: NeverScrollableScrollPhysics(),
                onPageChanged: controller.onStepChanged,
              ),
              carouselController: controller.carouselController,
              items: <Widget>[
                welcomeStep(),
                personalDataStep(),
                incomeStep(),
                expenseStep(),
                tipStep(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                indicatorDot(controller.currentStep == 0),
                indicatorDot(controller.currentStep == 1),
                indicatorDot(controller.currentStep == 2),
                indicatorDot(controller.currentStep == 3),
                indicatorDot(controller.currentStep == 4),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget indicatorDot(bool selected) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected
            ? Color.fromRGBO(0, 0, 0, 0.9)
            : Color.fromRGBO(0, 0, 0, 0.4),
      ),
    );
  }

  Widget welcomeStep() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
//      mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'Seja bem vindo!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Olá, estamos felizes com o seu primeiro passo para uma vida financeira mais saudável.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Primeiramente, precisamos saber alguns dados seus. Mas, não se preocupe, você poderá alterá-los quando desejar.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          doneButton("Vamos lá!"),
        ],
      ),
    );
  }

  Widget personalDataStep() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
//      mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'Dados pessoais',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
              labelText: "Nome",
            ),
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: "E-mail",
            ),
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: "Celular",
            ),
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          doneButton("Prosseguir"),
        ],
      ),
    );
  }

  Widget incomeStep() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
//      mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'Receita',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Em média, quanto você recebe mensalmente?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          doneButton("Prosseguir"),
        ],
      ),
    );
  }

  Widget expenseStep() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
//      mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'Despesas',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Aproximadamente, quais são as suas despesas fixas mensais (água, luz, gás, internet, etc)?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          doneButton("Prosseguir"),
        ],
      ),
    );
  }

  Widget tipStep() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
//      mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'Dicas',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Para finalizar, você gostaria de receber informações e dicas sobre como cuidar melhor da sua saúde financeira?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          RadioListTile(
            value: 1,
            onChanged: controller.handleRadioChange,
            groupValue: controller.radioValue,
            title: Text(
              'Sim, por e-mail e por SMS',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          RadioListTile(
            value: 2,
            onChanged: controller.handleRadioChange,
            groupValue: controller.radioValue,
            title: Text(
              'Sim, somente por e-mail',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          RadioListTile(
            value: 3,
            onChanged: controller.handleRadioChange,
            groupValue: controller.radioValue,
            title: Text(
              'Sim, somente por SMS',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          RadioListTile(
            value: 4,
            onChanged: controller.handleRadioChange,
            groupValue: controller.radioValue,
            title: Text(
              'Não',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20),
          doneButton("Concluir"),
        ],
      ),
    );
  }

  Widget doneButton(String text) {
    return FlatButton(
      child: Text(text),
      onPressed: () {
        controller.carouselController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      },
    );
  }
}
