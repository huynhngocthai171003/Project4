import 'package:flutter/foundation.dart';
import 'package:travel_app/core/global/locator.dart';
import 'package:travel_app/core/model_ui/region_model_UI.dart';
import 'package:travel_app/core/services/interfaces/iregion_service.dart';
import 'package:travel_app/core/view_model/interfaces/iregion_view_model.dart';

class RegionViewModel extends ChangeNotifier implements IRegionViewModel {
  List<RegionModelUI> _regions = [];
  bool _isLoading = true;
  @override
  bool get isLoading => _isLoading;
  @override
  List<RegionModelUI> get regions => _regions;
  final IRegionService _regionService = locator<IRegionService>();
  @override
  Future<void> init() async {
    final listRegion = await _regionService.getAllRegions();
    _regions = listRegion;
    _isLoading = false;
    notifyListeners();
  }

  @override
  Future<List<RegionModelUI>> getReigon() async {
    return await _regionService.getAllRegions();
  }
  
  @override
  int findId(String name) {
    for (var i in _regions) {
      if(name == i.nameArea){
        return i.id;
      }
    }
    return -1;
  }
}
