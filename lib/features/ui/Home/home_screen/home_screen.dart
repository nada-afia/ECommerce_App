import 'package:ecommerce/config/di.dart';
import 'package:ecommerce/features/ui/Home/home_screen/cubit/home_screen_states.dart';
import 'package:ecommerce/features/ui/Home/home_screen/cubit/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utilits/app_color.dart';
import '../../../../core/utilits/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  HomeScreenViewModel viewModel=getIt<HomeScreenViewModel>();


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeScreenViewModel,HomeScreenStates>(
      bloc:viewModel,
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: viewModel.tabsList[viewModel.selectedIndex],
              ),
              Positioned(
                left: width * 0.03,
                right: width * 0.03,
                bottom: height * 0.01,
                child: SafeArea(
                  top: false,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        splashColor: AppColors.transparentColor,
                        highlightColor: AppColors.transparentColor,
                        hoverColor: AppColors.transparentColor,
                      ),
                      child: BottomNavigationBar(
                        selectedItemColor: AppColors.white,
                        unselectedItemColor: AppColors.white.withOpacity(0.6),
                        backgroundColor: AppColors.blue,
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        currentIndex: viewModel.selectedIndex,
                        type: BottomNavigationBarType.fixed,
                        onTap:viewModel.bottomNavOnTap,
                        items: [
                          buildBottomNavBarItem(
                            isSelected: viewModel.selectedIndex==0,
                            selectedIcon: AppImages.homeIcon,
                            unselected: AppImages.unHomeIcon,
                          ),
                          buildBottomNavBarItem(
                            isSelected: viewModel.selectedIndex==1,
                            selectedIcon: AppImages.unCategoryIcon,
                            unselected: AppImages.categoryIcon,
                          ),
                          buildBottomNavBarItem(
                            isSelected: viewModel.selectedIndex==2,
                            selectedIcon: AppImages.unHeartIcon,
                            unselected: AppImages.heartIcon,
                          ),
                          buildBottomNavBarItem(
                            isSelected: viewModel.selectedIndex==3,
                            selectedIcon: AppImages.unUserIcon,
                            unselected: AppImages.userIcon,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },

    );
  }

  BottomNavigationBarItem buildBottomNavBarItem({
    required bool isSelected,
    required String selectedIcon,
    required String unselected,
  }) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        foregroundColor: isSelected? AppColors.blue:AppColors.white,
        backgroundColor: isSelected?AppColors.white: AppColors.transparent ,
        radius: 25,
       child:  Image.asset(
         isSelected ?selectedIcon:unselected,
       )
      ),
      label: '',
    );
  }
}
