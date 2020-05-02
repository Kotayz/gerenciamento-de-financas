import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:intro_slider/slide_object.dart';
import 'initial_user_info_controller.dart';
import 'package:intro_slider/intro_slider.dart';

void run() => runApp(InitialUserInfoPage());

class InitialUserInfoPage extends View {
  @override
  State<StatefulWidget> createState() => InitialUserInfoPageState();
}

class InitialUserInfoPageState
    extends ViewState<InitialUserInfoPage, InitialUserInfoController> {
  InitialUserInfoPageState() : super(InitialUserInfoController());

//  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();
//    slides.add(
//      Slide(
//        backgroundColor: Colors.redAccent,
//        widgetDescription: welcomeStep(),
//      ),
//    );
//    slides.add(
//      Slide(
//        backgroundColor: Color(0xfff5a623),
//        widgetDescription: personalDataStep(),
//      ),
//    );
//    slides.add(
//      Slide(
//        backgroundColor: Color(0xfff5a623),
//        widgetDescription: incomeStep(),
//      ),
//    );
//    slides.add(
//      Slide(
//        backgroundColor: Color(0xfff5a623),
//        widgetDescription: expenseStep(),
//      ),
//    );
//    slides.add(
//      Slide(
//        backgroundColor: Color(0xfff5a623),
//        widgetDescription: tipStep(),
//      ),
//    );
  }

  void onDonePress() {
    // Do what you want
  }

  @override
  Widget buildPage() {
    return Scaffold(
      body: IntroSlider(
        slides: this.slides(),
        onDonePress: this.onDonePress,
        isScrollable: false,
        isShowSkipBtn: false,
        isShowPrevBtn: true,
        nameNextBtn: "Continuar".toUpperCase(),
        nameDoneBtn: "Concluir".toUpperCase(),
        namePrevBtn: "Voltar".toUpperCase(),
        widthDoneBtn: 110,
        widthPrevBtn: 110,
      ),
    );
  }

  List<Slide> slides() {
    return <Slide>[
      Slide(
        backgroundColor: Colors.redAccent,
        widgetDescription: welcomeStep(),
      ),
      Slide(
        backgroundColor: Color(0xfff5a623),
        widgetDescription: personalDataStep(),
      ),
      Slide(
        backgroundColor: Color(0xfff5a623),
        widgetDescription: incomeStep(),
      ),
      Slide(
        backgroundColor: Color(0xfff5a623),
        widgetDescription: expenseStep(),
      ),
      Slide(
        backgroundColor: Color(0xfff5a623),
        widgetDescription: tipStep(),
      ),
    ];
  }

  Widget welcomeStep() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
//      mainAxisAlignment: MainAxisAlignment.start,
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
//      mainAxisAlignment: MainAxisAlignment.start,
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
//      mainAxisAlignment: MainAxisAlignment.start,
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
//      mainAxisAlignment: MainAxisAlignment.start,
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
//      mainAxisAlignment: MainAxisAlignment.start,
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
        ],
      ),
    );
  }
}
