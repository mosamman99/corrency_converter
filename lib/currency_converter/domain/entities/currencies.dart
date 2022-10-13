import 'currency.dart';

class Currencies{
  final Currency aLL;
  final Currency xCD;


  const Currencies({
    required this.aLL,
    required this.xCD,
  });

  Map<String, dynamic> toJson(Currencies currencies){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ALL'] = currencies.aLL.toJson(currencies.aLL);
    data['XCD'] = currencies.aLL.toJson(currencies.xCD);
    return data;
  }

}
