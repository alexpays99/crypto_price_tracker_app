import 'package:crypto_price_tracker_app/data/models/all_time_coin_market_data/all_time_coin_market_data.dart';
import 'package:crypto_price_tracker_app/data/models/crypto_coin/crypto_coin.dart';
import 'package:crypto_price_tracker_app/utils/coingecko_api_constants.dart';
import 'package:dio/dio.dart';

class CryptoService {
  CryptoService({
    required this.dio,
  });

  final Dio dio;

  Future<List<CryptoCoin>> getMostVisited() async {
    try {
      final response = await dio.get(
        '${CoinGeckoApiConstants.allCoinsMarketData}?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=true',
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

  Future<AllTimeCoinMarketData> getHistoricalCoinsMarketData(
    String coinId,
    String from,
    String to,
  ) async {
    try {
      final response = await dio.get(
        '${CoinGeckoApiConstants.allTimeCoinsMarketData(coinId)}?vs_currency=usd&from=$from&to=$to',
      );

      if (response.statusCode == 200) {
        final allTimeList = await response.data as Map<String, dynamic>;
        final prices = AllTimeCoinMarketData.fromJson(allTimeList);
        return prices;
      } else {
        throw Exception(response.data);
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
