import 'package:ecommerce/core/utilits/app_styles.dart';
import 'package:flutter/material.dart';

class MainErrorWidget extends StatelessWidget {
  final String errorMessage;
 final VoidCallback? onPressed;
  const MainErrorWidget({super.key, required this.errorMessage, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(errorMessage,style: AppStyles.blueMed18,),
        onPressed!=null?
        ElevatedButton(onPressed:onPressed, child: Text('Try Again',style:AppStyles.blueMed18 ,))
      : Container()
      ],
    );
  }
}
