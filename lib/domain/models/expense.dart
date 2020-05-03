class Expense {
  String title;
  double value;
  DateTime dateTime;

  Expense({this.title, this.value, this.dateTime});

  factory Expense.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Expense(
      title: json['titulo'],
      value:  json['valor'],
      dateTime:  json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.title;
    data['valor'] = this.value;
    data['data'] = this.dateTime;
    return data;
  }

}