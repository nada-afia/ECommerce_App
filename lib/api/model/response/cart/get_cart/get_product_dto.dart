import 'package:json_annotation/json_annotation.dart';

import '../../common/products_dto.dart';
part 'get_product_dto.g.dart';
@JsonSerializable()
class GetProductDto {
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "product")
  final ProductDto? product;
  @JsonKey(name: "price")
  final int? price;

  GetProductDto ({
    this.count,
    this.Id,
    this.product,
    this.price,
  });

  factory GetProductDto.fromJson(Map<String, dynamic> json) {
    return _$GetProductDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetProductDtoToJson(this);
  }
}
