import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di.dart';
import '../../../../core/custom_text_field.dart';
import '../../../../core/utilits/alert-dialog.dart';
import '../../../../core/utilits/validator.dart';
import '../auth_states.dart';
import 'cubit/register_view_model.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController repassController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  RegisterViewModel viewModel = getIt<RegisterViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, AuthStates>(
      bloc: viewModel,
      listener:(context, state) {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading...');
        } else if (state is AuthErrorState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(context: context, message: state.errorMessage);
        } else if (state is AuthSuccessState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(context: context, message: 'Register Successfully', posActionName: 'ok');
        }
      },
        child: Scaffold(
          backgroundColor: const Color(0xFF0B4A80),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: 20),

                      Center(
                        child: Text(
                          "Route",
                          style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // -------- Full Name --------
                      Text(
                        "Full Name",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        hintText: "enter your full name",
                        controller: nameController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),
                      Text(
                        "phone",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        hintText: "enter your full name",
                        controller: phoneController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please enter your number";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),
                      // -------- Email --------
                      Text(
                        "E-mail address",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        controller: emailController,
                        hintText: "enter your email address",
                        prefixIcon: Icon(Icons.email),
                        validator: (value) =>  Validator.validateEmail( value),
                      ),

                      const SizedBox(height: 20),

                      // -------- Password --------
                      Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        controller: passController,
                        hintText: "enter your password",
                        prefixIcon: Icon(Icons.lock),
                        obscureText: true,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // -------- Confirm Password --------
                      Text(
                        "Re-enter Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        hintText: "re-enter your password",
                        controller: repassController,
                        prefixIcon: Icon(Icons.lock),
                        obscureText: true,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please confirm password';
                          }
                          if (text != passController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 40),

                      // ---------- Sign Up Button ----------
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed:(){
                            viewModel.register(name: nameController.text,
                                email: emailController.text,
                                password: passController.text, rePassword: repassController.text,
                                phone: phoneController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              color: Color(0xFF0B4A80),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // -------- Already have account --------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }

  void hideMyLoading() {
    // TODO: implement hideMyLoading
    DialogUtils.hideLoading(context: context);
  }


  void showMyLoading({required String message}) {
    // TODO: implement showMyLoading
    DialogUtils.showLoading(context: context, message: message);
  }

  void showMyMessage({required String message}) {
    // TODO: implement showMyMessage
    DialogUtils.showMessage(context: context, message: message);
  }
}
