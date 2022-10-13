abstract class CurrencyStates{}

class CurrencyInitState extends CurrencyStates{}

class CurrenciesLoadingState extends CurrencyStates{}
class CurrenciesLoadedState extends CurrencyStates{}
class CurrenciesErrorState extends CurrencyStates{}

class SelectCurrency1ChangeState extends CurrencyStates{}
class SelectCurrency2ChangeState extends CurrencyStates{}

class ConvertLoadingState extends CurrencyStates{}
class ConvertLoadedState extends CurrencyStates{}
class ConvertErrorState extends CurrencyStates{}
