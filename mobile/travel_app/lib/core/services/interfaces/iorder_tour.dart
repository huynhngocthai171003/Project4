import 'package:travel_app/core/dto/booking_dto.dart';
import 'package:travel_app/core/dto/payment_dto.dart';
import 'package:travel_app/core/dto/tour_dto.dart';

abstract class IOrderTourService {
  Future<BookingTourDto> orderTour(BookingTourDto tour);
  Future<void> payment(PaymentDto pay);
  Future<List<BookingTourDto>> tourOrder(int id);
}
