import 'package:dio/dio.dart';
import 'package:second_lesson1/repositories/crypto_coins/crypto_coins.dart';
class CryptoCoinsRepository implements AbstractCoinsRepository{

  CryptoCoinsRepository({
    required this.dio
  });
  
  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final responce = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,TRX,USDT,USDC,TON,DOT,ADA&tsyms=USD,EUR'
    );
    final data = responce.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String,dynamic>;
    final cryptoCoinsList = dataRaw.entries
      .map((e) {
        final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String,dynamic>;
        final price = usdData['PRICE'];
        final imageUrl = usdData['IMAGEURL'];
        return CryptoCoin(
          name: e.key,
          priceInUSD: price,
          imageUrl:'https://www.cryptocompare.com/$imageUrl',
          );
        })
      .toList();
    return cryptoCoinsList;
  }
}