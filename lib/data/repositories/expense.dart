import 'package:gerenciar_financas_app/data/utils/http_helper.dart';
import 'package:gerenciar_financas_app/domain/models/expense.dart';
import 'package:gerenciar_financas_app/domain/repositories/expense.base.dart';

class ExpenseRepository extends ExpenseBaseRepository {
  static const String _endpoint = 'api/user/expenses';

  @override
  Future saveExpense(Expense expense, String userId) async {
    await HttpHelper.invoke(
      _endpoint,
      RequestType.post,
      data: expense.toJson(),
    );
  }

  @override
  Future<List<Expense>> fetchExpenses(String userId) async {
//    Map<String, dynamic> response =
//        await HttpHelper.invoke('$_endpoint/$userId', RequestType.get);

//    return response?.values?.map((v) => Expense.fromJson(v));
    return Future.delayed(Duration(seconds: 3), () {
      return <Expense>[
        Expense(
          title: 'Mercado',
          value: 21.20,
          dateTime: DateTime(2020, 1, 1, 10, 5),
          category: 'MERCADO',
        ),
        Expense(
          title: 'PetShop',
          value: 74.30,
          dateTime: DateTime(2020, 1, 1, 15, 5),
          category: 'PETSHOP',
        ),
        Expense(
          title: 'Lemax',
          value: 174.30,
          dateTime: DateTime(2020, 1, 1, 18, 5),
          category: 'ALIMENTATION',
        ),
        Expense(
          title: 'Viagem',
          value: 174.30,
          dateTime: DateTime(2020, 1, 1, 18, 5),
          category: 'TRAVEL',
        ),
        Expense(
          title: 'Uber',
          value: 174.30,
          dateTime: DateTime(2020, 1, 1, 18, 5),
          category: 'TRANSPORTATION',
        ),
      ];
    });
  }
}
