import 'package:ecommerce/core/exceptions/app_exception.dart';
import 'package:ecommerce/domain/use_case/get_all_categories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/utilits/app_images.dart';
import 'home_tab_states.dart';
@injectable
class HomeTabViewModel extends Cubit<HomeTabStates>{
  GetAllCategoriesUseCase categoriesUseCase;
  HomeTabViewModel({required this.categoriesUseCase}):super(HomeTabInitialState());
  List<String>images=  [
  AppImages.announce1,
  AppImages.announce2,
  AppImages.announce3,
  ];
  Future<void> getCategories() async {
    try{
      emit(CategoriesLoadingState());
     var categoriesList = await categoriesUseCase.invoke();
     emit(CategoriesSuccessState(categoryList: categoriesList));

    }on AppException catch(e){
    emit( CategoriesErrorState(message:e.errorMessage));
    }
  }
}