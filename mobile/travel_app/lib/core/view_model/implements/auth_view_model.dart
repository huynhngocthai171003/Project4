import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/core/global/global_data.dart';
import 'package:travel_app/core/global/locator.dart';
import 'package:travel_app/core/global/router.dart';
import 'package:travel_app/core/model_ui/account_model_UI.dart';
import 'package:travel_app/core/services/interfaces/iauth_service.dart';
import 'package:travel_app/core/view_model/interfaces/iauth_view_model.dart';

class AuthViewModel with ChangeNotifier implements IAuthViewModel {
  final IAuthService _authService = locator<IAuthService>();

  // final IChannelService _iChannelService = locator<IChannelService>();
  int? _currentUserId;
  // List<ChannelDto> _channels = [];
  // List<ProvinceDto> _provinces = [];
  final AccountModelUI? _profile = locator<GlobalData>().currentUser;

  AccountModelUI? get profile => _profile;

  int? get currentUserId => _currentUserId;

  @override
  Future<void> init() async {
    var logined = await _authService.checkLogin();

    if (logined) {
      Get.offNamed(MyRouter.home);
    } else {
      Get.offNamed(MyRouter.login);
    }
  }

  @override
  Future<void> login(String email, String password) async {
    var account = await _authService.login(email, password);
    if (account != null) {
      Get.offNamed(MyRouter.home);
    }
  }

  @override
  Future<void> logout() async {
    _authService.logOut();
  }
}



  // @override
  // Future<void> updateAccount(AccountUpdateDto accountUpdateDto) async {
  //   var result = await _iAuthService.updateAccount(accountUpdateDto);
  //   if (result) {
  //     getProfile();
  //     Get.offNamed(MyRouter.account);
  //     await EasyLoading.showSuccess('Cập nhật thành công!');
  //   }
  // }

  // @override
  // Future<void> changePassword(
  //     String currentPassword, String newPassword) async {
  //   bool result =
  //       await _iAuthService.changePassword(currentPassword, newPassword);
  //   if (result) {
  //     EasyLoading.showSuccess("Đổi mật khẩu thành công!");
  //     await _iAuthService.logOut();
  //     Get.offNamed(MyRouter.login);
  //   } else {
  //     EasyLoading.showError("Đổi mật khẩu thất bại!");
  //   }
  // }

  // @override
  // Future<void> updateAvatar(UploadFileDto file) async {
  //   var upload = await _iAuthService.updateAvatar(file);
  //   if (upload) {
  //     getProfile();
  //   }
  // }

  // @override
  // Future<bool> confirmCode(String code, int? userId) async {
  //   var result = await _iAuthService.confirmCode(code, _currentUserId!);
  //   return result;
  // }

  // @override
  // Future<bool> reSendConfirmCode(int typeId) async {
  //   var result = true;
  //   //  await _iAuthService.reSendConfirmCode(_currentUserId!, typeId);
  //   // if (result) {
  //   //   await EasyLoading.showSuccess('Đã gửi lại!');
  //   // }
  //   return result;
  // }

  // @override
  // Future<bool> forgotPassword(String emailOrPhone) async {
  //   var result = await _iAuthService.forgotPassword(emailOrPhone);
  //   if (result != null) {
  //     if (result.success == true) {
  //       _currentUserId = result.result!.userId;
  //       await EasyLoading.showSuccess('Mã xác nhận đã được gửi!');
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  // @override
  // Future<void> resetPassword(String newPassword) async {
  //   var result =
  //       await _iAuthService.resetPassword(_currentUserId!, newPassword);
  //   if (result) {
  //     await EasyLoading.showSuccess('Đổi mật khẩu thành công!');
  //     Get.offNamed(MyRouter.login);
  //   }
  // }

  // @override
  // Future<void> getProfile({bool showLoading = true}) async {
  //   await _iAuthService.getProfile(
  //     showLoading: showLoading,
  //   );
  //   _profile = locator<GlobalData>().currentUser;
  //   notifyListeners();
  // }

  // @override
  // Future<void> getChannels() async {
  //   _channels = await _iChannelService.getChannels(userId: _profile?.id);
  //   notifyListeners();
  // }

  // @override
  // Future<void> getProvinces() async {
  //   _provinces = [];
  //   var result = await _iAuthService.getUserDetail(_profile?.id ?? 0);
  //   if (result != null) {
  //     var proviceIds =
  //         result.districtDtos.map((e) => e.provinceId).toSet().toList();

  //     provinceLocations
  //         .where((element) => proviceIds.contains(element.id))
  //         .forEach((item) => _provinces.add(item));
  //   }
  //   notifyListeners();
  // }

