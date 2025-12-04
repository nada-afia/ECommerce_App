import 'package:ecommerce/config/di.dart';
import 'package:ecommerce/core/custom_appbar.dart';
import 'package:ecommerce/core/custom_appbar_badge.dart';
import 'package:ecommerce/core/utilits/app%20routes.dart';
import 'package:ecommerce/core/utilits/app_color.dart';
import 'package:ecommerce/core/utilits/app_images.dart';
import 'package:ecommerce/features/ui/Home/tabs/cart/cubit/cart_screen_view_model.dart';
import 'package:ecommerce/features/ui/Home/tabs/products/cubit/product_tab_states.dart';
import 'package:ecommerce/features/ui/Home/tabs/products/cubit/product_tab_view_model.dart';
import 'package:ecommerce/features/ui/Home/tabs/products/product_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utilits/alert-dialog.dart';
import '../../../../../core/utilits/app_toast.dart';
import '../cart/cubit/cart_screen_states.dart';
import '../home/widgets/main_Error_widget.dart';
import '../home/widgets/new_loading_widget.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  ProductTabViewModel viewModel=getIt<ProductTabViewModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocListener<CartTabViewModel,CartTabStates>(
      listener: (context, state) {
        if(state is AddCartSuccessState){
          AppToast.showToastMsg(message: "Added Item Successfully",
              backgroundColor: Colors.green,
              textColor: AppColors.white);
        }else if(state is AddCartErrorState){
          AppToast.showToastMsg(message: state.message,
              backgroundColor:AppColors.red,
              textColor: AppColors.white);
        }
      },
      child: BlocBuilder<ProductTabViewModel,ProductTabStates>(
          bloc: viewModel,
          builder: (context, state) {
            if (state is ProductErrorState) {
              return MainErrorWidget(errorMessage: state.message);
            }
            else if (state is ProductSuccessState) {
              return SafeArea(
                child:Scaffold (
                  backgroundColor: AppColors.white,
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(120),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Image.asset(AppImages.routeIcon),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical:24.h),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "What do you search for?",
                                      prefixIcon: Image.asset(AppImages.searchIcon),
                                      filled: true,
                                      fillColor: AppColors.white,
                                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.r),
                                        borderSide: BorderSide(color: AppColors.blue, width: 1),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                CustomAppbarBadge(count: 5)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  body: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3.2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: state.productList!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.productRoute,arguments: state.productList![index]);
                              },
                              child: ProductTabItem(product: state.productList![index],),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return MainLoadingWidget();
            }
          },

      ),
    );
  }
}
