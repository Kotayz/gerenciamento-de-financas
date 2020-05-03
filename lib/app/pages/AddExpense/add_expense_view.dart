import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gerenciar_financas_app/app/pages/AddExpense/add_expense_controller.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class AddExpensePage extends View {
  @override
  State<StatefulWidget> createState() => _AddExpensePageState();
}

class _AddExpensePageState
    extends ViewState<AddExpensePage, AddExpenseController> {
  _AddExpensePageState() : super(AddExpenseController());

  String dropdownValue = 'One';

  List<DropdownMenuItem<String>> categories = [
    DropdownMenuItem(
      child: Text('Mercado'),
      value: 'MERCADO',
    ),
    DropdownMenuItem(
      child: Text('PetShop'),
      value: 'PETSHOP',
    ),
    DropdownMenuItem(
      child: Text('Alimentação'),
      value: 'ALIMENTATION',
    ),
    DropdownMenuItem(
      child: Text('Transporte'),
      value: 'TRANSPORTATION',
    ),
    DropdownMenuItem(
      child: Text('Viagem'),
      value: 'TRAVEL',
    ),
  ];

  @override
  Widget buildPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Gasto'),
      ),
      body: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.speaker_notes),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  decorationColor: Colors.white,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Valor',
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.monetization_on),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  decorationColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
              ),
              DateTimeField(
                decoration: InputDecoration(
                  labelText: 'Data',
                  prefixIcon: Icon(Icons.date_range),
                ),
                format: DateFormat("HH:mm"),
                onShowPicker: (context, currentValue) async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.convert(time);
                },
              ),
              DropdownButton(
                items: categories,
                onChanged: (String value){},
                hint: Text('Selecione uma categoria'),
              ),
              Spacer(flex: 1),
              Row(children: <Widget>[
                Expanded(child: doneButton('Salvar', 20))
              ])
            ],
          ),
        ),
      )),
    );
  }

  Widget reusableTextHeader(String value) {
    return Text(value,
        style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black));
  }

  Widget doneButton(String text, double fontSize) {
    return FlatButton(
      color: Colors.blueAccent,
      textColor: Colors.white,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.indigo,
      highlightColor: Colors.indigoAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Text(text, style: TextStyle(fontSize: fontSize)),
      onPressed: () {},
    );
  }

  Widget reusableTextFieldWithTextStyle(
    String labelText,
    double fontSize, {
    TextInputType inputType = TextInputType.text,
    TextEditingController textController,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: textController,
      keyboardType: inputType,
//      autovalidate: controller.autoValidatePersonalDataForm,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        focusColor: Colors.white,
        hoverColor: Colors.white,
        fillColor: Colors.white,
      ),
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        decorationColor: Colors.white,
      ),
    );
  }
}
