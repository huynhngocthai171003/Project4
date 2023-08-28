

import 'package:travel_app/core/model_ui/address_model_UI.dart';

abstract class IAddressService{
  Future<List<AddressModelUI>> getAddress();
}