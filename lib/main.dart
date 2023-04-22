import 'package:flutter/material.dart';
import 'package:integrate_paypal_flutter/constants/color.dart';

import 'home.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay With PayPal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myColor,
      ),
      home: const HomePage(),
    );
  }
}
