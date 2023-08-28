

import 'package:flutter/material.dart';
import 'package:travel_app/core/model_ui/address_model_UI.dart';

abstract class IAddressViewModel extends ChangeNotifier{
  List<AddressModelUI> get address;
  Future<void> init();
  bool get isLoading;
  Future<List<AddressModelUI>> getAddress();
  List<AddressModelUI> getAddressById(int id);
}