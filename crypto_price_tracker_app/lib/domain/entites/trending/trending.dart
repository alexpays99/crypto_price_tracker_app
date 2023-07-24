import 'package:freezed_annotation/freezed_annotation.dart';

import 'quote.dart';

part 'trending.freezed.dart';
part 'trending.g.dart';

@freezed
class Trending with _$Trending {
  factory Trending({
    int? id,
    String? name,
    String? symbol,
    String? slug,
    @JsonKey(name: 'cmc_rank') int? cmcRank,
    @JsonKey(name: 'num_market_pairs') int? numMarketPairs,
    @JsonKey(name: 'circulating_supply') int? circulatingSupply,
    @JsonKey(name: 'total_supply') int? totalSupply,
    @JsonKey(name: 'max_supply') int? maxSupply,
    @JsonKey(name: 'last_updated') DateTime? lastUpdated,
    @JsonKey(name: 'date_added') DateTime? dateAdded,
    List<String>? tags,
    dynamic platform,
    Quote? quote,
  }) = _Trending;

  factory Trending.fromJson(Map<String, dynamic> json) =>
      _$TrendingFromJson(json);
}
