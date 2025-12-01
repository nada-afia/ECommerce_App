import 'package:ecommerce/config/di.dart';
import 'package:ecommerce/core/utilits/app_color.dart';
import 'package:ecommerce/core/utilits/app_styles.dart';
import 'package:ecommerce/domain/entities/response/common/category_or_brands.dart';
import 'package:ecommerce/features/ui/Home/tabs/home/category_brand_item.dart';
import 'package:ecommerce/features/ui/Home/tabs/home/cubit/home_tab_states.dart';
import 'package:ecommerce/features/ui/Home/tabs/home/cubit/home_tab_view_model.dart';
import 'package:ecommerce/features/ui/Home/tabs/home/widgets/main_Error_widget.dart';
import 'package:ecommerce/features/ui/Home/tabs/home/widgets/new_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel=getIt<HomeTabViewModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getCategories();
    viewModel.getBrands();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:17.h,vertical: 112.w),
        child: Column(
          mainAxisSize:  MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),

            _buildAnnouncement(images :viewModel.images),
            SizedBox(
              height: 24.h,
            ),
            _lineBreak(name: "Categories"),
            BlocBuilder<HomeTabViewModel,HomeTabStates>(
                bloc: viewModel,
                builder: (context, state) {
                  if(state is CategoriesErrorState){
                    return MainErrorWidget(errorMessage: state.message);}
                  else if(state is HomeTabSuccessState){
                    return  _buildCategoryBrandSec(list: state.categoryList??[]);
                  }else{
                    return MainLoadingWidget();
                  }
                },
               //child: _buildCategoryBrandSec(const CategoryBrandItem())
            ),
            _lineBreak(name: "Brands"),
           BlocBuilder<HomeTabViewModel,HomeTabStates>(
             bloc: viewModel,
               builder: (context, state) {
                 if(state is BrandsErrorState){
                   return MainErrorWidget(errorMessage: state.message);
                 }
                 else if(state is HomeTabSuccessState){
                   return  _buildCategoryBrandSec(list: state.brandsList??[]);
                 }else{
                   return MainLoadingWidget();
                 }
               },
               //child: _buildCategoryBrandSec(const CategoryBrandItem())
             ),
          ],
        ),
      ),
    );
  }

  ImageSlideshow _buildAnnouncement({
    required List<String> images,
}){
 return ImageSlideshow(
   indicatorColor: AppColors.blue,
   initialPage: 0,
   indicatorBottomPadding: 15.h,
   indicatorRadius: 5,
   indicatorPadding: 8.h,
   indicatorBackgroundColor: AppColors.white,
   isLoop: true,
   autoPlayInterval: 3000,
   height: 190.h,
   children: images.map((url){
     return Image.asset(
       url,
       fit: BoxFit.fill,
     );
   }).toList()


 );
  }

  Widget _lineBreak({required String name}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name,style:AppStyles.blueBold20,),
        TextButton(onPressed: (){},
            child: Text("View All",style: AppStyles.blueReg12,))
      ],
    );
  }

  SizedBox _buildCategoryBrandSec({required List<CategoryOrBrands>list}){
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child:  GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,mainAxisSpacing: 16.h,crossAxisSpacing:16.h,
          ),
      itemCount: list.length,
        scrollDirection: Axis.horizontal,
        physics:  const ScrollPhysics(),
        itemBuilder: (context, index) {
          return CategoryBrandItem(item: list[index],);
        },
      ),
    );
  }
}
