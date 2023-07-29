import 'package:crypto_price_tracker_app/data/models/crypto_coin/crypto_coin.dart';
import 'package:dio/dio.dart';

class CryptoService {
  CryptoService({
    required this.dio,
  });

  final Dio dio;

  Future<List<CryptoCoin>> getMostVisited() async {
    try {
      final response = await dio.get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true',
      );

      if (response.statusCode == 200) {
        final cryptoList = response.data as List<dynamic>;
        return cryptoList.map((e) {
          final cryptoCoin = CryptoCoin.fromJson(e);
          return cryptoCoin;
        }).toList();
      } else {
        throw Exception(response.data);
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
