import 'package:ecommerce/core/utilits/app%20routes.dart';
import 'package:ecommerce/core/utilits/app_color.dart';
import 'package:ecommerce/core/utilits/app_images.dart';
import 'package:ecommerce/features/ui/Home/tabs/cart/cubit/cart_screen_states.dart';
import 'package:ecommerce/features/ui/Home/tabs/cart/cubit/cart_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbarBadge extends StatelessWidget {
  final int count;
  const CustomAppbarBadge({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    final currentRoute=ModalRoute.of(context)?.settings.name;
    return InkWell(
      onTap: currentRoute != AppRoutes.cart ? () {
        Navigator.of(context).pushNamed(AppRoutes.cart);
      } : null,
      child: Material(
        color: Colors.transparent,
        child: BlocBuilder<CartTabViewModel, CartTabStates>(
          builder: (context, state) {
            final vm = CartTabViewModel.get(context);
            return Badge(
              alignment: AlignmentDirectional.topStart,
              backgroundColor: Colors.green,
              label: Text(vm.numOfCartItems.toString()),
              child: ImageIcon(
                const AssetImage(AppImages.shoppingCartIcon),
                size: 35.sp,
                color: AppColors.blue,
              ),
            );
          },
        ),
      ),
    );

  }
}
