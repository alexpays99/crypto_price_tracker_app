import 'package:crypto_price_tracker_app/domain/entities/trending/datum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'quote.dart';

part 'datum.freezed.dart';
part 'datum.g.dart';

@freezed
class Datum extends DatumEntity with _$Datum {
  factory Datum({
    int? id,
    String? name,
    String? symbol,
    String? slug,
    @JsonKey(name: 'cmc_rank') int? cmcRank,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'is_fiat') dynamic isFiat,
    @JsonKey(name: 'self_reported_circulating_supply')
    dynamic selfReportedCirculatingSupply,
    @JsonKey(name: 'self_reported_market_cap') dynamic selfReportedMarketCap,
    @JsonKey(name: 'num_market_pairs') int? numMarketPairs,
    @JsonKey(name: 'circulating_supply') int? circulatingSupply,
    @JsonKey(name: 'total_supply') int? totalSupply,
    @JsonKey(name: 'max_supply') int? maxSupply,
    @JsonKey(name: 'last_updated') DateTime? lastUpdated,
    @JsonKey(name: 'date_added') DateTime? dateAdded,
    List<String>? tags,
    dynamic platform,
    Quote? quote,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  factory Datum.fromEntity(DatumEntity entity) => Datum(
        id: entity.id,
        name: entity.name,
        symbol: entity.symbol,
        slug: entity.slug,
        cmcRank: entity.cmcRank,
        numMarketPairs: entity.numMarketPairs,
        circulatingSupply: entity.circulatingSupply,
        totalSupply: entity.totalSupply,
        maxSupply: entity.maxSupply,
        lastUpdated: entity.lastUpdated,
        dateAdded: entity.dateAdded,
        tags: entity.tags,
        platform: entity.platform,
        quote: entity.quote as Quote,
      );
}
