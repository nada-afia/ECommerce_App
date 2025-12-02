import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utilits/app_color.dart';
import 'package:ecommerce/core/utilits/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/entities/response/products/product.dart';

class ProductTabItem extends StatelessWidget {
  final Product product;
  const ProductTabItem({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(16.h),
          border: Border.all(color: AppColors.blue,width: 2)
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CachedNetworkImage(
                    width: 191.w,
                    height: 237.h,
                    fit: BoxFit.cover,
                    imageUrl: product.imageCover??'',
                    placeholder: (context, url) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color:  AppColors.dark,
                        ),
                      );
                    },
                    errorWidget:  (context, url, error) => const Icon(
                      Icons.error,
                      color: AppColors.red,
                    ),
                 ),
           ),
                Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: CircleAvatar(
                  backgroundColor: AppColors.transparent,
                  radius: 20.r,
                  child: Center(
                    child: IconButton(onPressed: (){},
                        color: AppColors.blue,
                        iconSize: 30.r,
                        icon: Icon(Icons.favorite_border_rounded,
                          color: AppColors.blue,)),
                  ),
                ))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  product.title??'',
                  maxLines:1,
                  style:Theme.of(context).textTheme.titleMedium?.copyWith(
                    color:  AppColors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp
                  )
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    AutoSizeText(
                      "EGP ${product.price}",
                        maxLines:1,
                        style:Theme.of(context).textTheme.titleMedium?.copyWith(
                            color:  AppColors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp
                        )
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    AutoSizeText(
                      "EGP ${product.price!*2}",
                        maxLines:1,
                        style:AppStyles.blueReg11.copyWith(
                          decoration: TextDecoration.lineThrough
                        ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    AutoSizeText(
                      "Review (${product.ratingsAverage})",
                        maxLines:1,
                        style:Theme.of(context).textTheme.titleMedium?.copyWith(
                            color:  AppColors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp
                        )
                    ),
                    Icon(
                      Icons.star,
                      color:  AppColors.yellowColor,
                      size: 25.sp,
                    ),
                  ],
                )
              ],
            ) ,
            )
          ],
        ),
      ),
    );
  }
}
