import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:travel_app/core/global/locator.dart';
import 'package:travel_app/core/services/interfaces/iauth_service.dart';
import 'package:travel_app/core/view_model/interfaces/istart_screen_view_model.dart';

import '../../global/router.dart';

class StartScreenViewModel extends ChangeNotifier
    implements IStartScreenViewModel {
  final IAuthService _authService = locator<IAuthService>();
  @override
  Future<void> goToNextPage() async {
    bool isLogin = await _authService.checkLogin();
    if (isLogin) {
      Get.offNamed(MyRouter.home);
    } else {
      Get.offNamed(MyRouter.login);
    }
  }
}
