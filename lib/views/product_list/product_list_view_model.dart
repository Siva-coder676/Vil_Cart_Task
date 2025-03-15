import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vil_cart_task/core/locator.dart';
import 'package:vil_cart_task/core/models/product_list_data.dart';
import 'package:vil_cart_task/core/models/product_response.dart';
import 'package:vil_cart_task/core/service/local_service.dart';
import 'package:vil_cart_task/core/service/product_service.dart';

class ProductListViewModel extends BaseViewModel {
  final _localService = locator<LocalService>();
  final _productService = locator<ProductService>();
  final navigationService = locator<NavigationService>();


  List<Result> dropDownListData = [];

  List<ResultData> getProductDetaildata = [];

  ProductListViewModel() {
    Future.delayed(Duration(seconds: 1), () {
      getToken();
    });
  }
  getToken() async {
    String token = await _localService.getToken();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    var warehouseId = decodedToken["warehouses"]?[0]?["id"];
    _localService.saveWareHouseId(warehouseId);

    getProductListData(warehouseId);

    notifyListeners();
  }

  getProductListData(warehouseId) async {
    ProductListData? productListData =
        await _productService.getProductListData(warehouseId);
    if (productListData?.result != null) {
      for (var i = 0; i < productListData!.result!.length; i++) {
        var data = productListData.result![i];
        dropDownListData.add(data);
      }
    }

    notifyListeners();
  }

  getCustomerId(id) {
    Future.delayed(Duration(seconds: 1), () {
      getProductDetailData(id);
    });
  }

  getProductDetailData(int customerId) async {
    getProductDetaildata.clear();
    ProductResponse? productResponse =
        await _productService.getProductDetailData(customerId);
    for (var i = 0; i < productResponse!.result!.length; i++) {
      var data = productResponse.result![i];
      getProductDetaildata.add(data);
    }
    notifyListeners();
  }
}
