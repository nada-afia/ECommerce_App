import 'package:ecommerce/domain/entities/response/category/category_.dart';
import 'package:ecommerce/domain/entities/response/common/metadata.dart';

class CategoryResponse {
  final int? results;
  final MetaData? metadata;
  final List<Category>? data;

  CategoryResponse ({
    this.results,
    this.metadata,
    this.data,
  });

}




