package fpt.aptech.api.service;

import fpt.aptech.api.models.Booking;
import fpt.aptech.api.models.MoMoPaymentResponse;
import fpt.aptech.api.models.Payment;
import java.util.List;
import java.util.Map;


public interface IBooking {
    MoMoPaymentResponse createBooking(Map<String, Object> requestBody, int userId);
    void handleMoMoIPN(MoMoPaymentResponse paymentResponse);
    MoMoPaymentResponse createBookingV2(Map<String, Object> requestBody, int userId);
    Booking createBookingCashPayment(Map<String, Object> requestBody, int userId);
    Booking bookTour(Booking book);
    void payment(Payment pay);
    public List<Booking> getTourOrderById(int userId);
}
