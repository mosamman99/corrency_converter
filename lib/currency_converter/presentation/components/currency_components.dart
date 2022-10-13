import 'package:flutter/material.dart';
import '../../../shared/ui/components.dart';
import '../../../shared/ui/ui_constants.dart';
import '../../domain/entities/currency.dart';

class CustomDropDown extends StatelessWidget {
  final Currency? selectedCurrency;
  final List<Currency> currencies;
  final Function(Currency? newValue) onChange;
  const CustomDropDown({Key? key,this.selectedCurrency,required this.onChange,required this.currencies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: UiConstants().borderColor,),borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<Currency>(
        value: selectedCurrency,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        hint: const CustomText(text: "   Select Currency",),
        style: TextStyle(color: UiConstants().textColor),
        underline: const SizedBox(),
        onChanged: onChange,
        items: currencies
            .map<DropdownMenuItem<Currency>>((Currency value) {
          return DropdownMenuItem<Currency>(
            value: value,
            child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(value.currencyName),
                )),
          );
        }).toList(),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  final Color? color;
  final int radius;
  final String text;
  final Color? textColor,borderColor;
  final Function()? onPressed;
  final double? width,height;
  final Widget? child;
  const CustomButton({Key? key,required this.text,this.onPressed,this.color,this.borderColor,this.radius = 35,this.textColor,this.width,this.child,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height??45,
          width: width??180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(double.parse("$radius")),
              color: color??UiConstants().buttonColor,
              border: borderColor==null?null:Border.all(color: borderColor!)
          ),
          alignment: Alignment.center,
          child: child??CustomText(text: text, fontSize: 16.0,fontWeight: FontWeight.w600,color: textColor??UiConstants().textColor,)),
    );
  }
}