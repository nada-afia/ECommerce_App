import 'package:ecommerce/features/ui/Home/tabs/home/widgets/main_Error_widget.dart';
import 'package:ecommerce/features/ui/Home/tabs/home/widgets/new_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilits/app_color.dart';
import '../../../../../core/utilits/app_images.dart';
import '../../../../../core/utilits/app_styles.dart';
import 'cart_item.dart';
import 'cubit/cart_screen_states.dart';
import 'cubit/cart_screen_view_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CartTabViewModel.get(context).getItemsCart();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(context),
      body: BlocBuilder<CartTabViewModel,CartTabStates>(
        builder: (context, state) {
        if(state is GetCartErrorState){
          return MainErrorWidget(errorMessage: state.message);
        }else if(state is GetCartSuccessState){
          return Column(
            children: [
              Expanded(child: ListView.builder(
                  itemCount: state.getCart.products?.length ?? 0,
                  itemBuilder: (context, index) {
                    return  CartItem(getCart: state.getCart.products![index],);
                  }
              )),

            ],
          );
        }else{
          return const MainLoadingWidget();
        }
        },
      )
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: Text(
        "Cart",
        style: AppStyles.blueMed20,
      ),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: Image.asset(AppImages.searchIcon)),
        IconButton(
            onPressed: () {}, icon: Image.asset(AppImages.shoppingCartIcon)),
      ],
    );
  }

  Widget _buildCheckOut(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 50.h,left: 16.w,right: 16.w),
      child: Row(
        children: [

        ],
      )
    );
  }
}
