import 'package:crypto_price_tracker_app/data/models/crypto_coin/sparkline_in7d.dart';
import 'package:crypto_price_tracker_app/domain/entities/crypto_coin/crypto_coin_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_coin.freezed.dart';
part 'crypto_coin.g.dart';

@freezed
class CryptoCoin extends CryptoCoinEntity with _$CryptoCoin {
  factory CryptoCoin({
    String? id,
    String? symbol,
    String? name,
    String? image,
    @JsonKey(name: 'current_price') dynamic? currentPrice,
    @JsonKey(name: 'market_cap') dynamic? marketCap,
    @JsonKey(name: 'market_cap_rank') dynamic? marketCapRank,
    @JsonKey(name: 'fully_diluted_valuation') dynamic? fullyDilutedValuation,
    @JsonKey(name: 'total_volume') dynamic? totalVolume,
    @JsonKey(name: 'high_24h') dynamic? high24h,
    @JsonKey(name: 'low_24h') dynamic? low24h,
    @JsonKey(name: 'price_change_24h') dynamic? priceChange24h,
    @JsonKey(name: 'price_change_percentage_24h')
    dynamic? priceChangePercentage24h,
    @JsonKey(name: 'market_cap_change_24h') dynamic? marketCapChange24h,
    @JsonKey(name: 'market_cap_change_percentage_24h')
    dynamic? marketCapChangePercentage24h,
    @JsonKey(name: 'circulating_supply') dynamic? circulatingSupply,
    @JsonKey(name: 'total_supply') dynamic? totalSupply,
    @JsonKey(name: 'max_supply') dynamic? maxSupply,
    dynamic? ath,
    @JsonKey(name: 'ath_change_percentage') dynamic? athChangePercentage,
    @JsonKey(name: 'ath_date') DateTime? athDate,
    double? atl,
    @JsonKey(name: 'atl_change_percentage') dynamic? atlChangePercentage,
    @JsonKey(name: 'atl_date') DateTime? atlDate,
    dynamic roi,
    @JsonKey(name: 'last_updated') DateTime? lastUpdated,
    @JsonKey(name: 'sparkline_in_7d') SparklineIn7d? sparklineIn7d,
  }) = _CryptoCoin;

  factory CryptoCoin.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinFromJson(json);

  factory CryptoCoin.fromEntity(CryptoCoinEntity entity) => CryptoCoin(
        id: entity.id,
        symbol: entity.symbol,
        name: entity.name,
        image: entity.image,
        currentPrice: entity.currentPrice,
        marketCap: entity.marketCap,
        marketCapRank: entity.marketCapRank,
        fullyDilutedValuation: entity.fullyDilutedValuation,
        totalVolume: entity.totalVolume,
        high24h: entity.high24h,
        low24h: entity.low24h,
        priceChange24h: entity.priceChange24h,
        priceChangePercentage24h: entity.priceChangePercentage24h,
        marketCapChange24h: entity.marketCapChange24h,
        marketCapChangePercentage24h: entity.marketCapChangePercentage24h,
        circulatingSupply: entity.circulatingSupply,
        totalSupply: entity.totalSupply,
        maxSupply: entity.maxSupply,
        ath: entity.ath,
        athChangePercentage: entity.athChangePercentage,
        athDate: entity.athDate,
        atl: entity.atl,
        atlChangePercentage: entity.atlChangePercentage,
        atlDate: entity.atlDate,
        roi: entity.roi,
        lastUpdated: entity.lastUpdated,
        sparklineIn7d: SparklineIn7d.fromEntity(entity.sparklineIn7d),
      );
}
