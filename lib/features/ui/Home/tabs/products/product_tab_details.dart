import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/core/utilits/app_color.dart';
import 'package:ecommerce/core/utilits/app_images.dart';
import 'package:ecommerce/core/utilits/app_styles.dart';
import 'package:ecommerce/domain/entities/response/products/product.dart';
import 'package:ecommerce/features/ui/Home/tabs/products/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductTabDetails extends StatefulWidget {
  const ProductTabDetails({super.key});

  @override
  State<ProductTabDetails> createState() => _ProductTabDetailsState();
}

class _ProductTabDetailsState extends State<ProductTabDetails> {
  int productCounter = 0;
  int selectedColor = 0;
  int selectedSize = 0;
  int totalPrice = 0;
  List<int> sizes = [35, 38, 40, 43];
  List<Color>color = [
    Colors.brown,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.pink
  ];
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    var product = ModalRoute
        .of(context)!
        .settings
        .arguments as Product;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "ProductDetails",
          style: AppStyles.blueMed20,
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset(AppImages.searchIcon)),
          IconButton(
              onPressed: () {}, icon: Image.asset(AppImages.shoppingCartIcon)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: 16.w, right: 16.w, bottom: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: Colors.blue.shade100, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: ProductSlider(
                            initialIndex: 0,
                            items: product.images!,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 2,
                                  )
                                ],
                              ),
                              child: Image.asset(AppImages.unHeartIcon),
                            ),
                          ),
                        )
                      ])),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(product.title ?? '',
                        style: AppStyles.blueBold20,)
                  ),
                  Text("EGP ${product.price}",
                    style: AppStyles.blueBold20,),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.blue.withOpacity(.3),
                            width: 1
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 8.h),
                      child: Text("${product.sold} Sold"
                        , overflow: TextOverflow.ellipsis,
                        style: AppStyles.blueReg12,
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Icon(
                      Icons.star,
                      color: AppColors.yellowColor,
                      size: 25.sp,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Expanded(child: Text(
                      "${product.ratingsAverage} (${product.ratingsQuantity})"
                      , overflow: TextOverflow.ellipsis,
                      style: AppStyles.blueReg12,
                    ),
                    ),
                    _buildQuantityControl(),
                  ]
              ),
              SizedBox(
                height: 8.h,
              ),
              Text("Description",
                style: AppStyles.blueBold20,
              ),
              SizedBox(height: 8.h,),
              ReadMoreText(
                product.description ?? '',
                trimMode: TrimMode.Line,
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimCollapsedText: 'Read more',
                trimExpandedText: 'Read less',
                moreStyle: AppStyles.blueBold14,
              ),
              SizedBox(height: 16.h,),
               Text("Size",style: AppStyles.blueBold20,),
               SizedBox(height: 8.h,),
               _buildSizeSection(),
               SizedBox(height: 16.h,),
               Text("Color",style: AppStyles.blueBold20,),
              SizedBox(height: 8.h,),
               _buildColorSection(),
              SizedBox(height: 16.h,),
               _buildPriceSection(product: product),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSizeSection() {
    return Row(
      children: sizes.map((size) {
        bool isSelected = size == selectedSize;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = size;
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: 10.w),
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.blue : Colors.transparent,
              border: Border.all(color: AppColors.blue),
            ),
            child: Text(
              "$size",
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.blue,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
  Widget _buildColorSection() {
    return Row(
      children: color.map((c) {
        bool isSelected = c == color[selectedColor];

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedColor = color.indexOf(c);
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: 12.w),
            width: 35.w,
            height: 35.w,
            decoration: BoxDecoration(
              color: c,
              shape: BoxShape.circle,
            ),

            child: isSelected
                ? Center(
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 20.sp,
              ),
            )
                : null,
          ),
        );
      }).toList(),
    );
  }
  Widget _buildPriceSection({required Product product}) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total price", style: AppStyles.blueMed16),
              SizedBox(height: 5.h),
              Text(
                "EGP ${product.price}",
                style: AppStyles.blueBold20,
              ),
            ],
          ),
        ),

        Expanded(
          flex: 3,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blue,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
            onPressed: () {},
            icon: Image.asset(AppImages.addToCart),
            label: Text("Add to cart", style: AppStyles.whiteBold16),
          ),
        ),
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
