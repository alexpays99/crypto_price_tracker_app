import 'package:crypto_price_tracker_app/domain/entities/trending/btc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'btc.freezed.dart';
part 'btc.g.dart';

@freezed
class Btc extends BtcEntity with _$Btc {
  factory Btc({
    int? price,
    @JsonKey(name: 'volume_24h') int? volume24h,
    @JsonKey(name: 'percent_change_1h') dynamic percentChange1h,
    @JsonKey(name: 'percent_change_24h') dynamic percentChange24h,
    @JsonKey(name: 'percent_change_7d') dynamic percentChange7d,
    @JsonKey(name: 'market_cap') int? marketCap,
    @JsonKey(name: 'last_updated') DateTime? lastUpdated,
  }) = _Btc;

  factory Btc.fromJson(Map<String, dynamic> json) => _$BtcFromJson(json);
}
