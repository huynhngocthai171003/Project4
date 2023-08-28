import 'package:travel_app/core/model_ui/account_model_UI.dart';

abstract class IAuthService {
  Future<AccountModelUI?> login(String email, String password);
  Future<bool> checkLogin();
  Future<void> logOut();
}
