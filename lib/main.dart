import 'package:ecommerce/core/cach/shared_preferences.dart';
import 'package:ecommerce/core/my_bloc_observer.dart';
import 'package:ecommerce/core/utilits/app%20routes.dart';
import 'package:ecommerce/core/utilits/app_theme.dart';
import 'package:ecommerce/features/ui/Home/home_screen/home_screen.dart';
import 'package:ecommerce/features/ui/Home/tabs/cart/cubit/cart_screen_view_model.dart';
import 'package:ecommerce/features/ui/Home/tabs/products/product_tab_details.dart';
import 'package:ecommerce/features/ui/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/di.dart';
import 'features/ui/Home/tabs/cart/cart_screen.dart';
import 'features/ui/auth/register/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer= MyBlocObserver();
  await SharedPreferencesUtils.init();
  String routeName;
  var token = SharedPreferencesUtils.getData(key: 'token');
   token==null?routeName=AppRoutes.login:routeName=AppRoutes.home;
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>getIt<CartTabViewModel>()),

      ],
      child: MyApp(routeName:routeName,)));
}

class MyApp extends StatelessWidget {
  String routeName;
   MyApp({super.key,required this.routeName});

  @override
  Widget build(BuildContext context) {
     return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
       builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: routeName,
          routes: {
            AppRoutes.login: (context) => LoginScreen(),
            AppRoutes.register: (context) =>CreateAccount(),
            AppRoutes.home: (context) =>HomeScreen(),
            AppRoutes.productRoute: (context) =>ProductTabDetails(),
            AppRoutes.cart: (context) =>CartScreen()
          },
            theme: AppThem.lightMode,
        );
      },
    );
  }
}
