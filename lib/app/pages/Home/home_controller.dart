import 'package:flutter/material.dart';
import 'package:gerenciar_financas_app/app/base_controller.dart';
import 'package:gerenciar_financas_app/app/pages/AddExpense/add_expense_view.dart';
import 'package:gerenciar_financas_app/app/pages/Home/expense_presenter.dart';
import 'package:gerenciar_financas_app/data/repositories/expense.dart';
import 'package:gerenciar_financas_app/domain/models/expense.dart';
import 'package:gerenciar_financas_app/domain/models/user_info.dart';
import 'package:gerenciar_financas_app/utils/date.dart';

import 'home_presenter.dart';

class HomeController extends BaseController {
  final StreamExpensePresenter _streamExpensePresenter;
  final UserInfo userInfo;

  List<Expense> get expensesOfTheDay => userInfo.additionalExpenses
      ?.where((v) => DateUtils.isToday(v.dateTime))
      ?.toList();

  double get expensesOfTheDaySum =>
      expensesOfTheDay?.fold(0, (sum, exp) => sum + exp.value) ?? 0;

  List<Expense> get expensesOfTheMonth => userInfo.additionalExpenses
      ?.where((v) => DateUtils.isOnCurrentMonth(v.dateTime))
      ?.toList();

  double get expensesOfTheMonthSum =>
      expensesOfTheMonth?.fold(0, (sum, exp) => sum + exp.value) ?? 0;

  double dailyLimit = 0;
  double remainingDailyLimit = 0;
  double remainingDailyLimitPercent = 0;

  HomeController(this.userInfo)
      : _streamExpensePresenter = StreamExpensePresenter(ExpenseRepository()),
        super() {
    calculateDailyLimit();
    _streamExpensePresenter.begin(userInfo.email);
  }

  @override
  void initListeners() {
    _streamExpensePresenter.onNext = (expenses) {
      if (expenses.length > (userInfo.additionalExpenses?.length ?? 0)) {
        userInfo.additionalExpenses = expenses;
        calculateDailyLimit();
        refreshUI();
      }
    };
  }

  void calculateDailyLimit() {
    var now = DateTime.now();
    var firstDayOfNextMonth = DateTime(now.year, now.month + 1, 1);
    int remainingDays = firstDayOfNextMonth.difference(now).inDays;

    double monthlyIncome = userInfo.monthlyIncome ?? 0;
    double monthlyExpenses = userInfo.monthlyExpenses ?? 0;

    var previousExpenses = expensesOfTheMonth
        ?.where((v) => v.dateTime.isBefore(DateUtils.todayStart));
    var previousExpensesSum =
        previousExpenses?.fold(0, (sum, exp) => sum + exp.value) ?? 0;

    double remainingLimit =
        monthlyIncome - monthlyExpenses - previousExpensesSum;
    dailyLimit = remainingLimit / remainingDays;

    remainingDailyLimit = dailyLimit - expensesOfTheDaySum;
    if (dailyLimit > 0) {
      remainingDailyLimitPercent = remainingDailyLimit / dailyLimit;
    } else if (remainingDailyLimit.isNegative) {
      remainingDailyLimitPercent = -1;
    }
  }

  void navigateToAddExpense() {
    Navigator.of(getContext()).pushReplacement(
        MaterialPageRoute(builder: (context) => AddExpensePage(userInfo)));
  }
}
