import 'package:crypto_price_tracker_app/domain/entities/crypto_coin/spark_line_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sparkline_in7d.freezed.dart';
part 'sparkline_in7d.g.dart';

@freezed
class SparklineIn7d extends SparkLineEntity with _$SparklineIn7d {
  factory SparklineIn7d({
    List<double>? price,
  }) = _SparklineIn7d;

  factory SparklineIn7d.fromJson(Map<String, dynamic> json) =>
      _$SparklineIn7dFromJson(json);

  factory SparklineIn7d.fromEntity(SparkLineEntity? entity) => SparklineIn7d(
        price: entity?.price,
      );
}
