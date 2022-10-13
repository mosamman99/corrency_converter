
import 'package:dartz/dartz.dart';

import '../../../shared/error/error_message_model.dart';
import '../../data/models/covert_result_model.dart';
import '../../data/models/currencies_model.dart';
import '../entities/currencies.dart';

abstract class BaseCurrencyRepository{
  Future<Either<ErrorMessageModel ,CurrenciesModel>> fetchCurrencies();
  Future<Either<ErrorMessageModel ,CurrenciesModel>> fetchLocalCurrencies();
  saveCurrencies(Currencies currencies);
  Future<Either<ErrorMessageModel ,ConvertResultModel>> convert(String amount);

}