import 'package:crypto_price_tracker_app/domain/entities/crypto_coin/crypto_coin_entity.dart';
import 'package:crypto_price_tracker_app/domain/repositories/crypto_repository.dart';

class GetMostVisited {
  GetMostVisited(this._repository);

  final CryptoRepository _repository;

  Future<List<CryptoCoinEntity>> call() async {
    return await _repository.getMostVisited();
  }
}
