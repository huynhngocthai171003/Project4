import 'package:get_it/get_it.dart';
import 'package:travel_app/core/services/implements/address_service.dart';
import 'package:travel_app/core/services/implements/auth_service.dart';
import 'package:travel_app/core/services/implements/order_tour.dart';
import 'package:travel_app/core/services/implements/post_service.dart';
import 'package:travel_app/core/services/implements/region_service.dart';
import 'package:travel_app/core/services/implements/tour_service.dart';
import 'package:travel_app/core/services/interfaces/iaddress_service.dart';
import 'package:travel_app/core/services/interfaces/iauth_service.dart';
import 'package:travel_app/core/services/interfaces/iorder_tour.dart';
import 'package:travel_app/core/services/interfaces/ipost_service.dart';
import 'package:travel_app/core/services/interfaces/iregion_service.dart';
import 'package:travel_app/core/services/interfaces/itour_service.dart';

void registerServiceSingletons(GetIt locator) {
  locator.registerLazySingleton<IAuthService>(() => AuthService());
  locator.registerLazySingleton<IRegionService>(() => RegionService());
  locator.registerLazySingleton<ITourService>(() => TourService());
  locator.registerLazySingleton<IAddressService>(() => AddressService());
  locator.registerLazySingleton<IOrderTourService>(() => OrderTourService());
  locator.registerLazySingleton<IPostService>(() => PostService());
}
