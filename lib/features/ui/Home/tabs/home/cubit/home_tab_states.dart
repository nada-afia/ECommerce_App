import 'package:ecommerce/domain/entities/response/common/category_or_brands.dart';
import 'package:ecommerce/domain/entities/response/category/category_response.dart';

abstract class HomeTabStates {}
class HomeTabInitialState extends HomeTabStates{}
class CategoriesLoadingState extends HomeTabStates{}
// class CategoriesSuccessState extends HomeTabStates{
//   List<CategoryOrBrands>? categoryList;
//   CategoriesSuccessState({required this.categoryList});
// }
class CategoriesErrorState extends HomeTabStates{
  String message;
  CategoriesErrorState({required this.message});
}
class BrandsLoadingState extends HomeTabStates{}
// class BrandsSuccessState extends HomeTabStates{
//   List<CategoryOrBrands>? brandsList;
//   BrandsSuccessState({required this.brandsList});
// }
class BrandsErrorState extends HomeTabStates{
  String message;
  BrandsErrorState({required this.message});
}
class HomeTabSuccessState extends HomeTabStates{
  List<CategoryOrBrands>? categoryList;
  List<CategoryOrBrands>? brandsList;
  HomeTabSuccessState({this.categoryList,this.brandsList});
  HomeTabSuccessState copyWith({
     List<CategoryOrBrands>? categoryList,
      List<CategoryOrBrands>? brandsList
}){
    return HomeTabSuccessState(
      categoryList: categoryList ??this.categoryList,
      brandsList:  brandsList ??this.brandsList
    );
  }
}