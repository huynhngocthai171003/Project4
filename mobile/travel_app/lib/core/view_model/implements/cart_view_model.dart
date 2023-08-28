import 'package:flutter/material.dart';
import 'package:travel_app/core/dto/booking_dto.dart';
import 'package:travel_app/core/dto/payment_dto.dart';
import 'package:travel_app/core/global/global_data.dart';
import 'package:travel_app/core/services/interfaces/iorder_tour.dart';
import 'package:travel_app/core/view_model/interfaces/icart_view_model.dart';

import '../../global/locator.dart';

class CartViewModel extends ChangeNotifier implements ICartViewModel {
  final IOrderTourService _orderService = locator<IOrderTourService>();
  late BookingTourDto _bookingTourDto;
  bool _isLoading = true;
  @override
  bool get isLoading => _isLoading;
  List<BookingTourDto> _tourOrder = [];
  @override
  List<BookingTourDto> get tourOrders => _tourOrder;
  @override
  Future<BookingTourDto> bookTour(BookingTourDto tour) async {
    _bookingTourDto = await _orderService.orderTour(tour);
    notifyListeners();
    return _bookingTourDto;
  }

  @override
  Future<void> payment(PaymentDto pay) async {
    await _orderService.payment(pay);
    notifyListeners();
  }

  @override
  Future<List<BookingTourDto>> tourOrder() async {
    return _tourOrder;
  }

  @override
  Future<void> init() async {
    final listOrder =
        await _orderService.tourOrder(locator<GlobalData>().currentUser!.id);
    _tourOrder = listOrder;
    _isLoading = false;
    notifyListeners();
  }
}
