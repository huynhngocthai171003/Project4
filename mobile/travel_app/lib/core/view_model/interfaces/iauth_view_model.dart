import 'package:flutter/widgets.dart';

abstract class IAuthViewModel extends ChangeNotifier {
  Future<void> login(String email, String password);
  Future<void> init();
  Future<void> logout();
}