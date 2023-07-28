import 'package:crypto_price_tracker_app/domain/entities/crypto_coin/crypto_coin_entity.dart';

abstract class CryptoRepository {
  Future<List<CryptoCoinEntity>> getMostVisited();
}
