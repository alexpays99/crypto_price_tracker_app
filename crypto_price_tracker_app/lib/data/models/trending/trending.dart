import 'package:crypto_price_tracker_app/domain/entities/trending/trending.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';
import 'status.dart';

part 'trending.freezed.dart';
part 'trending.g.dart';

@freezed
class Trending extends TrendingEntity with _$Trending {
  factory Trending({
    Status? status,
    Data? data,
  }) = _Trending;

  factory Trending.fromJson(Map<String, dynamic> json) =>
      _$TrendingFromJson(json);
}
