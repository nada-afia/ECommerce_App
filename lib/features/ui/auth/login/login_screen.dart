import 'package:ecommerce/core/cach/shared_preferences.dart';
import 'package:ecommerce/core/custom_elevated_btn.dart';
import 'package:ecommerce/core/utilits/app%20routes.dart';
import 'package:ecommerce/core/utilits/app_color.dart';
import 'package:ecommerce/core/utilits/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/di.dart';
import '../../../../core/custom_text_button.dart';
import '../../../../core/custom_text_field.dart';
import '../../../../core/utilits/alert-dialog.dart';
import '../../../../core/utilits/app_images.dart';
import '../../../../core/utilits/app_styles.dart';
import '../auth_states.dart';
import 'cubit/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, AuthStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading...');
        } else if (state is AuthErrorState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(context: context, message: state.errorMessage);
        } else if (state is AuthSuccessState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(context: context, message: 'Login Successfully', posActionName: 'ok',posAction: (){
            SharedPreferencesUtils.saveData(key: 'token', value: state.authResponse.token??'');
            Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          });
        }
      },
      child: Scaffold(
        backgroundColor:AppColors.blue,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal:17.w ,vertical: 97.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Center(
                    child: Image.asset(AppImages.routeLogo)
                  ),
                  SizedBox(height: 86.9.h),
                   Text(
                    "Welcome Back To Route",
                    style:AppStyles.whiteSemiBold24
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Please sign in with your mail",
                    style: AppStyles.whiteLight16,
                  ),
                  SizedBox(height:40.h ,),
                  Text(
                    "User Name",
                    style: AppStyles.whiteMed18,
                  ),
                  SizedBox(height: 24.h,),
                  Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          hintText: 'enter your email',
                          controller: emailController,
                          validator:(value) =>  Validator.validateEmail(value),
                         keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 32.h),
                        Text(
                          "Password",
                          style: AppStyles.whiteMed18,
                        ),
                        SizedBox(height: 24.h,),
                        CustomTextField(
                          hintText: 'Password',
                          controller: passController,
                          suffixIcon: Icon(Icons.visibility_off),
                          validator: (value) =>  Validator.validatePassword(value),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:16.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomTextButton(text: 'Forgot password',
                      onPressed: () {  }, styleText: AppStyles.whiteReg18,)
                  ),
                  SizedBox(height:56.h),
                  CustomElevatedButton(onPressed: (){
                    viewModel.login(passController.text,emailController.text.trim());
                  },
                    backgroundColor: AppColors.white,text:'Login',
                    textStyle:AppStyles.blueSemiBold20 ,),
                  SizedBox(height:   32.h),
                  CustomTextButton(text:' Don’t have an account? Create Account',
                      onPressed: (){Navigator.pushNamed(context, AppRoutes.register);},
                      styleText: AppStyles.whiteMed18)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void hideMyLoading() => DialogUtils.hideLoading(context: context);

  void showMyLoading({required String message}) => DialogUtils.showLoading(context: context, message: message);

  void showMyMessage({required String message}) => DialogUtils.showMessage(context: context, message: message, posActionName: "ok");
}