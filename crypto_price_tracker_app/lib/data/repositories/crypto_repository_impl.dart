import 'package:crypto_price_tracker_app/data/services/crypto_service.dart';
import 'package:crypto_price_tracker_app/domain/entities/crypto_coin/crypto_coin_entity.dart';
import 'package:crypto_price_tracker_app/domain/repositories/crypto_repository.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  CryptoRepositoryImpl({required this.cryptoService});

  final CryptoService cryptoService;

  @override
  Future<List<CryptoCoinEntity>> getMostVisited() {
    return cryptoService.getMostVisited();
  }
}
