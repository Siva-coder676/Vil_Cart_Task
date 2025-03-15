// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListData _$ProductListDataFromJson(Map<String, dynamic> json) =>
    ProductListData(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductListDataToJson(ProductListData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num?)?.toInt(),
      businessName: json['businessName'] as String?,
      industrySubcategory: json['industrySubcategory'] == null
          ? null
          : IndustrySubcategory.fromJson(
              json['industrySubcategory'] as Map<String, dynamic>),
      userId: (json['userId'] as num?)?.toInt(),
      fullname: json['fullname'] as String?,
      mobileNo: json['mobileNo'] as String?,
      email: json['email'] as String?,
      ecommCustomer: json['ecommCustomer'] as bool?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'businessName': instance.businessName,
      'industrySubcategory': instance.industrySubcategory,
      'userId': instance.userId,
      'fullname': instance.fullname,
      'mobileNo': instance.mobileNo,
      'email': instance.email,
      'ecommCustomer': instance.ecommCustomer,
    };

IndustrySubcategory _$IndustrySubcategoryFromJson(Map<String, dynamic> json) =>
    IndustrySubcategory(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      status: json['status'] as bool?,
      industryCategoryId: (json['industryCategoryId'] as num?)?.toInt(),
      industryCategory: json['industryCategory'] == null
          ? null
          : IndustryCategory.fromJson(
              json['industryCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndustrySubcategoryToJson(
        IndustrySubcategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
      'industryCategoryId': instance.industryCategoryId,
      'industryCategory': instance.industryCategory,
    };

IndustryCategory _$IndustryCategoryFromJson(Map<String, dynamic> json) =>
    IndustryCategory(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$IndustryCategoryToJson(IndustryCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
    };
