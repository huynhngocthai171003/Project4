import 'package:travel_app/core/global/locator.dart';
import 'package:travel_app/core/model_ui/region_model_UI.dart';
import 'package:travel_app/core/services/interfaces/iregion_service.dart';

class RegionService implements IRegionService {
  @override
  Future<List<RegionModelUI>> getAllRegions() async {
    List<RegionModelUI> regions = [];
    try {
      var result = await getRestClient().getRegions();
      regions = result;
    } on Exception catch (e) {
      print(e);
    }
    return regions;
  }
}
