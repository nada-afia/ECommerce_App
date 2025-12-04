import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utilits/app%20routes.dart';
import 'package:ecommerce/core/utilits/app_color.dart';
import 'package:ecommerce/core/utilits/app_images.dart';
import 'package:ecommerce/domain/entities/response/cart/getcart/get_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatefulWidget {
  GetProduct getCart;
  CartItem({super.key, required this.getCart});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productRoute);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Container(
          height: 142.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: AppColors.blue, width: 1),
          ),
          child: Row(
            children: [
              _buildImageContainer(
                  imageCover: widget.getCart.product!.imageCover ?? ""),
              Expanded(
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildItemHeader(
                        title: widget.getCart.product!.title ?? '',
                      ),
                      SizedBox(height: 5.h),
                      _buildItemPrice(
                        price:
                        widget.getCart.price?.toDouble() ?? 0.0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer({required String imageCover}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.blue, width: 1)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CachedNetworkImage(
          imageUrl: imageCover,
          width: 130.w,
          height: 140.h,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
              color: AppColors.yellowColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemHeader({required String title}) {
    return Row(
      children: [
        Expanded(
          child: AutoSizeText(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            minFontSize: 14,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
        ),
        IconButton(onPressed: (){}, icon:Image.asset(AppImages.delete))
      ],
    );
  }

  Widget _buildItemPrice({required double price}) {
    return Row(
      children: [
        Expanded(
          child: AutoSizeText(
            "EGP $price",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
        ),
        _buildQuantityControl(),
      ],
    );
  }

  Widget _buildQuantityControl() {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (itemCount > 1) {
                setState(() {
                  itemCount--;
                });
              }
            },
            icon: Icon(
              Icons.remove_circle_outline_rounded,
              color: AppColors.white,
              size: 25.sp,
            ),
          ),
          AutoSizeText(
            "$itemCount",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                itemCount++;
              });
            },
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.white,
              size: 25.sp,
            ),
          ),
        ],
      ),
    );
  }
}
