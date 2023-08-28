import 'package:flutter/material.dart';
import 'package:travel_app/core/dto/booking_dto.dart';
import 'package:travel_app/core/model_ui/schedule_model_UI.dart';
import 'package:travel_app/ui/chat_screen/chat_screen.dart';
import 'package:travel_app/ui/checkout_screen/checkout.dart';
import 'package:travel_app/ui/detail_tour_screen/detail_tour_screen.dart';
import 'package:travel_app/ui/home_screen/home_screen.dart';
import 'package:travel_app/ui/login_screen/login_screen.dart';
import 'package:travel_app/ui/login_screen/register_screen.dart';
import 'package:travel_app/ui/onboard_screen/onboard_screen.dart';
import 'package:travel_app/ui/personal_screen/personal_screen.dart';
import 'package:travel_app/ui/post_screen/post_screen.dart';
import 'package:travel_app/ui/profile_screen/profile_screen.dart';
import 'package:travel_app/ui/search_screen/search_screen.dart';
import 'package:travel_app/ui/search_screen/search_screen_tour.dart';
import 'package:travel_app/ui/start_screen/start_screen.dart';
import 'package:travel_app/ui/term_service_screen/term_of_service_screen.dart';
import 'package:travel_app/ui/tour_order_screen/order_detail_screen.dart';
import 'package:travel_app/ui/tour_order_screen/tour_order_screen.dart';
import 'package:travel_app/ui/verify_screen/verify_screen.dart';

class MyRouter {
  static const String home = '/home';
  static const String start = '/start';
  static const String login = '/login';
  static const String register = '/register';
  static const String verify = '/verify';
  static const String fogot = '/fogot';
  static const String account = '/account';
  static const String term = '/term';
  static const String onboard = '/onboard';
  static const String searchs = '/searchs';
  static const String search = '/search';
  static const String detail = '/detail';
  static const String chat = '/chat';
  static const String checkout = '/checkout';
  static const String post = '/post';
  static const String order = '/order';
  static const String detailOrder = '/detailOrder';
  static PageRouteBuilder _buildRouteNavigationWithoutEffect(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      transitionDuration: Duration.zero,
      settings: settings,
    );
  }

  static PageRouteBuilder buildRouteNavigation(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      settings: settings,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case start:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const StartScreen(),
        );
      case home:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const HomeScreen(),
        );
      case post:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const ProfileScreen(),
        );
      case login:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const LoginScreen(),
        );
      case register:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const RegisterScreen(),
        );
      case verify:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const VerifyScreen(),
        );
      case fogot:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const StartScreen(),
        );

      case account:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const PersonalScreen(),
        );

      case term:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const TermOfServiceScreen(),
        );

      case onboard:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const OnBoardingScreen(),
        );

      case search:
        return _buildRouteNavigationWithoutEffect(
          settings,
          SearchTourScreen(
            item: settings.arguments as int,
          ),
        );

      case searchs:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const SearchScreen(),
        );

      case detail:
        return _buildRouteNavigationWithoutEffect(
          settings,
          DetailTourScreen(
            item: settings.arguments as ScheduleModelUI,
          ),
        );

      case chat:
        return _buildRouteNavigationWithoutEffect(
          settings,
          ChatScreen(),
        );
      case checkout:
        return _buildRouteNavigationWithoutEffect(
          settings,
          CheckoutScreen(
            item: settings.arguments as ScheduleModelUI,
          ),
        );
      case order:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const TourOrderScreen(),
        );
      case detailOrder:
        return _buildRouteNavigationWithoutEffect(
          settings,
          DetailOrderScreen(
            item: settings.arguments as BookingTourDto,
          ),
        );
      default:
        return _buildRouteNavigationWithoutEffect(
          settings,
          Scaffold(
            body: Center(
              child: Text('No route found: ${settings.name}.'),
            ),
          ),
        );
    }
  }
}
