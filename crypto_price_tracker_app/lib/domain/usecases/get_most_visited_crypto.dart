import 'package:crypto_price_tracker_app/domain/entities/trending/datum.dart';
import 'package:crypto_price_tracker_app/domain/repositories/crypto_repository.dart';

class GetMostVisited {
  GetMostVisited(this._repository);

  final CryptoRepository _repository;

  Future<List<DatumEntity>> call() async {
    return await _repository.getMostVisited();
  }
}
