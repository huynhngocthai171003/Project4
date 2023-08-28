import 'package:flutter/widgets.dart';
import 'package:travel_app/core/model_ui/schedule_model_UI.dart';
import 'package:travel_app/core/model_ui/tour_model_UI.dart';

abstract class ITourViewModel extends ChangeNotifier {
  List<TourModelUI> get tours;
  List<TourModelUI> get toursHome;
  Future<List<TourModelUI>> getTour();
  Future<void> getTourByRegion(int id);
  Future<void> getTourDetail(int id);
  List<ScheduleModelUI> get tourDetail;
  Future<void> init();
  bool get isLoading;
}
