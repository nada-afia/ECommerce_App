import 'package:ecommerce/domain/entities/response/cart/getcart/get_product.dart';
import 'package:ecommerce/domain/use_case/add_to_cart_use_case.dart';
import 'package:ecommerce/domain/use_case/get_Items_cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/exceptions/app_exception.dart';
import 'cart_screen_states.dart';
@injectable
class CartTabViewModel extends Cubit<CartTabStates>{
  AddToCartUseCase useCase;
  GetItemsCartUseCase getItemsCartUseCase;
  CartTabViewModel({required this.useCase,required this.getItemsCartUseCase}):super(CartTabInitialState());
  int numOfCartItems=0;
  List<GetProduct> productsList=[];
  static CartTabViewModel get(context) => BlocProvider.of<CartTabViewModel>(context);
 Future<void > addToCart(String productId) async {
   try {
     emit(AddCartTabLoadingState());
     var addCartResponse = await useCase.invoke(productId);
     numOfCartItems=addCartResponse.numOfCartItems??0;
     print("numOfCartItems:$numOfCartItems");
     emit(AddCartSuccessState(numOfCartItems: numOfCartItems));
   } on AppException catch (e) {
     emit(AddCartErrorState(message: e.errorMessage));
   }
 }
  Future<void > getItemsCart() async {
    try {
      emit(GetCartTabLoadingState());
      var getCartResponse = await getItemsCartUseCase.invoke();
      numOfCartItems=getCartResponse.numOfCartItems??0;
      productsList=getCartResponse.data!.products ??[];
      emit(GetCartSuccessState( getCart: getCartResponse.data!));
    } on AppException catch (e) {
      emit(GetCartErrorState(message: e.errorMessage));
    }
  }
}