import 'package:ecommerce/core/utilits/app_color.dart';
import 'package:ecommerce/core/utilits/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String hintText;
  final VoidCallback? onCartPressed;

  const SearchAppBar({super.key, this.hintText = "what do you search for?", this.onCartPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Image.asset(
            AppImages.routeIcon,
            height: 22.h,
            width: 66.w,
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 50.h,
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: Image.asset(AppImages.searchIcon),
                filled: true,
                fillColor: AppColors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: BorderSide(color: AppColors.blue, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: AppColors.blue, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: AppColors.blue, width: 2),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Stack(
            children: [
              Image.asset(AppImages.shoppingCartIcon),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 8.r,
                  backgroundColor: Colors.green,
                  child: Text('5', style: TextStyle(fontSize: 12, color: Colors.white)),
                ),
              ),
            ],
          ),
          onPressed: onCartPressed,
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
