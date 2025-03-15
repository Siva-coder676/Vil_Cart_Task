import 'package:logger/logger.dart';
import 'package:vil_cart_task/core/locator.dart';
import 'package:vil_cart_task/core/models/product_list_data.dart';
import 'package:vil_cart_task/core/models/product_payload.dart';
import 'package:vil_cart_task/core/models/product_response.dart';
import 'package:vil_cart_task/core/repository/network.dart';
import 'package:vil_cart_task/core/service/local_service.dart';
import 'package:vil_cart_task/main.dart';

class ProductService {
  // late int wareHouseId;
  final _localService = locator<LocalService>();
  // getwareHouseId() async {
  //   wareHouseId = await _localService.getWareHouseId();
  // }

  Future<ProductListData?>? getProductListData(int warehouseId) async {
    try {
      ProductListData productListData = await MyApi()
          .getClientOne()!
          .getProductListData("/customer/warehouse/$warehouseId");
      return productListData;
    } catch (e) {
      Logger().e(e.toString());
    }
    return null;
  }

  Future<ProductResponse?>? getProductDetailData(int customerId) async {
    int wareHouseId = await _localService.getWareHouseId();
    try {
      ProductPayload productPayload =
          ProductPayload(pageNumber: 1, pageLimit: 10);
      ProductResponse productResponse = await MyApi()
          .getClientOne()!
          .getProductDetailData(
              "/stock/statement/date/:date/warehouse/$wareHouseId/customer/$customerId",
              productPayload);

      return productResponse;
    } catch (e) {
      Logger().e(e.toString());
    }
    return null;
  }
}
