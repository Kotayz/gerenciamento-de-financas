import 'package:gerenciar_financas_app/app/base_controller.dart';
import 'package:gerenciar_financas_app/data/repositories/expense.dart';
import 'package:gerenciar_financas_app/domain/models/expense.dart';
import 'package:gerenciar_financas_app/domain/models/user_info.dart';

import 'home_presenter.dart';

class HomeController extends BaseController {
  final ExpensePresenter _expensePresenter;
  final UserInfo userInfo;

  List<Expense> expenses;
  bool isLoadingExpenses = true;

  HomeController(this.userInfo)
      : _expensePresenter = ExpensePresenter(ExpenseRepository()),
        super();

  @override
  void initListeners() {
    _expensePresenter.onFetchComplete = () {
      isLoadingExpenses = false;
    };

    _expensePresenter.onFetchNext = (result) {
      expenses = result;
      refreshUI();
    };

    _expensePresenter.onFetchError = (e) {
      showError(e);
    };
  }

  void loadExpenses() {
    _expensePresenter.fetchExpenses(userInfo.email);
  }
}
