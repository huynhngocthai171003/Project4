import 'package:flutter/foundation.dart';
import 'package:travel_app/core/global/locator.dart';
import 'package:travel_app/core/model_ui/schedule_model_UI.dart';
import 'package:travel_app/core/model_ui/tour_model_UI.dart';
import 'package:travel_app/core/services/interfaces/itour_service.dart';
import 'package:travel_app/core/view_model/interfaces/itour_view_model.dart';

class TourViewModel extends ChangeNotifier implements ITourViewModel {
  List<TourModelUI> _tours = [];
  List<ScheduleModelUI> _tourDetail = [];
  List<TourModelUI> _listTours = [];
  bool _isLoading = true;
  @override
  bool get isLoading => _isLoading;
  @override
  List<TourModelUI> get tours => _listTours;
  @override
  List<TourModelUI> get toursHome => _tours;
  @override
  List<ScheduleModelUI> get tourDetail => _tourDetail;
  final ITourService _tourService = locator<ITourService>();
  @override
  Future<List<TourModelUI>> getTour() async {
    return await _tourService.getAllTours();
  }

  @override
  Future<void> init() async {
    final listRegion = await _tourService.getAllTours();
    _tours = listRegion;
    _isLoading = false;
    notifyListeners();
  }

  @override
  Future<void> getTourByRegion(int id) async {
    _listTours.clear();
    _tours = await _tourService.getAllTours();
    var tourById = _tours.where((element) => element.regionId.id == id);
    for (var e in tourById) {
      _listTours.add(e);
    }
    notifyListeners();
  }

  @override
  Future<void> getTourDetail(int id) async {
    _listTours.clear();
    _tourDetail.clear();
    _tours = await _tourService.getAllTours();
    var tourById = _tours.where((element) => element.regionId.id == id);
    _listTours.addAll(tourById);

    for (var item in _listTours) {
      var tourDetails = await _tourService.getTourById(item.id);

      var tourDetailsById =
          tourDetails.where((element) => element.tourId.regionId.id == id);

      _tourDetail.addAll(tourDetailsById);
    }

    notifyListeners();
  }
}
