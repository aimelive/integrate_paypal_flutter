import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:integrate_paypal_flutter/keys/keys.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          // color: Colors.blue,
          image: DecorationImage(
            image: AssetImage('assets/image.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset('assets/image.jpeg'),
                ),
                const SizedBox(height: 50),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UsePaypal(
                              sandboxMode: true,
                              clientId: Keys.clientId,
                              secretKey: Keys.secretKey,
                              returnURL: "https://samplesite.com/return",
                              cancelURL: "https://samplesite.com/cancel",
                              transactions: const [
                                {
                                  "amount": {
                                    "total": '10.12',
                                    "currency": "USD",
                                    "details": {
                                      "subtotal": '10.12',
                                      "shipping": '0',
                                      "shipping_discount": 0
                                    }
                                  },
                                  "description":
                                      "The payment transaction description.",
                                  // "payment_options": {
                                  //   "allowed_payment_method":
                                  //       "INSTANT_FUNDING_SOURCE"
                                  // },
                                  "item_list": {
                                    "items": [
                                      {
                                        "name": "CHANG-CHI Movie",
                                        "quantity": 1,
                                        "price": '10.12',
                                        "currency": "USD"
                                      }
                                    ],

                                    // shipping address is not required though
                                    // "shipping_address": {
                                    //   "recipient_name": "Jane Foster",
                                    //   "line1": "Travis County",
                                    //   "line2": "",
                                    //   "city": "Austin",
                                    //   "country_code": "US",
                                    //   "postal_code": "73301",
                                    //   "phone": "+00000000",
                                    //   "state": "Texas"
                                    // },
                                  }
                                }
                              ],
                              note:
                                  "Contact us for any questions on your order.",
                              onSuccess: (Map params) {
                                print(
                                  params['data']['payer']['payer_info']
                                      ['email'],
                                );
                                print(
                                  params['data']['payer']['payer_info']
                                      ['first_name'],
                                );
                                print(
                                  params['data']['payer']['payer_info']
                                      ['last_name'],
                                );
                              },
                              onError: (error) {
                                print("onError: $error");
                              },
                              onCancel: (params) {
                                print('cancelled: $params');
                              }),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                    ),
                    label: Text(
                      'Pay to Watch'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
