import 'package:ecommerce/features/ui/Home/home_screen/cubit/home_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../tabs/categore_tab.dart';
import '../../tabs/fav_tab.dart';
import '../../tabs/home/home_tab.dart';
import '../../tabs/user_tab.dart';
@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeInitialState());
  int selectedIndex = 0;
  List<Widget> tabsList = [
    HomeTab(),
    CategoryTab(),
    FavouriteTab(),
    UserTab(),
  ];
  void bottomNavOnTap(int index){
    selectedIndex =index;
    emit(ChangeSelectedIndexState());
  }

}