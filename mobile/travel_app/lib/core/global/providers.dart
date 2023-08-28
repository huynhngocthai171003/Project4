import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:travel_app/core/view_model/implements/address_view_model.dart';
import 'package:travel_app/core/view_model/implements/auth_view_model.dart';
import 'package:travel_app/core/view_model/implements/cart_view_model.dart';
import 'package:travel_app/core/view_model/implements/post_view_model.dart';
import 'package:travel_app/core/view_model/implements/region_view_model.dart';
import 'package:travel_app/core/view_model/implements/start_screen_view_model.dart';
import 'package:travel_app/core/view_model/implements/tour_view_model.dart';
import 'package:travel_app/core/view_model/interfaces/iaddress_view_model.dart';
import 'package:travel_app/core/view_model/interfaces/iauth_view_model.dart';
import 'package:travel_app/core/view_model/interfaces/icart_view_model.dart';
import 'package:travel_app/core/view_model/interfaces/ipost_view_model.dart';
import 'package:travel_app/core/view_model/interfaces/iregion_view_model.dart';
import 'package:travel_app/core/view_model/interfaces/istart_screen_view_model.dart';
import 'package:travel_app/core/view_model/interfaces/itour_view_model.dart';

List<SingleChildWidget> viewModelProviders = [
  ChangeNotifierProvider<IStartScreenViewModel>(
    create: (_) => StartScreenViewModel(),
  ),
  ChangeNotifierProvider<IAuthViewModel>(
    create: (_) => AuthViewModel(),
  ),
  ChangeNotifierProvider<ITourViewModel>(
    create: (_) => TourViewModel(),
  ),
  ChangeNotifierProvider<IRegionViewModel>(
    create: (_) => RegionViewModel(),
  ),
  ChangeNotifierProvider<IAddressViewModel>(
    create: (_) => AddressViewModel(),
  ),
  ChangeNotifierProvider<ICartViewModel>(
    create: (_) => CartViewModel(),
  ),
   ChangeNotifierProvider<IPostViewModel>(
    create: (_) => PostViewModel(),
  ),
];
