
import 'package:travel_app/core/model_ui/address_model_UI.dart';
import 'package:travel_app/core/services/interfaces/iaddress_service.dart';

import '../../global/locator.dart';

class AddressService implements IAddressService{
  @override
  Future<List<AddressModelUI>> getAddress() async {
    List<AddressModelUI> address = [];
    try {
      var result = await getRestClient().getAddress();
      address = result;
    } on Exception catch (e) {
      print('Loiiiiii $e');
    }
    return address;
  }

}