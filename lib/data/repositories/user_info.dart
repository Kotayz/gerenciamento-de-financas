import 'package:gerenciar_financas_app/data/utils/http_helper.dart';
import 'package:gerenciar_financas_app/domain/models/user_info.dart';
import 'package:gerenciar_financas_app/domain/repositories/user_info.base.dart';

class UserInfoRepository extends UserInfoBaseRepository {
  static const String _endpoint = 'api/userinfo';

  @override
  Future saveUserInfo(UserInfo userInfo) async {
    Map<String, dynamic> response = await HttpHelper.invoke(
        _endpoint, RequestType.post,
        data: userInfo.toJson());
  }
}