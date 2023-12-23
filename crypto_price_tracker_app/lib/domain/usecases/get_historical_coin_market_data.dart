import 'package:crypto_price_tracker_app/domain/entities/all_time_coin_market_data/all_time_coin_market_data_entity.dart';
import 'package:crypto_price_tracker_app/domain/repositories/crypto_repository.dart';

class GetHistoricalCoinMarketData {
  GetHistoricalCoinMarketData(this._repository);

  final CryptoRepository _repository;

  Future<AllTimeCoinMarketDataEntity> call(
    String coinId,
    String from,
    String to,
  ) async {
    return await _repository.getHistoricalCoinsMarketData(coinId, from, to);
  }
}
