import 'package:gerenciar_financas_app/domain/models/expense.dart';

abstract class ExpenseBaseRepository {
  Future saveExpense(Expense expense);
  Future fetchExpenses(String email);
}
