import 'package:flutter/material.dart';

abstract class IStartScreenViewModel implements ChangeNotifier {
  Future<void> goToNextPage();
}
