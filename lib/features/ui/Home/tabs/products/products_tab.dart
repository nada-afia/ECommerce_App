import 'package:ecommerce/config/di.dart';
import 'package:ecommerce/core/utilits/app%20routes.dart';
import 'package:ecommerce/features/ui/Home/tabs/products/cubit/product_tab_states.dart';
import 'package:ecommerce/features/ui/Home/tabs/products/cubit/product_tab_view_model.dart';
import 'package:ecommerce/features/ui/Home/tabs/products/product_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return  BlocBuilder<ProductTabViewModel,ProductTabStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is ProductErrorState) {
            return MainErrorWidget(errorMessage: state.message);
          }
          else if (state is ProductSuccessState) {
            return SafeArea(
              child: Column(
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
                            Navigator.pushNamed(context, AppRoutes.productRoute);
                          },
                          child: ProductTabItem(product: state.productList![index],),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return MainLoadingWidget();
          }
        },

    );
  }
}
