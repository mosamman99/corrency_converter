import 'package:currency_converter/currency_converter/domain/entities/currencies.dart';

import '../repository/base_currency_repository.dart';

class SaveCurrenciesUseCase{
  final BaseCurrencyRepository baseCurrencyRepository;

  SaveCurrenciesUseCase(this.baseCurrencyRepository);
  execute(Currencies currencies) async {
    return await baseCurrencyRepository.saveCurrencies(currencies);
  }
}