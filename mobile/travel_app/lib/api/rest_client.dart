import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_app/core/dto/base_api_dto.dart';
import 'package:travel_app/core/dto/payment_dto.dart';
import 'package:travel_app/core/dto/tour_dto.dart';

import 'package:travel_app/core/model_ui/account_model_UI.dart';
import 'package:travel_app/core/model_ui/post_model_UI.dart';
import 'package:travel_app/core/model_ui/region_model_UI.dart';
import 'package:travel_app/core/model_ui/schedule_model_UI.dart';
import 'package:travel_app/core/model_ui/tour_model_UI.dart';

import '../core/dto/auth/register_dto.dart';
import '../core/dto/booking_dto.dart';
import '../core/model_ui/address_model_UI.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // Rest api for account
  @GET('/users/profile')
  Future<AccountModelUI> getProfile({
    @Header('Authorization') required String token,
  });

  @POST('/auth/login')
  Future<AccountModelUI> login(
    @Query('email') String email,
    @Query('password') String password,
  );

  @POST('/auth/register')
  Future<void> register(
    @Body() RegisterDto model,
  );

  @PUT('/users/change-password/{id}')
  Future<bool> changePassword(
    @Path('id') int id,
    @Query('oldPassword') String oldPassword,
    @Query('newPassword') String newPassword,
  );

  @PUT('/users/update-profile')
  Future<AccountModelUI> updateProfile(
    @Body() AccountModelUI model,
  );

  // Rest api for tours
  @GET('/tours/')
  Future<List<TourModelUI>> getTours();

  @GET('/tours/{id}')
  Future<TourModelUI> getTour(
    @Path('id') int id,
  );

  @GET('/tours/region')
  Future<List<RegionModelUI>> getRegions();

  @GET('/tours/regions/{id}/tours')
  Future<List<TourModelUI>> getToursByRegions(
    @Path('id') int id,
  );

  @GET('/tours/schedule/{id}')
  Future<ScheduleModelUI> getToursDetail(
    @Path('id') int id,
  );

  @GET('/tours/tour/{id}')
  Future<List<ScheduleModelUI>> getTourById(
    @Path('id') int id,
  );

  @GET('/tours/address/region')
  Future<List<AddressModelUI>> getAddress();

  @POST('/tours/create-tour')
  Future<void> createTour(
    @Body() CreateTourDto model,
  );

  @POST('/tours/booking-tour')
  Future<BookingTourDto> bookingTour(
    @Body() BookingTourDto model,
  );
  @POST('/tours/payment')
  Future<void> payment(
    @Body() PaymentDto model,
  );
  @GET('/users/posts')
  Future<List<PostModelUI>> getPost();

  @POST('/users/posts')
  Future<PostModelUI> createPost(
    @Body() PostModelUI model,
  );

  @PUT('/users/posts')
  Future<PostModelUI> updatePost(
    @Body() PostModelUI model,
  );

  @DELETE('/users/posts/{id}')
  Future<void> deletePost(
    @Path('id') int id,
  );

  @GET('/tours/order/{id}')
  Future<List<BookingTourDto>> getTourOrder(
    @Path('id') int id,
  );
}
