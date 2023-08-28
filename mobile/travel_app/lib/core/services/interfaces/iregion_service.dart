import 'package:travel_app/core/model_ui/region_model_UI.dart';
abstract class IRegionService {
  Future<List<RegionModelUI>> getAllRegions();
}
