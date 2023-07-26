import 'package:crypto_price_tracker_app/domain/entities/trending/usd.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'usd.freezed.dart';
part 'usd.g.dart';

@freezed
class Usd extends UsdEntity with _$Usd {
  factory Usd({
    double? price,
    int? volume24h,
    double? percentChange1h,
    double? percentChange24h,
    double? percentChange7d,
    int? marketCap,
    DateTime? lastUpdated,
  }) = _Usd;

  factory Usd.fromJson(Map<String, dynamic> json) => _$UsdFromJson(json);
}
