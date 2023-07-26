import 'package:crypto_price_tracker_app/domain/entities/trending/datum.dart';

abstract class CryptoRepository {
  Future<List<DatumEntity>> getMostVisited();
}
