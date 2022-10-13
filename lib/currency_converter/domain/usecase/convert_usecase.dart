import 'package:currency_converter/currency_converter/data/models/covert_result_model.dart';
import 'package:currency_converter/currency_converter/domain/repository/base_currency_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/error/error_message_model.dart';

class ConvertUseCase{
  final BaseCurrencyRepository baseCurrencyRepository;

  ConvertUseCase(this.baseCurrencyRepository);
  Future<Either<ErrorMessageModel ,ConvertResultModel>> execute(String amount) async {
    return await baseCurrencyRepository.convert(amount);
  }
}