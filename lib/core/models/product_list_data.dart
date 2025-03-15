import 'package:json_annotation/json_annotation.dart';
part 'product_list_data.g.dart';

@JsonSerializable()
class ProductListData {
  bool? status;
  String? message;
  List<Result>? result;

  ProductListData({this.status, this.message, this.result});

  factory ProductListData.fromJson(Map<String, dynamic> json) =>
      _$ProductListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListDataToJson(this);
}

@JsonSerializable()
class Result {
  int? id;
  String? businessName;
  IndustrySubcategory? industrySubcategory;
  int? userId;
  String? fullname;
  String? mobileNo;
  String? email;
  bool? ecommCustomer;

  Result(
      {this.id,
      this.businessName,
      this.industrySubcategory,
      this.userId,
      this.fullname,
      this.mobileNo,
      this.email,
      this.ecommCustomer});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class IndustrySubcategory {
  int? id;
  String? name;
  String? description;
  bool? status;
  int? industryCategoryId;
  IndustryCategory? industryCategory;

  IndustrySubcategory(
      {this.id,
      this.name,
      this.description,
      this.status,
      this.industryCategoryId,
      this.industryCategory});

  factory IndustrySubcategory.fromJson(Map<String, dynamic> json) =>
      _$IndustrySubcategoryFromJson(json);

  Map<String, dynamic> toJson() => _$IndustrySubcategoryToJson(this);
}

@JsonSerializable()
class IndustryCategory {
  int? id;
  String? name;
  String? description;
  bool? status;

  IndustryCategory({this.id, this.name, this.description, this.status});

  factory IndustryCategory.fromJson(Map<String, dynamic> json) =>
      _$IndustryCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$IndustryCategoryToJson(this);
}
