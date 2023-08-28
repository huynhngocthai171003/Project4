import 'package:flutter/widgets.dart';
import 'package:travel_app/core/model_ui/region_model_UI.dart';

abstract class IRegionViewModel extends ChangeNotifier {
  List<RegionModelUI> get regions;
  Future<void> init();
  bool get isLoading;
  Future<List<RegionModelUI>> getReigon();
  int findId(String name);
}
