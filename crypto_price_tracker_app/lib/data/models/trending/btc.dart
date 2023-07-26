import 'package:crypto_price_tracker_app/domain/entities/trending/btc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'btc.freezed.dart';
part 'btc.g.dart';

@freezed
class Btc extends BtcEntity with _$Btc {
  factory Btc({
    int? price,
    int? volume24h,
    dynamic percentChange1h,
    dynamic percentChange24h,
    dynamic percentChange7d,
    int? marketCap,
    DateTime? lastUpdated,
  }) = _Btc;

  factory Btc.fromJson(Map<String, dynamic> json) => _$BtcFromJson(json);
}
