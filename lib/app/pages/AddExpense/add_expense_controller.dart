import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gerenciar_financas_app/app/base_controller.dart';
import 'package:gerenciar_financas_app/data/repositories/expense.dart';

import 'add_expense_presenter.dart';

class AddExpenseController extends BaseController {
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController valueTextController = TextEditingController();
  final TextEditingController dateTimeTextController = TextEditingController();
  final TextEditingController categoryTextController = TextEditingController();

  final AddExpensePresenter _addExpensePresenter;

  AddExpenseController()
      : _addExpensePresenter = AddExpensePresenter(ExpenseRepository()),
        super();

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  void saveExpense() {
    _addExpensePresenter.saveExpense(
      titleTextController.text,
      double.parse(valueTextController.text),
      DateTime.parse(dateTimeTextController.text),
      categoryTextController.text,
    );

    refreshUI();
  }
}
