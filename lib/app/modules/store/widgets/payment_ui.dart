import 'dart:io';

import 'package:checkout_screen_ui/checkout_ui.dart';
import 'package:flutter/material.dart';

class PaymentUI extends StatelessWidget {
  const PaymentUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckoutPage(
          data: CheckoutData(
        priceItems: [
          PriceItem(
            name: 'Module',
            quantity: 1,
            itemCostCents: 1920,
          ),
        ],
        taxRate: 0,
        payToName: 'Sankhyank Demo',
        displayNativePay: false,
        onNativePay: (checkoutResults) => print('Native Pay Clicked'),
        isApple: Platform.isAndroid,
        onCardPay: (paymentInfo, checkoutResults) {},
        onBack: () => Navigator.of(context).pop(),
      )),
    );
  }
}
