import 'dart:convert';

import 'package:currency_converter/currency_converter/data/models/currencies_model.dart';
import 'package:currency_converter/shared/cash_helper.dart';
import 'package:currency_converter/shared/error/error_message_model.dart';

import '../../../shared/network_helper.dart';
import '../../domain/entities/currencies.dart';
import '../models/covert_result_model.dart';

abstract class BaseCurrenciesOnlineDataSource{
  Future<CurrenciesModel> fetchCurrencies();
  Future<CurrenciesModel> fetchLocalCurrencies();
  saveCurrencies(Currencies currencies);
  Future<ConvertResultModel> convertAmount(String amount);
}

class CurrenciesOnlineDataSource extends BaseCurrenciesOnlineDataSource{
  @override
  fetchCurrencies() async {
    Map<String,dynamic> response =  await NetworkHelper.repo("currencies?","get");
    if(response['status'] == null) {
      return CurrenciesModel.fromJson(response['results']);
    }else{
      throw ErrorMessageModel.fromJson(response);
    }
  }

  @override
  saveCurrencies(Currencies currencies) async {
    await CashHelper.setSavedString("currencies", jsonEncode(currencies.toJson(currencies)));
  }

  @override
  Future<CurrenciesModel> fetchLocalCurrencies() async {
    String encodedCurrencies = await CashHelper.getSavedString("currencies", "");
    if(encodedCurrencies != "") {
      Map<String,dynamic> response =  jsonDecode(encodedCurrencies);
      return CurrenciesModel.fromJson(response);
    }else{
      throw ErrorMessageModel.fromJson({"status": 401,"error": ""});
    }
  }

  @override
  Future<ConvertResultModel> convertAmount(String amount) async {
    Map<String,dynamic> response =  await NetworkHelper.repo("convert?q=$amount&compact=ultra&","get");
    if(response['status'] == null) {
      print('kjn kjdfnvdjfknv');
      return ConvertResultModel.fromJson(response);
    }else{
      throw ErrorMessageModel.fromJson(response);
    }
  }

}