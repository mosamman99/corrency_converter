import 'package:currency_converter/currency_converter/presentation/components/currency_components.dart';
import 'package:currency_converter/currency_converter/presentation/controller/currency_cubit.dart';
import 'package:currency_converter/currency_converter/presentation/controller/currency_states.dart';
import 'package:currency_converter/shared/ui/components.dart';
import 'package:currency_converter/shared/ui/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/currency.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => CurrencyCubit()..getLocalCurrencies(),
        child: BlocBuilder<CurrencyCubit, CurrencyStates>(
            buildWhen: (_, state) =>
                state is CurrenciesLoadingState ||
                state is CurrenciesLoadedState ||
                state is CurrenciesErrorState,
            builder: (context, state) {
              final cubit = CurrencyCubit.get(context);
              if (state is CurrenciesLoadingState) {
                return const LoadingWidget();
              }

              if (state is CurrenciesErrorState) {
                return ErrorTextWidget(message: cubit.errorMessageModel.error);
              }

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                    ),
                    SizedBox(width: 180,child: TextField(controller: cubit.amountController,decoration: const InputDecoration(hintText: "Amount"),)),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<CurrencyCubit, CurrencyStates>(
                        buildWhen: (_, state) =>
                        state is SelectCurrency1ChangeState,
                        builder: (context, state) {
                          return CustomDropDown(
                            selectedCurrency: cubit.selectedCurrency1,
                            currencies: cubit.currencies,
                            onChange: (Currency? newValue) {
                              cubit.selectCurrency1(newValue);
                            }
                        );
                      }
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Icon(Icons.arrow_downward),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<CurrencyCubit, CurrencyStates>(
                        buildWhen: (_, state) =>
                        state is SelectCurrency2ChangeState,
                        builder: (context, state) {
                          return CustomDropDown(
                            selectedCurrency: cubit.selectedCurrency2,
                            currencies: cubit.currencies,
                            onChange: (Currency? newValue) {
                              cubit.selectCurrency2(newValue);
                            }
                        );
                      }
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    BlocBuilder<CurrencyCubit,CurrencyStates>(
                      buildWhen: (_,state) =>
                          state is ConvertLoadingState ||
                          state is ConvertLoadedState ||
                          state is ConvertErrorState,
                      builder: (context, state) {
                        if(state is ConvertLoadingState){
                          return const LoadingWidget();
                        }
                        return CustomButton(text: "Convert",borderColor: UiConstants().borderColor,onPressed: (){
                          cubit.convertCurrency();
                        },);
                      }
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    BlocBuilder<CurrencyCubit,CurrencyStates>(
                        buildWhen: (_,state) =>  state is ConvertLoadedState ,
                        builder: (context, state) {
                          return CustomText(text: "${cubit.convertResult}");
                        }
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
