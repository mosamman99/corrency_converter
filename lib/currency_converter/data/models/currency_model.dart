import 'package:currency_converter/currency_converter/domain/entities/currency.dart';

class CurrencyModel extends Currency {
  CurrencyModel(
      {required super.id,
      required super.currencyName,
      required super.currencySymbol});

  factory CurrencyModel.fromJson(Map<String,dynamic> json) => CurrencyModel(
       id: json['id'],
       currencyName: json['currencyName'],
       currencySymbol: json['currencySymbol']
    );
}
