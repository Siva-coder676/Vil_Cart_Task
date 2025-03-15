import 'package:json_annotation/json_annotation.dart';
part 'product_response.g.dart' ;

@JsonSerializable()
class ProductResponse {
  bool? status;
  String? message;
  int? noOfPages;
  List<ResultData>? result;

  ProductResponse(
      {this.status, this.message, this.noOfPages, this.result});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class ResultData {
  int? productId;
  String? productName;
  String? SkuUpcEan;
  int? openingStock;
  int? goodOpeningStock;
  int? damagedOpeningStock;
  int? inward;
  int? goodInward;
  int? damagedInward;
  int? outward;
  int? goodOutward;
  int? damagedOutward;
  int? closing;
  int? goodClosing;
  int? damagedClosing;
  int? primaryClosing;
  int? totalQty;
  int? totalGoodQty;
  int? totalDamagedQty;
  int? actualQty;

  ResultData(
      {this.productId,
      this.productName,
      this.SkuUpcEan,
      this.openingStock,
      this.goodOpeningStock,
      this.damagedOpeningStock,
      this.inward,
      this.goodInward,
      this.damagedInward,
      this.outward,
      this.goodOutward,
      this.damagedOutward,
      this.closing,
      this.goodClosing,
      this.damagedClosing,
      this.primaryClosing,
      this.totalQty,
      this.totalGoodQty,
      this.totalDamagedQty,
      this.actualQty});
  factory ResultData.fromJson(Map<String, dynamic> json) => _$ResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResultDataToJson(this);
}
