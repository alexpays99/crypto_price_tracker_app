import 'package:crypto_price_tracker_app/domain/entities/all_time_coin_market_data/all_time_coin_market_data_entity.dart';
import 'package:crypto_price_tracker_app/domain/entities/crypto_coin/crypto_coin_entity.dart';

abstract class CryptoRepository {
  Future<List<CryptoCoinEntity>> getMostVisited();
  Future<AllTimeCoinMarketDataEntity> getHistoricalCoinsMarketData(
    String coinId,
    String from,
    String to,
  );
}
