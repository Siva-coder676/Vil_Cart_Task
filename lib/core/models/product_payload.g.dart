// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPayload _$ProductPayloadFromJson(Map<String, dynamic> json) =>
    ProductPayload(
      pageLimit: (json['pageLimit'] as num?)?.toInt(),
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductPayloadToJson(ProductPayload instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageLimit': instance.pageLimit,
    };
