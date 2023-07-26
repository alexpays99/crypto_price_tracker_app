import 'package:crypto_price_tracker_app/data/models/trending/datum.dart';
import 'package:crypto_price_tracker_app/data/models/trending/trending.dart';
import 'package:dio/dio.dart';

class CryptoService {
  CryptoService({
    required this.dio,
  });

  final Dio dio;

  Future<List<Datum>> getMostVisited() async {
    final headers = {
      "X-CMC_PRO_API_KEY": "b54bcf4d-1bca-4e8e-9a24-22ff2c3d462c",
      "Accept": "*/*",
    };
    try {
      final response = await dio.get(
        'https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/trending/most-visited?start=1&limit=100&time_period=24h',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final trendingCryptoList =
            Trending.fromJson(response.data).data?.data ?? [];
        return trendingCryptoList;
      } else {
        throw Exception(response.data);
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
