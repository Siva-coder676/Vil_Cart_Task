import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vil_cart_task/core/models/login_payload.dart';
import 'package:vil_cart_task/core/models/login_response.dart';
import 'package:vil_cart_task/core/models/product_list_data.dart';
import 'package:vil_cart_task/core/models/product_payload.dart';
import 'package:vil_cart_task/core/models/product_response.dart';
part 'Reterofit.g.dart';

@RestApi(baseUrl: "https://business.city-link.co.in/testingstorage")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/auth/signin')
  Future<LoginResponse> getRegisterUser(@Body() LoginPayload loginPayload);

  @GET('{url}')
  Future<ProductListData> getProductListData(@Path() String url);

  @POST('{url}')
  Future<ProductResponse> getProductDetailData(
      @Path() String url, @Body() ProductPayload productPayload);
}
