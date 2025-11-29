import 'package:ecommerce/domain/entities/response/category/category_.dart';
import 'package:ecommerce/domain/entities/response/category/category_response.dart';

abstract class HomeTabStates {}
class HomeTabInitialState extends HomeTabStates{}
class CategoriesLoadingState extends HomeTabStates{}
class CategoriesSuccessState extends HomeTabStates{
  List<Category>? categoryList;
  CategoriesSuccessState({required this.categoryList});
}
class CategoriesErrorState extends HomeTabStates{
  String message;
  CategoriesErrorState({required this.message});
}