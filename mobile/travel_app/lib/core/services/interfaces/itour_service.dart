import 'package:travel_app/core/model_ui/schedule_model_UI.dart';
import 'package:travel_app/core/model_ui/tour_model_UI.dart';

abstract class ITourService {
  Future<List<TourModelUI>> getAllTours();
  Future<List<TourModelUI>> getToursByRegion(int id);
  Future<ScheduleModelUI> getTourDetail(int id);
  Future<List<ScheduleModelUI>> getTourById(int id);
}
