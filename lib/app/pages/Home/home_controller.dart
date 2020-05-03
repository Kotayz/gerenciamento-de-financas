import 'package:gerenciar_financas_app/app/base_controller.dart';
import 'package:gerenciar_financas_app/app/pages/Home/expense_presenter.dart';
import 'package:gerenciar_financas_app/data/repositories/expense.dart';
import 'package:gerenciar_financas_app/domain/models/expense.dart';
import 'package:gerenciar_financas_app/domain/models/user_info.dart';

import 'home_presenter.dart';

class HomeController extends BaseController {
  final ExpensePresenter _expensePresenter;
  final StreamExpensePresenter _streamExpensePresenter;
  final UserInfo userInfo;

//  List<Expense> expenses;
//  bool isLoadingExpenses = true;

  double dailyLimit = 0;

  HomeController(this.userInfo)
      : _expensePresenter = ExpensePresenter(ExpenseRepository()),
        _streamExpensePresenter = StreamExpensePresenter(ExpenseRepository()),
        super() {
    calculateDailyLimit();
    _streamExpensePresenter.begin(userInfo.email);
  }

  @override
  void initListeners() {
//    _expensePresenter.onFetchComplete = () {
//      isLoadingExpenses = false;
//    };
//
//    _expensePresenter.onFetchNext = (result) {
//      expenses = result;
//      refreshUI();
//    };
//
//    _expensePresenter.onFetchError = (e) {
//      showError(e);
//    };

    _streamExpensePresenter.onNext = (expenses) {
      if (expenses.length > (userInfo.additionalExpenses?.length ?? 0)) {
        userInfo.additionalExpenses = expenses;
        calculateDailyLimit();
        refreshUI();
      }
    };
  }

  void loadExpenses() {
    _expensePresenter.fetchExpenses(userInfo.email);
  }

  void calculateDailyLimit() {
    var now = DateTime.now();
    var firstDayOfNextMonth = DateTime(now.year, now.month + 1, 1);
    int remainingDays = firstDayOfNextMonth.difference(now).inDays;

    double monthlyIncome = userInfo.monthlyIncome ?? 0;
    double monthlyExpenses = userInfo.monthlyExpenses ?? 0;
    double additionalExpenses = userInfo.additionalExpenses
            ?.fold(0, (sum, expense) => sum + expense.value) ??
        0;

    print('Income: $monthlyIncome');
    print('Expenses: $monthlyExpenses');
    print('AddExpenses: $additionalExpenses');

    double remainingLimit =
        monthlyIncome - monthlyExpenses - additionalExpenses;
    dailyLimit = remainingLimit / remainingDays;
  }
}
