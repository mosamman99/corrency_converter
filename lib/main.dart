import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'currency_converter/presentation/screens/currencies_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (BuildContext context, Widget? widget) {
        return OKToast(child: widget!);
      },
      title: 'Currency Converter',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: const CurrenciesScreen(),
    );
  }
}
