import 'package:currency_converter/shared/ui/ui_constants.dart';
import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign? textAlign;
  final FontWeight fontWeight;
  final Color? color;
  final TextDecoration? textDecoration;
  const CustomText({Key? key,required this.text,this.fontSize = 14,this.textAlign = TextAlign.center,this.fontWeight = FontWeight.w400,this.color,this.textDecoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,textAlign: textAlign,style: TextStyle(color: color??UiConstants().textColor,fontSize: fontSize,fontWeight: fontWeight,decoration: textDecoration),textDirection: TextDirection.ltr,);
  }
}


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

}


class ErrorTextWidget extends StatelessWidget {
  final String message;
  const ErrorTextWidget({Key? key,required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CustomText(text: message ,fontSize: 18,),
    );
  }
}