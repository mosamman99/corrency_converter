import 'package:currency_converter/currency_converter/data/models/covert_result_model.dart';
import 'package:currency_converter/currency_converter/domain/entities/currencies.dart';
import 'package:currency_converter/currency_converter/domain/repository/base_currency_repository.dart';
import 'package:currency_converter/shared/error/error_message_model.dart';
import 'package:dartz/dartz.dart';

import '../datasource/currencies_online_data_source.dart';
import '../models/currencies_model.dart';

class CurrencyRepository extends BaseCurrencyRepository{
  final BaseCurrenciesOnlineDataSource baseCurrenciesOnlineDataSource;

  CurrencyRepository(this.baseCurrenciesOnlineDataSource);
  @override
  Future<Either<ErrorMessageModel ,CurrenciesModel>> fetchCurrencies() async {
    try {
      final result = await baseCurrenciesOnlineDataSource.fetchCurrencies();
      return Right(result);
    } on ErrorMessageModel catch(e){
      return Left(ErrorMessageModel(status: e.status, error: e.error));
    }
  }

  @override
  saveCurrencies(Currencies currencies) {
    baseCurrenciesOnlineDataSource.saveCurrencies(currencies);
  }

  @override
  Future<Either<ErrorMessageModel, CurrenciesModel>> fetchLocalCurrencies() async {
    try {
      final result = await baseCurrenciesOnlineDataSource.fetchLocalCurrencies();
      return Right(result);
    } on ErrorMessageModel catch(e){
      return Left(ErrorMessageModel(status: e.status, error: e.error));
    }
  }

  @override
  Future<Either<ErrorMessageModel, ConvertResultModel>> convert(String amount) async {
    try {
      final result = await baseCurrenciesOnlineDataSource.convertAmount(amount);
      return Right(result);
    } on ErrorMessageModel catch(e){
      return Left(ErrorMessageModel(status: e.status, error: e.error));
    }
  }
}