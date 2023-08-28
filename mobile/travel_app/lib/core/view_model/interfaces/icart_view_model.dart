import 'package:flutter/material.dart';
import 'package:travel_app/core/dto/payment_dto.dart';

import '../../dto/booking_dto.dart';

abstract class ICartViewModel extends ChangeNotifier {
  Future<BookingTourDto> bookTour(BookingTourDto tour);
  Future<void> payment(PaymentDto pay);
  Future<List<BookingTourDto>> tourOrder();
  bool get isLoading;
  List<BookingTourDto> get tourOrders;
  Future<void> init();
}
