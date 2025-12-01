import 'package:ecommerce/domain/entities/response/common/category_or_brands.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../core/utilits/app_color.dart';

class CategoryBrandItem extends StatelessWidget {
  CategoryOrBrands item;
 CategoryBrandItem({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CachedNetworkImage(
            imageUrl: item.image??'',
            width: double.infinity,
            height: 10.h,
            fit: BoxFit.cover,

            imageBuilder: (context, imageProvider) {
              return CircleAvatar(
                backgroundImage: imageProvider,
                radius: 50.r,
              );
            },
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.blue,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(
                Icons.error,
              color: AppColors.red,
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
            flex: 4,
            child: Text(item.name??'',
            textWidthBasis: TextWidthBasis.longestLine,
              softWrap: true,
              textAlign: TextAlign.center,
            ))
      ],
    );
  }
}
