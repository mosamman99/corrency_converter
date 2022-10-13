import 'package:currency_converter/currency_converter/domain/entities/convert_result.dart';

class ConvertResultModel extends ConvertResult{
  ConvertResultModel({required super.xcdALL, required super.allXCD});

   factory ConvertResultModel.fromJson(Map<String, dynamic> json) =>ConvertResultModel(
        allXCD: json['ALL_XCD']??0,
        xcdALL: json['XCD_ALL']??0
  );
}