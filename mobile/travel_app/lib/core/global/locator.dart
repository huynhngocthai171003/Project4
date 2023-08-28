import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:travel_app/core/global/locator_sevice.dart';
import 'package:travel_app/core/utils/token_utils.dart';
import '../../api/rest_client.dart';
import 'global_data.dart';

GetIt locator = GetIt.instance;

RestClient getRestClient() {
  return locator.get<RestClient>(instanceName: 'RestClient');
}

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => GlobalData());
  registerServiceSingletons(locator);
  setupRestClient();
  await checkLogin();
}

Future<void> checkLogin() async {
  String? token = await TokenUtils.getToken();
  if (token != null) {
    try {
      var profile = await getRestClient().getProfile(token: token);
      locator<GlobalData>().currentUser = profile;
    } catch (e) {
      print(e);
    } finally {
      // TODO
    }
  }
}

void setupRestClient() {
  var dio = Dio();
  try {
    locator.registerLazySingleton(
      () => RestClient(dio, baseUrl: 'http://10.0.2.2:8888/api'),
      instanceName: "RestClient",
    );
  } catch (e) {
    // Future.wait([LoggerUtils.logException(e)]);
  }
}
