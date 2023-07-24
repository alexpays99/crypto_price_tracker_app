import 'package:freezed_annotation/freezed_annotation.dart';

part 'usd.freezed.dart';
part 'usd.g.dart';

@freezed
class Usd with _$Usd {
  factory Usd({
    double? price,
    @JsonKey(name: 'volume_24h') int? volume24h,
    @JsonKey(name: 'percent_change_1h') double? percentChange1h,
    @JsonKey(name: 'percent_change_24h') double? percentChange24h,
    @JsonKey(name: 'percent_change_7d') double? percentChange7d,
    @JsonKey(name: 'market_cap') int? marketCap,
    @JsonKey(name: 'last_updated') DateTime? lastUpdated,
  }) = _Usd;

  factory Usd.fromJson(Map<String, dynamic> json) => _$UsdFromJson(json);
}
