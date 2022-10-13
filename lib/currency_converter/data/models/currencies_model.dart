import 'package:currency_converter/currency_converter/data/models/currency_model.dart';

import '../../domain/entities/currencies.dart';

class CurrenciesModel extends Currencies {

  const CurrenciesModel({
  required super.aLL,
  required super.xCD,
});

  factory CurrenciesModel.fromJson(Map<String, dynamic> json) => CurrenciesModel(
          aLL: CurrencyModel.fromJson(json['ALL']),
          xCD: CurrencyModel.fromJson(json['XCD'])
      );
}