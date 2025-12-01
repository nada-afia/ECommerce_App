import 'package:ecommerce/domain/entities/response/common/category_or_brands.dart';
import 'package:ecommerce/domain/entities/response/common/metadata.dart';

class CategoryResponse {
  final int? results;
  final MetaData? metadata;
  final List<CategoryOrBrands>? data;

  CategoryResponse ({
    this.results,
    this.metadata,
    this.data,
  });

}




