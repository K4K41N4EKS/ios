import 'package:second_lesson1/features/crypto_coin/crypto_coin.dart';
import 'package:second_lesson1/features/crypto_list/crypto_list.dart';

final routes = {
  '/' : (context) => const CryptoListScreen(title: 'CryptoWallet'), 
  '/coin': (context) => const CryptoCoinScreen(),
}; 