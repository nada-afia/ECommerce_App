import 'package:ecommerce/core/exceptions/app_exception.dart';
import 'package:ecommerce/domain/use_case/get_all_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'product_tab_states.dart';
@injectable
class ProductTabViewModel extends Cubit<ProductTabStates> {
  GetAllProductsUseCase productsUseCase;

  ProductTabViewModel({required this.productsUseCase,})
      :super(ProductTabInitialState());

  Future<void> getProducts() async {
    try {
      emit(ProductTabLoadingState());
      var productList = await productsUseCase.invoke();
      emit(ProductSuccessState(productList: productList));
    } on AppException catch (e) {
      emit(ProductErrorState(message: e.errorMessage));
    }
  }
}