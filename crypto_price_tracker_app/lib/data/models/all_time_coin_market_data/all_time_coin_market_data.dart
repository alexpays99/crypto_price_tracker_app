import 'package:crypto_price_tracker_app/domain/entities/all_time_coin_market_data/all_time_coin_market_data_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_time_coin_market_data.g.dart';

@JsonSerializable()
class AllTimeCoinMarketData extends AllTimeCoinMarketDataEntity {
  @override
  List<List<num>>? prices;
  @override
  @JsonKey(name: 'market_caps')
  final List<List<num>>? marketCaps;
  @override
  @JsonKey(name: 'total_volumes')
  final List<List<num>>? totalVolumes;

  AllTimeCoinMarketData({
    this.prices,
    this.marketCaps,
    this.totalVolumes,
  });

  factory AllTimeCoinMarketData.fromJson(Map<String, dynamic> json) {
    return _$AllTimeCoinMarketDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllTimeCoinMarketDataToJson(this);

  AllTimeCoinMarketData copyWith({
    List<List<num>>? prices,
    List<List<num>>? marketCaps,
    List<List<num>>? totalVolumes,
  }) {
    return AllTimeCoinMarketData(
      prices: prices ?? this.prices,
      marketCaps: marketCaps ?? this.marketCaps,
      totalVolumes: totalVolumes ?? this.totalVolumes,
    );
  }
}
