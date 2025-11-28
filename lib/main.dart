import 'package:ecommerce/core/utilits/app%20routes.dart';
import 'package:ecommerce/features/ui/auth/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/di.dart';
import 'features/ui/auth/register/register_screen.dart';

void main(){
  configureDependencies();
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
          initialRoute: AppRoutes.login,
          routes: {
            AppRoutes.login: (context) => LoginScreen(),
            AppRoutes.register: (context) =>CreateAccount(),
          },
        );
      },
    );
  }
}
