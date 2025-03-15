// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      noOfPages: (json['noOfPages'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => ResultData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'noOfPages': instance.noOfPages,
      'result': instance.result,
    };

ResultData _$ResultDataFromJson(Map<String, dynamic> json) => ResultData(
      productId: (json['productId'] as num?)?.toInt(),
      productName: json['productName'] as String?,
      SkuUpcEan: json['SkuUpcEan'] as String?,
      openingStock: (json['openingStock'] as num?)?.toInt(),
      goodOpeningStock: (json['goodOpeningStock'] as num?)?.toInt(),
      damagedOpeningStock: (json['damagedOpeningStock'] as num?)?.toInt(),
      inward: (json['inward'] as num?)?.toInt(),
      goodInward: (json['goodInward'] as num?)?.toInt(),
      damagedInward: (json['damagedInward'] as num?)?.toInt(),
      outward: (json['outward'] as num?)?.toInt(),
      goodOutward: (json['goodOutward'] as num?)?.toInt(),
      damagedOutward: (json['damagedOutward'] as num?)?.toInt(),
      closing: (json['closing'] as num?)?.toInt(),
      goodClosing: (json['goodClosing'] as num?)?.toInt(),
      damagedClosing: (json['damagedClosing'] as num?)?.toInt(),
      primaryClosing: (json['primaryClosing'] as num?)?.toInt(),
      totalQty: (json['totalQty'] as num?)?.toInt(),
      totalGoodQty: (json['totalGoodQty'] as num?)?.toInt(),
      totalDamagedQty: (json['totalDamagedQty'] as num?)?.toInt(),
      actualQty: (json['actualQty'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResultDataToJson(ResultData instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'SkuUpcEan': instance.SkuUpcEan,
      'openingStock': instance.openingStock,
      'goodOpeningStock': instance.goodOpeningStock,
      'damagedOpeningStock': instance.damagedOpeningStock,
      'inward': instance.inward,
      'goodInward': instance.goodInward,
      'damagedInward': instance.damagedInward,
      'outward': instance.outward,
      'goodOutward': instance.goodOutward,
      'damagedOutward': instance.damagedOutward,
      'closing': instance.closing,
      'goodClosing': instance.goodClosing,
      'damagedClosing': instance.damagedClosing,
      'primaryClosing': instance.primaryClosing,
      'totalQty': instance.totalQty,
      'totalGoodQty': instance.totalGoodQty,
      'totalDamagedQty': instance.totalDamagedQty,
      'actualQty': instance.actualQty,
    };
