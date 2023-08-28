import 'package:get/get.dart';
import 'package:travel_app/core/global/locator.dart';
import 'package:travel_app/core/global/router.dart';
import 'package:travel_app/core/model_ui/account_model_UI.dart';
import 'package:travel_app/core/services/interfaces/iauth_service.dart';
import '../../dto/auth/access_token_dto.dart';
import '../../global/global_data.dart';
import '../../utils/token_utils.dart';

class AuthService implements IAuthService {
  @override
  Future<AccountModelUI?> login(String email, String password) async {
    AccountModelUI? account;
    try {
      final result = await getRestClient().login(email, password);
      TokenUtils.saveToken("Bearer ${result.token}");
    } on Exception catch (e) {
      print(e);
    }
    var token = await TokenUtils.getToken();
    if (token != null) {
      try {
        account = await getRestClient().getProfile(token: token);
        // account = profileResponseDto.result;
        locator<GlobalData>().currentUser = account;
        return account;
      } on Exception catch (e) {
        print(e);
      } finally {}
    }
    return null;
  }

  @override
  Future<bool> checkLogin() async {
    var token = await TokenUtils.getToken();
    if (token != null) {
      try {
        var result = await getRestClient().getProfile(token: token);
        TokenUtils.saveToken(token);
        locator<GlobalData>().currentUser = result;
        locator<GlobalData>().token = AccessToken(
          token: token,
          id: result.id,
        );
        return true;
      } catch (e) {
        print("chec ${e}");
      } finally {}
    }
    return false;
  }

  @override
  Future<void> logOut() async {
    locator<GlobalData>().token = null;
    locator<GlobalData>().currentUser = null;
    TokenUtils.removeToken();
    Get.offNamed(MyRouter.login);
  }
}
