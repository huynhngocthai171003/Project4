import 'package:travel_app/core/dto/booking_dto.dart';
import 'package:travel_app/core/dto/payment_dto.dart';
import 'package:travel_app/core/global/locator.dart';
import 'package:travel_app/core/services/interfaces/iorder_tour.dart';

class OrderTourService implements IOrderTourService {
  @override
  Future<BookingTourDto> orderTour(BookingTourDto tour) async {
    BookingTourDto bookingTourDto = await getRestClient().bookingTour(tour);
    return bookingTourDto;
  }

  @override
  Future<void> payment(PaymentDto pay) async {
    try {
      await getRestClient().payment(pay);
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Future<List<BookingTourDto>> tourOrder(int id) async{
    List<BookingTourDto> tourOrder = [];
    try {
      var result = await getRestClient().getTourOrder(id);
      tourOrder = result;
    } on Exception catch (e) {
      print("as" + e.toString());
    }
    return tourOrder;
  }
}
