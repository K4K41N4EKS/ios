import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:second_lesson1/crypto_coins_list_app.dart';
import 'package:second_lesson1/repositories/crypto_coins/crypto_coins.dart';


void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => (CryptoCoinsRepository(dio: Dio())));
  runApp(const CryptoWalletListApp());
}
