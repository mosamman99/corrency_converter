import 'package:currency_converter/currency_converter/domain/repository/base_currency_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/error/error_message_model.dart';
import '../../data/models/currencies_model.dart';

class LocalCurrencyUseCase{
  final BaseCurrencyRepository baseCurrencyRepository;

  LocalCurrencyUseCase(this.baseCurrencyRepository);
  Future<Either<ErrorMessageModel ,CurrenciesModel>> execute() async {
    return await baseCurrencyRepository.fetchLocalCurrencies();
  }
}