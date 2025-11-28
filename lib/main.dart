import 'package:ecommerce/core/my_bloc_observer.dart';
import 'package:ecommerce/core/utilits/app%20routes.dart';
import 'package:ecommerce/core/utilits/app_theme.dart';
import 'package:ecommerce/features/ui/Home/home_screen/home_screen.dart';
import 'package:ecommerce/features/ui/auth/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/di.dart';
import 'features/ui/auth/register/register_screen.dart';

void main(){
  configureDependencies();
  Bloc.observer= MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
       builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.home,
          routes: {
            AppRoutes.login: (context) => LoginScreen(),
            AppRoutes.register: (context) =>CreateAccount(),
            AppRoutes.home: (context) =>HomeScreen(),
          },
            theme: AppThem.lightMode,
        );
      },
    );
  }
}
