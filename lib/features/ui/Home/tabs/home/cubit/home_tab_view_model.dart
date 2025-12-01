import 'package:ecommerce/core/exceptions/app_exception.dart';
import 'package:ecommerce/domain/use_case/get_all_categories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/utilits/app_images.dart';
import '../../../../../../domain/use_case/get_all_brands_usecase.dart';
import 'home_tab_states.dart';
@injectable
class HomeTabViewModel extends Cubit<HomeTabStates>{
  GetAllCategoriesUseCase categoriesUseCase;
  GetAllBrandsUseCase brandsUseCase;
  HomeTabViewModel({required this.categoriesUseCase,required this.brandsUseCase}):super(HomeTabInitialState());
  List<String>images=  [
  AppImages.announce1,
  AppImages.announce2,
  AppImages.announce3,
  ];
  HomeTabSuccessState successState = HomeTabSuccessState();
  Future<void> getCategories() async {
    try {
      emit(CategoriesLoadingState());
      var categoriesList = await categoriesUseCase.invoke();
      successState = successState.copyWith(categoryList: categoriesList);
      emit(successState);
    } on AppException catch (e) {
      emit(CategoriesErrorState(message: e.errorMessage));
    }
  }

  Future<void> getBrands() async {
    try {
      emit(BrandsLoadingState());
      var brandsList = await brandsUseCase.invoke();
      successState = successState.copyWith(brandsList: brandsList);
      emit(successState);
    } on AppException catch (e) {
      emit(BrandsErrorState(message: e.errorMessage));
    }
  }

}