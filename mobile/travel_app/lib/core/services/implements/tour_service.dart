import 'package:travel_app/core/global/locator.dart';
import 'package:travel_app/core/model_ui/schedule_model_UI.dart';
import 'package:travel_app/core/model_ui/tour_model_UI.dart';
import '../interfaces/itour_service.dart';

class TourService implements ITourService {
  @override
  Future<List<TourModelUI>> getAllTours() async {
    List<TourModelUI> tours = [];
    try {
      var result = await getRestClient().getTours();
      tours = result;
    } on Exception catch (e) {
      print(e);
    }
    return tours;
  }

  @override
  Future<List<TourModelUI>> getToursByRegion(int id) async {
    List<TourModelUI> tours = [];
    try {
      var result = await getRestClient().getToursByRegions(id);
      tours = result;
    } on Exception catch (e) {
      print(e);
    }
    return tours;
  }

  @override
  Future<ScheduleModelUI> getTourDetail(int id) async {
    ScheduleModelUI tours;
    ScheduleModelUI result = await getRestClient().getToursDetail(id);
    tours = result;
    return tours;
  }

  @override
  Future<List<ScheduleModelUI>> getTourById(int id) async {
    List<ScheduleModelUI> schedule = [];
    try {
      var result = await getRestClient().getTourById(id);
      schedule = result;
    } on Exception catch (e) {
      print("as" + e.toString());
    }
    return schedule;
  }
}
