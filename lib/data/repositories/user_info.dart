import 'package:gerenciar_financas_app/data/storage/local.dart';
import 'package:gerenciar_financas_app/data/utils/http_helper.dart';
import 'package:gerenciar_financas_app/domain/models/user_info.dart';
import 'package:gerenciar_financas_app/domain/repositories/user_info.base.dart';

class UserInfoRepository extends UserInfoBaseRepository {
  static const String _endpoint = 'api/users';

  @override
  Future saveUserInfo(UserInfo userInfo) async {
    await HttpHelper.invoke(
      _endpoint,
      RequestType.post,
      data: userInfo.toJson(),
    );
    LocalStorage.savedUserId(userInfo.email);
  }

  @override
  Future<UserInfo> getUserInfo(String userId) async {
    Map<String, dynamic> response =
        await HttpHelper.invoke('$_endpoint/$userId', RequestType.get);
    return UserInfo.fromJson(response);
  }

  @override
  Future<String> getSavedUserId() async {
    return await LocalStorage.getSavedUserId();
  }
}
