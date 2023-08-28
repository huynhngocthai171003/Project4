import 'package:flutter/material.dart';
import 'package:travel_app/core/model_ui/address_model_UI.dart';
import 'package:travel_app/core/services/interfaces/iaddress_service.dart';

import '../../global/locator.dart';
import '../interfaces/iaddress_view_model.dart';

class AddressViewModel extends ChangeNotifier implements IAddressViewModel {
  List<AddressModelUI> _address = [];
  bool _isLoading = true;

  @override
  bool get isLoading => _isLoading;
  @override
  List<AddressModelUI> get address => _address;

  final IAddressService _addressService = locator<IAddressService>(); 

    @override
  Future<void> init() async{
    final listAddress = await _addressService.getAddress();
    _address = listAddress;
    _isLoading = false;
    notifyListeners();
  }

  @override
  Future<List<AddressModelUI>> getAddress() async{
    return await _addressService.getAddress();
  }
  
  @override
  List<AddressModelUI> getAddressById(int id) {
    List<AddressModelUI> result = [];
    for (var i in _address) {
      if(i.regionId.id == id){
        result.add(i);
      }
    }
    return result;
  }

}
