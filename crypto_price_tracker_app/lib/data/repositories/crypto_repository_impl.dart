import 'package:crypto_price_tracker_app/data/services/crypto_service.dart';
import 'package:crypto_price_tracker_app/domain/entities/all_time_coin_market_data/all_time_coin_market_data_entity.dart';
import 'package:crypto_price_tracker_app/domain/entities/crypto_coin/crypto_coin_entity.dart';
import 'package:crypto_price_tracker_app/domain/repositories/crypto_repository.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  CryptoRepositoryImpl({required this.cryptoService});

  final CryptoService cryptoService;

  @override
  Future<List<CryptoCoinEntity>> getMostVisited() {
    return cryptoService.getMostVisited();
  }

  @override
  Future<AllTimeCoinMarketDataEntity> getHistoricalCoinsMarketData(
    String coinId,
    String from,
    String to,
  ) {
    return cryptoService.getHistoricalCoinsMarketData(coinId, from, to);
  }
}
