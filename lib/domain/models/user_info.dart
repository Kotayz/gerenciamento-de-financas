class UserInfo {
  String name;
  String email;
  String phone;
  bool flagTipsEmail;
  bool flagTipsPhone;
  double monthlyIncome;
  double monthlyExpenses;

  UserInfo({
    this.name,
    this.email,
    this.phone,
    this.flagTipsEmail,
    this.flagTipsPhone,
    this.monthlyIncome,
    this.monthlyExpenses,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return UserInfo(
      name: json['nomeUsuario'],
      email: json['email_id'],
      phone: json['celular'],
      flagTipsEmail: json['flagDicasEmail'],
      flagTipsPhone: json['flagDicasCelular'],
      monthlyIncome: json['rendaMes'],
      monthlyExpenses: json['gastosMes'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomeUsuario'] = this.name;
    data['email_id'] = this.email;
    data['celular'] = this.phone;
    data['flagDicasEmail'] = this.flagTipsEmail;
    data['flagDicasCelular'] = this.flagTipsPhone;
    data['rendaMes'] = this.monthlyIncome;
    data['gastosMes'] = this.monthlyExpenses;
    return data;
  }
}
