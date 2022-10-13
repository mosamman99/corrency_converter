
class Currency {
  final String currencyName;
  final String currencySymbol;
  final String id;

  const Currency({
    required this.currencyName,
    required this.currencySymbol,
    required this.id,
  });

  Map<String, dynamic> toJson(Currency currency){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currencyName'] = currency.currencyName;
    data['currencySymbol'] = currency.currencySymbol;
    data['id'] = currency.id;
    return data;
  }
}