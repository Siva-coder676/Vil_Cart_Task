import 'package:json_annotation/json_annotation.dart';
part 'product_payload.g.dart';


@JsonSerializable()
class ProductPayload {
  int? pageNumber;
  int? pageLimit;

  ProductPayload({this.pageLimit, this.pageNumber});

   factory ProductPayload.fromJson(Map<String, dynamic> json) =>
      _$ProductPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPayloadToJson(this);
}
