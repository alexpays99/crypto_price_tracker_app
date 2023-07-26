import 'package:crypto_price_tracker_app/data/services/crypto_service.dart';
import 'package:crypto_price_tracker_app/domain/entities/trending/datum.dart';
import 'package:crypto_price_tracker_app/domain/repositories/crypto_repository.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  CryptoRepositoryImpl({required this.cryptoService});

  final CryptoService cryptoService;

  @override
  Future<List<DatumEntity>> getMostVisited() {
    return cryptoService.getMostVisited();
  }
}
