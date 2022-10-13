import 'package:currency_converter/currency_converter/domain/entities/currency.dart';
import 'package:currency_converter/currency_converter/domain/usecase/convert_usecase.dart';
import 'package:currency_converter/currency_converter/domain/usecase/save_currencies_usecase.dart';
import 'package:currency_converter/shared/ui/ui_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import '../../../shared/error/error_message_model.dart';
import '../../data/datasource/currencies_online_data_source.dart';
import '../../data/models/covert_result_model.dart';
import '../../data/models/currencies_model.dart';
import '../../data/repository/currency_repository.dart';
import '../../domain/repository/base_currency_repository.dart';
import '../../domain/usecase/currency_usecase.dart';
import '../../domain/usecase/local_currencies_usecase.dart';
import 'currency_states.dart';

class CurrencyCubit extends Cubit<CurrencyStates>{
  CurrencyCubit(): super(CurrencyInitState());
  static CurrencyCubit get(context) => BlocProvider.of(context);

  BaseCurrenciesOnlineDataSource baseCurrenciesOnlineDataSource = CurrenciesOnlineDataSource();
  // fetch currencies
  List<Currency> currencies = [];
  late ErrorMessageModel errorMessageModel;
  Currency? selectedCurrency1,selectedCurrency2;
  getLocalCurrencies() async{
    emit(CurrenciesLoadingState());
    BaseCurrencyRepository baseCurrencyRepository = CurrencyRepository(baseCurrenciesOnlineDataSource);
    final Either<ErrorMessageModel ,CurrenciesModel> result = await LocalCurrencyUseCase(baseCurrencyRepository).execute();
    result.fold((l) {
      getCurrencies();
    }, (r) {
      SaveCurrenciesUseCase(baseCurrencyRepository).execute(r);
      currencies.add(r.aLL);
      currencies.add(r.xCD);
      emit(CurrenciesLoadedState());
    });
  }
  getCurrencies() async {
    BaseCurrencyRepository baseCurrencyRepository = CurrencyRepository(baseCurrenciesOnlineDataSource);
    final Either<ErrorMessageModel ,CurrenciesModel> result = await CurrencyUseCase(baseCurrencyRepository).execute();
    result.fold((l) {
      errorMessageModel = l;
      emit(CurrenciesErrorState());
    }, (r) {
      SaveCurrenciesUseCase(baseCurrencyRepository).execute(r);
      currencies.add(r.aLL);
      currencies.add(r.xCD);
      emit(CurrenciesLoadedState());
    });
  }

  //change ui states
  selectCurrency1(value){
    selectedCurrency1 = value;
    emit(SelectCurrency1ChangeState());
  }

  selectCurrency2(value){
    selectedCurrency2 = value;
    emit(SelectCurrency2ChangeState());
  }

  // convert amount
  var amountController = TextEditingController();
  double convertResult = 0;
  convertCurrency() async {
    bool dataValidated = validate();
    if(dataValidated){
    emit(ConvertLoadingState());
    BaseCurrencyRepository baseCurrencyRepository = CurrencyRepository(baseCurrenciesOnlineDataSource);
    final Either<ErrorMessageModel ,ConvertResultModel> result = await ConvertUseCase(baseCurrencyRepository).execute("${selectedCurrency1!.id}_${selectedCurrency2!.id}");
    result.fold((l) {
      showToast(l.error,backgroundColor: UiConstants().errorColor,textPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10));
      emit(ConvertErrorState());
    }, (r) {
        if(r.xcdALL != 0){
        convertResult = r.xcdALL*double.parse(amountController.text);
      }else{
        convertResult = r.allXCD*double.parse(amountController.text);
      }
      showToast("Your amount converted successfully",backgroundColor: UiConstants().successColor,textPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10));
      emit(ConvertLoadedState());
    });
    }
  }

  validate(){
    if(amountController.text.isEmpty){
      showToast("Please enter an amount",backgroundColor: UiConstants().errorColor,textPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10));
      return false;
    }
    if(selectedCurrency1 == null){
      showToast("Please enter the first currency",backgroundColor: UiConstants().errorColor,textPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10));
      return false;
    }
    if(selectedCurrency2 == null){
      showToast("Please enter the second currency",backgroundColor: UiConstants().errorColor,textPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10));
      return false;
    }
    return true;
  }
}