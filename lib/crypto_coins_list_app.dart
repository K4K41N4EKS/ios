import 'package:flutter/material.dart';
import 'package:second_lesson1/router/router.dart';
import 'package:second_lesson1/theme/theme.dart';

class CryptoWalletListApp extends StatelessWidget{
  const CryptoWalletListApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoWallet',
      theme: darkTheme,
      routes: routes,
    );
  }
}