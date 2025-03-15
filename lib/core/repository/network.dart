import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:vil_cart_task/core/locator.dart';
import 'package:vil_cart_task/core/repository/Reterofit.dart';
import 'package:vil_cart_task/core/service/local_service.dart';

class MyApi {
  MyApi._internal() {
    httpWrapper = HttpWrapper();
  }
  static final MyApi _singleton = MyApi._internal();

  factory MyApi() => _singleton;

  late HttpWrapper httpWrapper;

  RestClient? getClient() {
    return httpWrapper.client;
  }

  RestClient? getClientOne() {
    return httpWrapper.clientOne;
  }
}

class HttpWrapper {
  Dio dio = new Dio();
  Dio dioOne = new Dio();

  var baseUrl = "https://business.city-link.co.in/testingstorage";
  var client;
  var clientOne;

  final bool SHOW_LOGS = true;

  var _localService = locator<LocalService>();

  HttpWrapper._internal() {
    BaseOptions options = new BaseOptions(
      baseUrl: "https://business.city-link.co.in/testingstorage",
      connectTimeout: Duration(seconds: 6), 
      receiveTimeout: Duration(seconds: 6), 
      sendTimeout: Duration(seconds: 6),
    );
    dio = Dio(options);
    dioOne = Dio(options);

    var cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
    dioOne.interceptors.add(CookieManager(cookieJar));

    dio.interceptors
      ..add(InterceptorsWrapper(
        onResponse: (responce, handler) {
          return handler.next(responce);
        },
        onError: (DioError error,
            ErrorInterceptorHandler errorInterceptorHandler) async {},
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          options.headers.addAll({
            "content-type": "application/json",
            "Accept": "application/json",
          });
          return handler.next(options);
        },
      ))
      ..add(LogInterceptor(
        responseBody: SHOW_LOGS,
        requestBody: SHOW_LOGS,
      ));
    dioOne.interceptors
      ..add(InterceptorsWrapper(
        onResponse: (responce, handler) {
          return handler.next(responce);
        },
        onError: (DioError error,
            ErrorInterceptorHandler errorInterceptorHandler) async {},
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          options.headers.addAll({
            "content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer" + " " + await _localService.getToken(),
          });
          return handler.next(options);
        },
      ))
      ..add(LogInterceptor(
        responseBody: SHOW_LOGS,
        requestBody: SHOW_LOGS,
      ));

    client = RestClient(dio, baseUrl: baseUrl);
    clientOne = RestClient(dioOne, baseUrl: baseUrl);
  }

  static final HttpWrapper _singleton = HttpWrapper._internal();

  factory HttpWrapper() => _singleton;
}
